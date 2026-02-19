from pynq import Overlay, allocate
import numpy as np
import cv2
import matplotlib.pyplot as plt
import time

BASE = "/home/xilinx/pynq/overlays/Madhavan/"

# Load Overlay
overlay = Overlay(BASE + "madh.bit")
overlay.download()
ip = overlay.real_detector_0
rm = ip.register_map

# Allocate Buffers
IMG_H, IMG_W = 64, 64
image_buf = allocate((IMG_H*IMG_W,), dtype=np.uint8)
conv1_w = allocate((72,), dtype=np.int8)
conv1_b = allocate((8,), dtype=np.int8)
conv2_w = allocate((1152,), dtype=np.int8)
conv2_b = allocate((16,), dtype=np.int8)
conv3_w = allocate((4608,), dtype=np.int8)
conv3_b = allocate((32,), dtype=np.int8)
fc_w = allocate((73728,), dtype=np.int8)
fc_b = allocate((64,), dtype=np.int8)
out_w = allocate((128,), dtype=np.int8)
out_b = allocate((2,), dtype=np.int8)
result = allocate((16,), dtype=np.int32)

# Load Weights
conv1_w[:] = np.load(BASE + "conv1_w.npy").flatten()
conv1_b[:] = np.load(BASE + "conv1_b.npy").flatten()
conv2_w[:] = np.load(BASE + "conv2_w.npy").flatten()
conv2_b[:] = np.load(BASE + "conv2_b.npy").flatten()
conv3_w[:] = np.load(BASE + "conv3_w.npy").flatten()
conv3_b[:] = np.load(BASE + "conv3_b.npy").flatten()
fc_w[:] = np.load(BASE + "fc_w.npy").flatten()
fc_b[:] = np.load(BASE + "fc_b.npy").flatten()
out_w[:] = np.load(BASE + "out_w.npy").flatten()
out_b[:] = np.load(BASE + "out_b.npy").flatten()

for buf in [conv1_w, conv1_b, conv2_w, conv2_b,
            conv3_w, conv3_b, fc_w, fc_b, out_w, out_b]:
    buf.flush()

# Load Image
orig = cv2.imread(BASE + "dog.jpg")
h_img, w_img, _ = orig.shape

# Preprocess
gray = cv2.cvtColor(orig, cv2.COLOR_BGR2GRAY)
gray = cv2.resize(gray, (64, 64))
image_buf[:] = gray.flatten()
image_buf.flush()

# Write 64-bit Addresses
def write_addr(low, high, buf):
    addr = int(buf.physical_address)
    setattr(rm, low, addr & 0xFFFFFFFF)
    setattr(rm, high, (addr >> 32) & 0xFFFFFFFF)

write_addr("image_r_1","image_r_2", image_buf)
write_addr("conv1_w_1","conv1_w_2", conv1_w)
write_addr("conv1_b_1","conv1_b_2", conv1_b)
write_addr("conv2_w_1","conv2_w_2", conv2_w)
write_addr("conv2_b_1","conv2_b_2", conv2_b)
write_addr("conv3_w_1","conv3_w_2", conv3_w)
write_addr("conv3_b_1","conv3_b_2", conv3_b)
write_addr("fc_w_1","fc_w_2", fc_w)
write_addr("fc_b_1","fc_b_2", fc_b)
write_addr("out_w_1","out_w_2", out_w)
write_addr("out_b_1","out_b_2", out_b)
write_addr("result_1","result_2", result)

# Run FPGA + Measure Latency
start = time.time()
rm.CTRL.AP_START = 1
while rm.CTRL.AP_DONE == 0:
    pass
end = time.time()

latency_ms = (end - start) * 1000
fps = 1000 / latency_ms if latency_ms > 0 else 0

result.invalidate()

# Read FPGA Outputs
pred = int(result[0])
cx_fpga = int(result[1])
cy_fpga = int(result[2])
conf = int(result[5])

label = "DOG 🐶" if pred == 1 else "CAT 🐱"

# ===== IMPROVED ACCURATE BOUNDING BOX =====
# Scale center from 64x64 to original resolution
scale_x = w_img / 64.0
scale_y = h_img / 64.0

cx = int(cx_fpga * scale_x)
cy = int(cy_fpga * scale_y)

# Dynamic box size based on confidence + image size
base_size = int(min(w_img, h_img) * 0.45)
conf_factor = min(max(conf / 30000.0, 0.3), 1.0)
box_w = int(base_size * conf_factor)
box_h = int(base_size * conf_factor)

# Ensure box stays inside image
x1 = max(0, cx - box_w // 2)
y1 = max(0, cy - box_h // 2)
x2 = min(w_img, cx + box_w // 2)
y2 = min(h_img, cy + box_h // 2)

# Draw Professional Overlay
output = orig.copy()
cv2.rectangle(output, (x1, y1), (x2, y2), (0,255,0), 3)

# HUD Display
cv2.putText(output, f"Prediction: {label}", (20, 40),
            cv2.FONT_HERSHEY_SIMPLEX, 1, (0,255,0), 2)
cv2.putText(output, f"Confidence: {conf}", (20, 80),
            cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0,255,0), 2)
cv2.putText(output, f"Latency: {latency_ms:.2f} ms", (20, 120),
            cv2.FONT_HERSHEY_SIMPLEX, 0.8, (255,255,0), 2)
cv2.putText(output, f"FPS: {fps:.1f}", (20, 160),
            cv2.FONT_HERSHEY_SIMPLEX, 0.8, (255,255,0), 2)

# Show Result
plt.figure(figsize=(6,6))
plt.title("FPGA Cat/Dog Detection with Accurate Bounding Box")
plt.imshow(cv2.cvtColor(output, cv2.COLOR_BGR2RGB))
plt.axis("off")
plt.show()

# Print Metrics
print("\n===== FINAL FPGA METRICS =====")
print("Prediction:", label)
print("Latency (ms):", round(latency_ms,2))
print("FPS:", round(fps,2))
print("Confidence:", conf)
print("BBox Center (FPGA 64x64):", cx_fpga, cy_fpga)
print("BBox Center (Scaled):", cx, cy)
