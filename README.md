<div align="center">

![Platform](https://img.shields.io/badge/Platform-PYNQ--Z2%20%7C%20Zynq--7000-orange?style=for-the-badge)
![HLS](https://img.shields.io/badge/HLS-Vitis%20HLS-blue?style=for-the-badge)
![Framework](https://img.shields.io/badge/Framework-PYNQ%20v2.7-green?style=for-the-badge)
![Language](https://img.shields.io/badge/Language-HLS%20C%2B%2B%20%7C%20Python-yellow?style=for-the-badge)

</div>

---

## 📌 Project Overview

This project implements a **hardware-accelerated Convolutional Neural Network (CNN)** for real-time image classification (Cat vs. Dog) on a **Xilinx Zynq System-on-Chip (SoC)**. By utilizing hardware/software co-design, compute-intensive CNN operations are offloaded from the CPU to the FPGA fabric. The goal is to achieve real-time inference and quantitatively demonstrate performance improvements over a standard software-only execution.

### Why FPGA Acceleration?

| Concern | CPU-Only | FPGA-Accelerated |
|---|---|---|
| Inference Latency | High (~50 ms on ARM) | Low (target < 5 ms) |
| Parallelism | Sequential, SIMD limited | Massive spatial parallelism |
| Power Efficiency | Moderate | Optimized inference-only pipeline |
| Deployability | Flexible | Fixed but ultra-efficient |

### Key Contributions

- Custom **3-layer quantized CNN** (int8 weights) designed for FPGA resource constraints
- Full **Vitis HLS** implementation with AXI4 master interfaces and BRAM-optimized data flow
- Hardware/software co-design using **PYNQ Python overlay** for seamless PS–PL communication
- Quantitative benchmarking: **FPGA inference vs. ARM CPU baseline**
- End-to-end pipeline: dataset → training (Colab) → int8 quantization → HLS synthesis → PYNQ deployment

---

## 🏗️ System Architecture

The design partitions functionality across the Zynq SoC's heterogeneous architecture to maximize efficiency:

**Processing System (PS) — ARM Cortex-A9 Core:**
- Handles image capture and preprocessing using OpenCV
- Manages control logic, system integration, and post-processing
- Runs the Jupyter Notebook/Python environment via PYNQ framework

**Programmable Logic (PL) — FPGA Fabric:**
- Accelerates heavy mathematical CNN operations (convolution, activation, max-pooling)
- Implemented via a custom IP block generated using Vitis HLS (C++ to RTL)

```
┌─────────────────────────────────────────────────────────────────────┐
│                        PYNQ-Z2 Zynq-7000 SoC                        │
│                                                                     │
│   ┌──────────────────────────┐      ┌───────────────────────────┐   │
│   │   Processing System (PS) │      │  Programmable Logic (PL)  │   │
│   │   ARM Cortex-A9 @ 650MHz │      │                           │   │
│   │                          │      │  ┌─────────────────────┐  │   │
│   │  ① Image Load (OpenCV)   │      │  │   real_detector_0   │  │   │
│   │  ② Grayscale + Resize    │ AXI4 │  │                     │  │   │
│   │     (64×64)              │◄────►│  │  Conv1 (1→8)  + ReLU│  │   │
│   │  ③ Write addr to AXI-Lite│      │  │  MaxPool 2×2        │  │   │
│   │  ④ Trigger AP_START      │      │  │  Conv2 (8→16) + ReLU│  │   │
│   │  ⑤ Poll AP_DONE          │      │  │  MaxPool 2×2        │  │   │
│   │  ⑥ Read result[0..8]     │      │  │  Conv3 (16→32)+ReLU │  │   │
│   │  ⑦ Draw BBox + Display   │      │  │  MaxPool 2×2        │  │   │
│   │                          │      │  │  FC (1152→64→2)     │  │   │
│   └──────────────────────────┘      │  │  ArgMax + BBox      │  │   │
│                                     │  └─────────────────────┘  │   │
│                 DDR3 SDRAM          │                           │   │
│         (shared PS-PL memory)       │   AXI SmartConnect ×3     │   │
└─────────────────────────────────────────────────────────────────────┘
```

### Vivado Block Design


![Block_Diagram](https://github.com/user-attachments/assets/b98425f5-a3ca-41f8-8e3e-319d1dc87dfe)



The block design connects the ZYNQ7 Processing System to the `real_detector_0` HLS IP via three AXI SmartConnect blocks — one per HP slave port — enabling concurrent DMA bursts for image, weight, and result buffers from separate DDR regions.

### Data Flow

![dataflow](https://github.com/user-attachments/assets/cce09a51-ea53-4d9e-82ec-e42c38ecb0fb)

---

## 📂 Repository Structure

```
hw-accelerated-cnn-zynq/
│
├── dataset/                        # Raw or preprocessed image data
│   ├── cat/                        # Images of cats
│   ├── dog/                        # Images of dogs
│   └── sample/                     # Quick-test sample images
│
├── model/                          # Trained models and exported weights
│    ├── conv1_w.npy  conv1_b.npy
│    ├── conv2_w.npy  conv2_b.npy
│    ├── conv3_w.npy  conv3_b.npy
│    ├── fc_w.npy     fc_b.npy
│    └── out_w.npy    out_b.npy
│
├── vitis_hls/                      # High-Level Synthesis C/C++ code
│   ├──  cnn_detector.cpp           # Core CNN hardware accelerator logic
│   └──  cnn_detector.h             # Header file with architecture constants & pragmas
│
├── vivado/                         # Hardware design files and bitstreams
│   ├── block_diagram.jpeg           # Visual export of the IP integrator block design
│   ├── wrapper.v                   # Top-level Verilog HDL wrapper
│   ├── madh.bit                    # Compiled bitstream file for the FPGA
│   └── madh.hwh                    # Hardware handoff file (required for PYNQ)
│
├── software/                       # Embedded software and Jupyter notebooks
│   ├── fpga_inference.ipynb        # Hardware-accelerated execution using the bitstream
│   └── cpu_inference.ipynb         # Baseline software-only CNN execution on ARM
│
├── docs/                           # Project documentation
│   ├── final_report.pdf            # Full project report
│   ├── system_architecture.jpeg     # HW/SW partitioning diagram
│   └── replication_guide.md        # Step-by-step setup instructions
│
├── output/                         # Project deliverables and demonstrations
│   ├── screenshot.jpeg              # Screenshot of working inference + bounding box
│   ├── resource_utilization_report.txt    # Vivado utilization screenshot
│   └── demo_video_link.mp4              # Live demonstration of real-time inference
│
└── README.md
```

---

## 🧠 CNN Model Design

### Network Topology

| Layer | Type | Input Shape | Output Shape | Params |
|---|---|---|---|---|
| Conv1 | Conv2D 3×3, 8 filters | 64×64×1 | 62×62×8 | 72 W + 8 B |
| Pool1 | MaxPool 2×2 | 62×62×8 | 31×31×8 | — |
| Conv2 | Conv2D 3×3, 16 filters | 31×31×8 | 29×29×16 | 1152 W + 16 B |
| Pool2 | MaxPool 2×2 | 29×29×16 | 14×14×16 | — |
| Conv3 | Conv2D 3×3, 32 filters | 14×14×16 | 12×12×32 | 4608 W + 32 B |
| Pool3 | MaxPool 2×2 | 12×12×32 | 6×6×32 | — |
| FC1 | Dense + ReLU | 1152 | 64 | 73728 W + 64 B |
| FC2 (Out) | Dense | 64 | 2 | 128 W + 2 B |

**Total Parameters:** ~79,810  
**Weight Precision:** int8 (post-training quantization from float32)  
**Activation:** ReLU (clipped to int16 on FPGA)  
**Output:** ArgMax over 2 classes → {Cat, Dog}

### Training Pipeline

```
Kaggle Cat/Dog Dataset
        │
        ▼
   Colab (PyTorch)
   - Resize to 64×64 grayscale
   - Train float32 CNN (~20 epochs)
   - Validate accuracy
        │
        ▼
  Post-Training Quantization
   - Scale weights to int8
   - Save as .npy arrays
        │
        ▼
  FPGA Deployment
```

---

## ⚙️ HLS Implementation Details

### Fixed-Point Arithmetic

All weights are `ap_int<8>`, intermediate accumulations use `ap_int<32>`, and feature maps are stored as `ap_int<16>`. A right-shift by `SCALE_SHIFT=3` replaces floating-point division, avoiding DSP-heavy division logic.

```cpp
static inline ap_int<16> relu16(ap_int<32> x) {
    if (x < 0)     return 0;
    if (x > 32767) return 32767;
    return (ap_int<16>)x;
}
// After accumulation:
conv1_buf[y][x][f] = relu16(sum >> SCALE_SHIFT);
```

### Memory Architecture

- **Image & feature maps** → BRAM (on-chip, low latency)
- **Conv1 weights** → fully unrolled into registers (zero-cycle access)
- **Conv2/3, FC weights** → BRAM with pipelined access

```
BRAM Budget:
  img_buf     64×64×1 B    =   4 KB
  conv1_buf   62×62×8×2 B  =  61 KB
  pool1       31×31×8×2 B  =  15 KB
  conv2_buf   29×29×16×2 B =  27 KB
  pool2       14×14×16×2 B =   6 KB
  conv3_buf   12×12×32×2 B =   9 KB
  pool3        6× 6×32×2 B =   2 KB
```

### Pipeline & Parallelism

Each weight array has its own dedicated AXI master bundle, enabling parallel DDR bursts without bus contention. Inner spatial loops are pipelined at `II=1`; 3×3 kernel loops are fully unrolled, giving **9-way MAC parallelism** per filter per cycle.

```cpp
CONV1_F: for(int f = 0; f < CONV1_FILTERS; f++) {
    #pragma HLS PIPELINE II=1
    CONV1_KY: for(int ky = 0; ky < 3; ky++) {
        CONV1_KX: for(int kx = 0; kx < 3; kx++) {
            #pragma HLS UNROLL   // 9 MACs in parallel
            sum += pix * w1[f][0][ky][kx];
        }
    }
}
```

### FPGA Output Format

The HLS core writes 9 integers to shared DDR memory:

```
result[0]  → predicted class     (0 = Cat,  1 = Dog)
result[1]  → bounding box cx     (in 64×64 space)
result[2]  → bounding box cy     (in 64×64 space)
result[3]  → bounding box width
result[4]  → bounding box height
result[5]  → confidence score
result[6]  → raw score: class 0 (Cat)
result[7]  → raw score: class 1 (Dog)
result[8]  → 0xC0FFEE42          (magic number / sanity check)
```

---

## 🛠️ Hardware & Software Requirements

### Hardware
- Xilinx Zynq-based development board (PYNQ-Z2 / PYNQ-Z1 / ZCU104 / ZedBoard)
- USB Web Camera (for live inference) or local image dataset
- MicroSD card with PYNQ Linux image flashed

### Software
- AMD Xilinx Vivado Design Suite (block design and bitstream generation)
- Vitis HLS (synthesizing C++ into IP block)
- Jupyter Notebook (running locally on the Zynq board)
- OpenCV & Python 3 (image preprocessing and bounding boxes)

---

## 🚀 Getting Started

### 1. Hardware Generation (Synthesizing the IP)

Open Vitis HLS and create a new project using the source files in `vitis_hls/`. Run **C Synthesis** and **Export the RTL** as an IP catalog. Open Vivado, create a Block Design, and integrate the Zynq Processing System with your custom CNN IP. Run Synthesis, Implementation, and **Generate Bitstream**. Export the `.bit` and `.hwh` files into the `vivado/` directory.

### 2. Board Setup

Boot your Zynq board and connect it to your network. Clone or upload this repository into the Jupyter workspace on the board. Ensure `.bit` and `.hwh` files are placed alongside the notebooks.

```bash
mkdir -p /home/xilinx/pynq/overlays/Madhavan/
cp vivado/madh.bit  /home/xilinx/pynq/overlays/Madhavan/
cp vivado/madh.hwh  /home/xilinx/pynq/overlays/Madhavan/
cp model/weights/*.npy /home/xilinx/pynq/overlays/Madhavan/
```

### 3. Running Inference

**CPU Baseline:** Open `software/cpu_inference.ipynb` and run all cells to observe standard ARM processor performance.

**FPGA Accelerated:** Open `software/fpga_inference.py` to program the FPGA fabric with the custom hardware and execute accelerated inference.

Expected terminal output from FPGA run:

```
===== FINAL FPGA METRICS =====
Prediction: DOG 🐶
Latency (ms): 12.34
FPS: 81.0
Confidence: 18420
BBox Center (FPGA 64x64): 35 28
BBox Center (Scaled): 280 224
```

---

## 📊 Performance Analysis

A core objective of this project is to quantitatively compare the hardware accelerator against the CPU.

### Latency & Throughput

| Metric | CPU-Only (ARM) | FPGA-Accelerated (Zynq PL) | Improvement |
|---|---|---|---|
| Latency | ~42.8 ms | ~3.38 ms | **> 12× Speedup** |
| Throughput | ~20 to 24 ms | ~295 ms  | **> 10× Speedup** |
| Estimated Power | ~ 4W | ~2.36 W | low power consumption |

> Replace placeholder values with actual results after final testing. Benchmark scripts: `software/cpu_inference.ipynb` and `software/fpga_inference.ipynb`.

Vivado v2023.1 — Post-Implementation Report — Device: xc7z020clg400-1 — Date: 19 Feb 2026

| Resource | Used | Available | Utilization |
|---|---|---|---|
| Slice LUTs | 27,588 | 53,200 | **51.86%** |
| LUT as Logic | 23,560 | 53,200 | 44.29% |
| LUT as Memory | 4,028 | 17,400 | 23.15% |
| Slice Registers (FF) | 34,603 | 106,400 | **32.52%** |
| Slices | 11,507 | 13,300 | **86.52%** |
| BRAM Tiles | 140 | 140 | **100%** ⚠️ |
| DSP48 | 220 | 220 | **100%** ⚠️ |
| BUFG (Clocking) | 1 | 32 | 3.13% |

> ⚠️ **BRAM and DSP are fully saturated** — the design maximally utilizes all available Block RAM and DSP48 slices on the xc7z020. This confirms the CNN is pushing the hardware to its limits. Any further scaling (more filters, deeper network) would require a larger Zynq device.

Screenshot: [`output/resource_utilization.png`](output/resource_utilization.png)

---

## 🎥 Demonstration

Check the `output/` directory for a live demonstration of the system in action.

- **`video_demo.mp4`** — Full walkthrough of real-time edge AI object detection on the PYNQ-Z2
- **`screenshot.png`** — Static capture of the bounding box and classification output

The demo shows: board booting with overlay loaded → image fed through FPGA pipeline → bounding box drawn on original-resolution image → HUD overlay with prediction label, latency, FPS, and confidence score → side-by-side CPU vs FPGA timing comparison.

---

## 🎓 Learning Outcomes

- Implementation of lightweight Convolutional Neural Networks on edge devices
- Translation of software algorithms (C++) into digital hardware (RTL) using High-Level Synthesis
- Understanding of hardware/software partitioning to optimize latency, throughput, and power efficiency
- Practical experience with AXI4 interfaces, BRAM optimization, and fixed-point arithmetic on FPGAs
- Performance analysis and benchmarking of heterogeneous SoC designs

---

## 👥 Team

| Name | 
|---|
| Madhavan R | 
| Om Sharma M | 
| Balaji K |  

**College Name:** Saveetha Engineering College 

**Event:** BHARAT AI-SoC STUDENT CHALLENGE
A Project-based Virtual Challenge to Ignite Innovation
in AI-driven System-on-Chip (SoC) Design

---

## 📚 References

- [PYNQ Documentation](https://pynq.readthedocs.io)
- [Vitis HLS User Guide UG1399](https://docs.xilinx.com/r/en-US/ug1399-vitis-hls)
- [PYNQ-Z2 Reference Manual](https://www.tulembedded.com/FPGA/ProductsPYNQ-Z2.html)
---

<div align="center">

Built with ❤️ on Zynq-7000 · Accelerated by HLS C++ · Runs at the Edge

</div>
