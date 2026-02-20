# CNN
# Title: 🎯 Project Milestone Tracker & Roadmap

## Project Overview
Real-Time Object Detection on Xilinx Zynq FPGA (PYNQ-Z2) using Hardware-Accelerated CNN

## Milestones
- CNN model selection and training (MobileNet/Tiny-YOLO)
- HLS IP core design using Vitis HLS
- IP integration in Vivado block design
- Bitstream generation and deployment on PYNQ-Z2
- Software-only (ARM CPU) baseline benchmark
- Hardware-accelerated inference benchmark
- Performance comparison report
- Demo video recording
- Final documentation polish

Labels: enhancement, in-progress


```
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
