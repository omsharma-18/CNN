#CELL 1 
import numpy as np
import time
from pathlib import Path
import matplotlib.pyplot as plt
import matplotlib.patches as patches
from PIL import Image

BASE = Path('/home/xilinx/pynq/overlays/Madhavan')
print('Imports OK')
print(f'Path exists: {BASE.exists()}')

#CELL 2
weight_names = ['conv1_w','conv1_b','conv2_w','conv2_b',
                'conv3_w','conv3_b','fc_w','fc_b','out_w','out_b']

print(f'  {"Name":<10}  {"Saved shape":<22}  {"Size":>8}  dtype')
print('  ' + '-'*55)
for name in weight_names:
    arr = np.load(str(BASE / f'{name}.npy'))
    print(f'  {name:<10}  {str(arr.shape):<22}  {arr.size:>8}  {arr.dtype}')

#CELL 3
# Expected shapes for your HLS CNN: 64x64 input, Conv1(1->8), Conv2(8->16),
# Conv3(16->32), FC(1152->64), Output(64->2)
EXPECTED = {
    'conv1_w': (8,  1,  3, 3),
    'conv1_b': (8,),
    'conv2_w': (16, 8,  3, 3),
    'conv2_b': (16,),
    'conv3_w': (32, 16, 3, 3),
    'conv3_b': (32,),
    'fc_w'   : (64, 1152),
    'fc_b'   : (64,),
    'out_w'  : (2,  64),
    'out_b'  : (2,),
}


def load_weights(base):
    W = {}
    print(f'  {"Name":<10}  {"Saved shape":<22}  {"Used shape":<18}  {"min":>5}  {"max":>5}  nonzero')
    print('  ' + '-'*80)

    for name, target in EXPECTED.items():
        raw = np.load(str(base / f'{name}.npy'))
        saved_shape = raw.shape
        target_size = int(np.prod(target))

        # ── Auto-reshape: handles flat 1D or any wrong shape ──────────────
        if raw.shape == target:
            arr = raw.copy()
        elif raw.size == target_size:
            arr = raw.reshape(target)          # flat or transposed saved
        else:
            raise ValueError(
                f'Weight "{name}" has {raw.size} elements {raw.shape}, '
                f'but need {target_size} elements {target}.'
            )

        # ── Quantize float -> int8 if not already int8 ────────────────────
        if arr.dtype != np.int8:
            a   = arr.astype(np.float32)
            mx  = np.abs(a).max()
            arr = (np.zeros(target, dtype=np.int8) if mx < 1e-8
                   else np.clip(np.round(a * 127.0 / mx), -128, 127).astype(np.int8))

        W[name] = arr
        nz = int((arr != 0).sum())
        print(f'  {name:<10}  {str(saved_shape):<22}  {str(arr.shape):<18}  '
              f'{arr.min():>5}  {arr.max():>5}  {nz}')

    print('\nWeights loaded OK.')
    return W


W = load_weights(BASE)

#CELL 4
# Per-layer shifts (fix for activation vanishing from flat >>8)
CONV1_SHIFT = 5
CONV2_SHIFT = 7
CONV3_SHIFT = 8
FC_SHIFT    = 11
OUT_SHIFT   = 6

CLASS_NAMES = ['Cat', 'Dog']


def conv_layer(inp, weight, bias, shift):
    """
    im2col convolution, valid padding, stride=1.
    inp    : int8  [C_in, H, W]
    weight : int8  [C_out, C_in, KH, KW]
    Returns: int8  [C_out, OH, OW] after ReLU + int8 clamp
    """
    C_in, H, W       = inp.shape
    C_out, _, KH, KW = weight.shape          # <-- this now works because weight is 4D
    OH, OW = H - KH + 1, W - KW + 1

    col = np.lib.stride_tricks.as_strided(
        inp,
        shape   = (C_in, KH, KW, OH, OW),
        strides = (inp.strides[0],
                   inp.strides[1], inp.strides[2],
                   inp.strides[1], inp.strides[2]),
    ).reshape(C_in * KH * KW, OH * OW).astype(np.int32)

    w2d  = weight.reshape(C_out, -1).astype(np.int32)
    acc  = w2d @ col
    acc += bias.astype(np.int32)[:, None] << shift
    return np.clip(acc >> shift, 0, 127).astype(np.int8).reshape(C_out, OH, OW)


