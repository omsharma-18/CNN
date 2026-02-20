# Real-Time Object Detection: Hardware-Accelerated CNN on Xilinx Zynq

![Xilinx](https://img.shields.io/badge/Xilinx-Vivado%20%26%20Vitis_HLS-black?logo=xilinx)
![C++](https://img.shields.io/badge/C++-Hardware_Design-blue?logo=c%2B%2B)
![Python](https://img.shields.io/badge/Python-Jupyter%20%26%20OpenCV-yellow?logo=python)

## 📌 Project Overview
This project implements a hardware-accelerated Convolutional Neural Network (CNN) for real-time image classification (Cat vs. Dog) on a Xilinx Zynq System-on-Chip (SoC). By utilizing hardware/software co-design, compute-intensive CNN operations are offloaded from the CPU to the FPGA fabric. The goal is to achieve real-time inference and quantitatively demonstrate performance improvements over a standard software-only execution.

## 🏗️ System Architecture
The design partitions functionality across the Zynq SoC's heterogeneous architecture to maximize efficiency:

* **Processing System (PS) - Arm Cortex-A9 Core:** * Handles image capture and preprocessing using OpenCV.
    * Manages control logic, system integration, and post-processing.
    * Runs the Jupyter Notebook/Python environment (via PYNQ framework).
* **Programmable Logic (PL) - FPGA Fabric:** * Accelerates heavy mathematical CNN operations (convolution, activation, max-pooling).
    * Implemented via a custom IP block generated using Vitis HLS (C++ to RTL).



## 📂 Repository Structure

```text
hw-accelerated-cnn-zynq/
│
├── dataset/                     # Raw or preprocessed image data
│   ├── cat/                     # Images of cats
│   └── dog/                     # Images of dogs
│
├── model/                       # Trained models and exported weights
│   ├── cat/                     # Weights/biases specific to the cat class
│   └── dog/                     # Weights/biases specific to the dog class
│
├── vitis_hls/                   # High-Level Synthesis C/C++ code
│   ├── cnn_detector.cpp         # Core CNN hardware accelerator logic
│   └── cnn_detector.h           # Header file with definitions and pragmas
│
├── vivado/                      # Hardware design files and bitstreams
│   ├── block_diagram.png        # Visual export of the IP integrator block design
│   ├── wrapper.v                # Top-level Verilog HDL wrapper
│   ├── design_1.bit             # Compiled bitstream file for the FPGA
│   └── design_1.hwh             # Hardware handoff file (required for PYNQ/Software)
│
├── software/                    # Embedded software and Jupyter notebooks
│   ├── cpu_inference.ipynb      # Baseline software-only CNN execution
│   └── fpga_inference.ipynb     # Hardware-accelerated execution using the bitstream
│
├── output/                      # Project deliverables and demonstrations
│   ├── screenshot.png           # Screenshot of the working inference
│   └── video_demo.mp4           # Live demonstration of real-time inference
│
└── README.md                    # Project documentation
```

## 🛠️ Hardware & Software Requirements

### Hardware:

* Xilinx Zynq-based development board (e.g., PYNQ-Z1, ZCU104, ZedBoard)

* USB Web Camera (for live inference) or local image dataset

* MicroSD card with PYNQ Linux image flashed

### Software:

* AMD Xilinx Vivado Design Suite (for block design and bitstream generation)

* Vitis HLS (for synthesizing C++ into an IP block)

* Jupyter Notebook (running locally on the Zynq board)

* OpenCV & Python 3 (for image preprocessing and bounding boxes)

## 🚀 Getting Started

### 1. Hardware Generation (Synthesizing the IP)
1. Open Vitis HLS and create a new project using the source files in `vitis_hls/`.
2. Run C Synthesis and Export the RTL as an IP catalog.
3. Open Vivado, create a Block Design, and integrate the Zynq Processing System with your custom CNN IP.

4. Run Synthesis, Implementation, and Generate Bitstream. Export the `.bit` and `.hwh` files into the `vivado/` directory of this repo.

### 2. Board Setup
1. Boot your Zynq board and connect it to your network.
2. Clone or upload this repository directly into the Jupyter workspace on the board.
3. Ensure the `.bit` and `.hwh` files are placed alongside the notebooks in the `software/` folder.

### 3. Running Inference
* **CPU Baseline:** Open `software/cpu_inference.ipynb` and run the cells to observe standard Arm processor performance.
* **FPGA Accelerated:** Open `software/fpga_inference.ipynb` to program the FPGA fabric with the custom hardware and execute the accelerated inference.

## 📊 Performance Analysis
A core objective of this project is to quantitatively compare the hardware accelerator against the CPU. *(Note: Replace placeholder values with actual results after final testing).*

| Metric | CPU-Only (Arm) | FPGA-Accelerated (Zynq PL) | Improvement |
| :--- | :--- | :--- | :--- |
| **Latency** | ~XXX ms/image | ~XXX ms/image | **> 2× Speedup** |
| **Throughput** | ~X FPS | ~X FPS | **> 2× Speedup** |

### FPGA Resource Utilization
* **LUTs:** XX%
* **BRAM:** XX%
* **DSPs:** XX%

## 🎥 Demonstration
Check the `output/` directory for a live demonstration of the system in action.
* **`video_demo.mp4`**: Full walkthrough of real-time edge AI object detection.
* **`screenshot.png`**: Static capture of the bounding box and classification logic.

## 🎓 Learning Outcomes
* Implementation of lightweight Convolutional Neural Networks on edge devices.
* Translation of software algorithms (C++) into digital hardware (RTL) using High-Level Synthesis.
* Understanding of hardware/software partitioning to optimize latency, throughput, and power efficiency.


