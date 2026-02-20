## Stage 1 — HLS Synthesis in Vitis HLS

### 1.1 Create Project

1. Open **Vitis HLS** and select **Create Project**.
2. Set the project name and solution directory.
3. Add source files:
   - **Design Files:** `cnn_detector.cpp`, `cnn_detector.h`
4. Set the **Top Function** to your accelerator top (e.g., `cnn_detector`).
5. Select the target part: `xc7z020clg400-1` (PYNQ-Z2).

### 1.2 C Simulation (Optional Verification)

```
Solution → Run C Simulation
```

Verify functional correctness against your golden reference before committing to synthesis.

### 1.3 C Synthesis

```
Solution → Run C Synthesis
```

Inspect the synthesis report for:
- **Latency** (clock cycles)
- **II (Initiation Interval)** for pipelined loops
- **Resource utilization** (LUT, FF, BRAM, DSP) against the xc7z020 budget

> Expected synthesis time: 5–15 minutes depending on directive complexity.

### 1.4 RTL Co-simulation (Optional)

```
Solution → Run Cosimulation
```

Validates the generated RTL against the C testbench. Confirms AXI interface timing.

### 1.5 RTL Implementation

```
Solution → Run Implementation
```

Performs place-and-route on the synthesized RTL to produce accurate post-implementation timing and resource reports.

### 1.6 Export RTL as Vivado IP

```
Solution → Export RTL
  Target: Vivado IP (.zip)
  Format: IP Catalog
```

This produces a packaged IP core (`.zip`) in the solution's `impl/export/` directory. Note this path — it becomes the IP repository in Stage 2.

---

## Stage 2 — Block Design & Bitstream in Vivado

### 2.1 Create Project

1. Open **Vivado** and select **Create Project → RTL Project**.
2. Skip adding sources at this stage.
3. Select the board: **PYNQ-Z2** (or part `xc7z020clg400-1`).

### 2.2 Add the HLS IP Repository

```
Tools → Settings → IP → Repository
  [+] Add path to Vitis HLS export directory
      (e.g., .../solution1/impl/export/)
```

Vivado will detect and register your `cnn_accel` IP core.

### 2.3 Build the Block Design

```
IP Integrator → Create Block Design
```

Instantiate the following IP blocks (refer to `bd/block_diagram.png` for connectivity):

| IP Block | Configuration |
|---|---|
| ZYNQ7 Processing System | Enable HP0 AXI Slave port for DMA |
| AXI DMA | Scatter-gather disabled; data width = 32-bit |
| `cnn_accel` (your HLS IP) | Default HLS-generated AXI interfaces |
| AXI Interconnect | Connect PS ↔ DMA ↔ Accelerator |
| Processor System Reset | Tie all resets |

### 2.4 Automate Connections via TCL

```tcl
# In Vivado Tcl Console:
source scripts/connect_bd.tcl
```

The provided TCL script wires all AXI master/slave ports, resets, and clocks. After sourcing:

```
Validate Design  (F6)
```

Resolve any critical warnings before proceeding.

### 2.5 Generate HDL Wrapper

```
Right-click block design → Create HDL Wrapper
  ☑ Let Vivado manage wrapper and auto-update
```

### 2.6 Synthesis → Implementation → Bitstream

```
Flow Navigator:
  1. Run Synthesis        (wait ~10 min)
  2. Run Implementation   (wait ~15 min)
  3. Generate Bitstream   (wait ~5 min)
```

After completion, review:
- **Timing Summary** — confirm no negative slack (WNS ≥ 0)
- **Utilization Report** — verify LUT/BRAM usage within device limits

### 2.7 Export Hardware Artifacts

The two files required for PYNQ deployment:

| File | Location |
|---|---|
| `design_1.bit` | `project.runs/impl_1/` |
| `design_1.hwh` | `project.srcs/sources_1/bd/design_1/hw_handoff/` |

> **Rename both files to the same base name**, e.g., `cnn_accel.bit` and `cnn_accel.hwh`. PYNQ requires matching names to correctly parse the hardware description.

---

## Stage 3 — Board Setup & File Deployment

### 3.1 Boot PYNQ-Z2

1. Flash an SD card with the [PYNQ-Z2 v3.0 image](http://www.pynq.io/board.html).
2. Set the board boot jumper to **SD**.
3. Connect via Ethernet and power on.
4. Board is accessible at `http://192.168.2.99` (default).

### 3.2 Transfer Files via SMB

Access the board filesystem over the network:

```
Windows:  \\192.168.2.99\xilinx
macOS/Linux:  smb://192.168.2.99/xilinx

Username: xilinx
Password: xilinx
```

### 3.3 Directory Structure on Board

Copy your files into the following layout:

```
/home/xilinx/pynq/overlays/
└── cnn_accel/
    ├── cnn_accel.bit        ← bitstream
    ├── cnn_accel.hwh        ← hardware handoff
    ├── weights/
    │   ├── conv1_w.npy
    │   ├── conv1_b.npy
    │   ├── conv2_w.npy
    │   ├── conv2_b.npy
    │   ├── conv3_w.npy
    │   ├── conv3_b.npy
    │   ├── fc1_w.npy
    │   ├── fc1_b.npy
    │   ├── fc2_w.npy
    │   └── fc2_b.npy
    ├── demo_images/
    │   └── *.png
    ├── fpga_inf.py
    └── cpu_inf.py
```

---

## Stage 4 — FPGA Inference

Open a Jupyter Notebook session at `http://192.168.2.99` or SSH into the board and run:


 

---

## Stage 5 — CPU Inference (Baseline)

```bash
python3 /home/xilinx/pynq/overlays/Madhavan/.py
```

 

 

---

 