def maxpool_layer(inp):
    """2x2 max pool stride=2. inp: int8 [C,H,W]
    Auto-crops odd H/W to even before pooling.
    e.g. [16,29,29] -> crop to [16,28,28] -> pool -> [16,14,14]
    """
    C, H, W = inp.shape
    H2, W2  = (H // 2) * 2, (W // 2) * 2   # round down to nearest even
    inp     = inp[:, :H2, :W2]              # crop if H or W was odd
    return inp.reshape(C, H2//2, 2, W2//2, 2).max(axis=(2, 4)).astype(np.int8)


def fc_layer(inp, weight, bias, shift, relu=True):
    """FC layer. inp: int8 [N], weight: int8 [M,N]"""
    acc  = weight.astype(np.int32) @ inp.astype(np.int32)
    acc += bias.astype(np.int32) << shift
    out  = acc >> shift
    return np.clip(out, 0, 127).astype(np.int8) if relu \
           else np.clip(out, -128, 127).astype(np.int8)


def output_layer(inp, weight, bias, shift):
    """Final layer, returns raw int32 logits."""
    acc  = weight.astype(np.int32) @ inp.astype(np.int32)
    acc += bias.astype(np.int32) << shift
    return (acc >> shift).astype(np.int32)


def softmax_layer(logits):
    x = logits.astype(np.float32); x -= x.max()
    e = np.exp(x); return e / e.sum()


def bbox_layer(pool3):
    """Weighted centroid bbox from pool3 [32,6,6] in image coords [64,64]."""
    act   = np.maximum(pool3.astype(np.float32), 0)
    heat  = act.sum(axis=0)   # [6,6]
    total = heat.sum()
    if total < 1e-6:
        return dict(x1=0, y1=0, x2=64, y2=64, cx=32.0, cy=32.0, max_act=0.0)
    ys = np.arange(6, dtype=np.float32)
    xs = np.arange(6, dtype=np.float32)
    cx = float((heat * xs[None, :]).sum() / total) * (64/6)
    cy = float((heat * ys[:, None]).sum() / total) * (64/6)
    half = int(min(8 + int(act.max() / 16), 30))
    return dict(
        x1=int(np.clip(cx-half,0,64)), y1=int(np.clip(cy-half,0,64)),
        x2=int(np.clip(cx+half,0,64)), y2=int(np.clip(cy+half,0,64)),
        cx=cx, cy=cy, max_act=float(act.max())
    )


print('All layer functions ready.')

#CELL 5
def preprocess(path):
    """Load JPG -> grayscale -> 64x64 -> int8 [1,64,64]"""
    img = Image.open(str(path)).convert('L').resize((64,64), Image.BILINEAR)
    u8  = np.array(img, dtype=np.uint8)
    s8  = (u8.astype(np.int16) - 128).astype(np.int8)[None]   # [1,64,64]
    return u8, s8


def infer(img_s8, W, debug=False):
    """Full forward pass. img_s8: int8 [1,64,64]"""
    t0 = time.perf_counter()

    c1 = conv_layer(img_s8, W['conv1_w'], W['conv1_b'], CONV1_SHIFT)   # [8,62,62]
    p1 = maxpool_layer(c1)                                              # [8,31,31]
    c2 = conv_layer(p1,     W['conv2_w'], W['conv2_b'], CONV2_SHIFT)   # [16,29,29]
    p2 = maxpool_layer(c2)                                              # [16,14,14]
    c3 = conv_layer(p2,     W['conv3_w'], W['conv3_b'], CONV3_SHIFT)   # [32,12,12]
    p3 = maxpool_layer(c3)                                              # [32,6,6]
    flat   = p3.flatten()                                               # [FC_IN — auto-sized]
    FC_IN  = flat.size                                                   # compute from actual pool3
    # Reshape fc_w to match actual flat size if needed
    fc_w = W['fc_w']
    if fc_w.shape[1] != FC_IN:
        print(f'  ⚠ fc_w shape {fc_w.shape} vs flat size {FC_IN} — truncating/padding fc_w')
        # If flat is smaller, slice fc_w columns; if larger, pad with zeros
        if FC_IN < fc_w.shape[1]:
            fc_w = fc_w[:, :FC_IN]
        else:
            pad  = np.zeros((fc_w.shape[0], FC_IN - fc_w.shape[1]), dtype=np.int8)
            fc_w = np.concatenate([fc_w, pad], axis=1)
    fc     = fc_layer(flat, fc_w, W['fc_b'], FC_SHIFT, relu=True)       # [64]
    logits = output_layer(fc, W['out_w'], W['out_b'], OUT_SHIFT)        # [2]

    probs      = softmax_layer(logits)
    class_id   = int(np.argmax(probs))
    confidence = float(probs[class_id])
    bbox       = bbox_layer(p3)
    ms         = (time.perf_counter() - t0) * 1000

    layers = dict(c1=c1, p1=p1, c2=c2, p2=p2, c3=c3, p3=p3, flat=flat, fc=fc)

    if debug:
        print(f'\n  {"Layer":<8}  {"Shape":<14}  {"Min":>5}  {"Max":>5}  {"Mean":>7}  Nonzero')
        print('  ' + '-'*60)
        for nm, arr in layers.items():
            fl = arr.flatten().astype(np.float32)
            nz = int((fl!=0).sum())
            print(f'  {nm:<8}  {str(arr.shape):<14}  '
                  f'{int(fl.min()):>5}  {int(fl.max()):>5}  '
                  f'{fl.mean():>+7.2f}  {nz} ({100*nz/len(fl):.1f}%)')
        print(f'\n  logits : {logits}')
        print(f'  probs  : {np.round(probs,4)}')
        if c1.max() == 0: print('  ⚠  conv1 all zeros -> check conv1_w.npy')
        if p3.max() == 0: print('  ⚠  pool3 all zeros -> reduce SHIFT values')
        if fc.max()  == 0: print('  ⚠  fc all zeros    -> FC_SHIFT too large')

    return dict(class_id=class_id, class_name=CLASS_NAMES[class_id],
                confidence=confidence, probs=probs, logits=logits,
                bbox=bbox, latency_ms=ms, layers=layers)


print('preprocess() and infer() ready.')

#CELL 6
# ── Results table header ────────────────────────────────────────────────
print(f'  {"Image":<12}  {"Class":<16}  {"Conf":>7}  {"L[0]":>7}  {"L[1]":>7}  {"ms":>7}  {"FPS":>7}')
print('  ' + '-'*75)

all_r = {}

# ── Inference loop ─────────────────────────────────────────────────────
for fname in ['dog.jpg']:
    p = BASE / fname
    if not p.exists():
        print(f'  {fname:<12}  NOT FOUND')
        continue

    u8, s8 = preprocess(p)
    r = infer(s8, W)

    # FPS computation
    r["fps"] = 1000.0 / max(r["latency_ms"], 1e-6)

    all_r[fname] = (u8, r)

    print(f'  {fname:<12}  {r["class_name"]:<16}  '
          f'{r["confidence"]:>6.1%}  '
          f'{r["logits"][0]:>7}  {r["logits"][1]:>7}  '
          f'{r["latency_ms"]:>6.2f}  '
          f'{r["fps"]:>6.1f}')

# ── Color output visualization ─────────────────────────────────────────
n = len(all_r)
fig, axes = plt.subplots(1, n, figsize=(6*n, 6))
fig.patch.set_facecolor('#1a1a2e')
if n == 1:
    axes = [axes]

for ax, (fname, (u8_gray, r)) in zip(axes, all_r.items()):

    # Load full color image
    orig_color = np.array(Image.open(str(BASE / fname)).convert('RGB'))
    OH, OW = orig_color.shape[:2]

    # Scale bbox from 64x64 → original resolution
    bb = r['bbox']
    sx, sy = OW / 64.0, OH / 64.0

    bx1 = max(0, int(bb['x1'] * sx))
    by1 = max(0, int(bb['y1'] * sy))
    bx2 = min(OW, int(bb['x2'] * sx))
    by2 = min(OH, int(bb['y2'] * sy))

    bcx = int(np.clip(bb['cx'] * sx, 0, OW))
    bcy = int(np.clip(bb['cy'] * sy, 0, OH))

    bx2 = max(bx1 + 2, bx2)
    by2 = max(by1 + 2, by2)

    # Box styling
    BOX_COLOR = (0, 230, 80) if r['class_id'] == 1 else (220, 30, 30)
    LW = max(2, int(min(OH, OW) / 120))

    overlay = orig_color.copy()

    # Filled region
    overlay[by1:by2, bx1:bx2] = (
        overlay[by1:by2, bx1:bx2].astype(np.float32) * 0.65 +
        np.array(BOX_COLOR, dtype=np.float32) * 0.35
    ).clip(0, 255).astype(np.uint8)

    # Border
    overlay[by1:by1+LW, bx1:bx2] = BOX_COLOR
    overlay[by2-LW:by2, bx1:bx2] = BOX_COLOR
    overlay[by1:by2, bx1:bx1+LW] = BOX_COLOR
    overlay[by1:by2, bx2-LW:bx2] = BOX_COLOR

    # Crosshair
    ch = max(10, LW * 5)
    overlay[max(0,bcy-ch):min(OH,bcy+ch), max(0,bcx-LW):min(OW,bcx+LW)] = BOX_COLOR
    overlay[max(0,bcy-LW):min(OH,bcy+LW), max(0,bcx-ch):min(OW,bcx+ch)] = BOX_COLOR

    ax.imshow(overlay)

    # Label (includes FPS)
    label = f"{r['class_name']} {r['confidence']:.1%} | {r['fps']:.1f} FPS"
    ax.text(
        bx1, max(by1 - 5, 12),
        label,
        color='white',
        fontsize=9,
        fontweight='bold',
        bbox=dict(
            boxstyle='square,pad=0.2',
            facecolor=tuple(c/255 for c in BOX_COLOR),
            edgecolor='none',
            alpha=0.9
        )
    )

    ax.set_title(
        f'{fname}\nlogits={r["logits"]}  {r["latency_ms"]:.1f} ms',
        fontsize=10,
        color='white'
    )

    ax.set_facecolor('#1a1a2e')
    ax.axis('off')

plt.suptitle(
    'CPU Inference — Color Output with FPS',
    fontsize=13,
    fontweight='bold',
    color='white',
    y=1.02
)

plt.tight_layout()
out_path = '/tmp/all_results_color_fps.png'
plt.savefig(out_path, dpi=150, bbox_inches='tight', facecolor=fig.get_facecolor())
plt.show()

print(f'Saved to {out_path}')