# FPGA Signed Booth Multiply-Accumulate (MAC) — Arty A7-100T

## Overview
This project implements a **signed Multiply-Accumulate (MAC)** unit using an **iterative Booth multiplier** and deploys it on the **Digilent Arty A7-100T FPGA**. The design demonstrates multi-cycle arithmetic datapath design, signed accumulation, FPGA interfacing, and real-time hardware validation.

The MAC performs:

ACC = ACC + (A × B)

where A and B are signed 8-bit values and ACC is a 32-bit accumulator.

---

## Key Features
- Signed Booth multiplier (iterative)
- Multi-cycle MAC architecture
- 32-bit signed accumulator
- FPGA hardware validation
- Button-controlled execution
- Resettable accumulator
- Real-time LED output
- Clean datapath separation
- Interview-ready architecture

---

## Architecture

### Stage 1 — Input Register
- Loads signed operands A and B  
- Triggered using cycle_enable  
- Inputs taken from FPGA switches  

### Stage 2 — Booth Multiplier
- 8-cycle iterative Booth algorithm  
- Signed multiplication  
- Generates PRODUCT and DONE  

### Stage 3 — Accumulator
- 32-bit signed accumulator  
- Sign-extended multiplier output  
- Updates when multiplication completes  

### Stage 4 — Output Register
- Registered FPGA output  
- Generates valid signal (vout)  

---

---

## FPGA Interface

### Inputs

| Signal | Board Control | Description |
|-------|--------------|-------------|
| CLK100MHZ | Clock | System clock |
| BTN0 | Push Button | Start MAC |
| BTN1 | Push Button | Reset accumulator |
| SW[3:0] | Switches | Signed input operand |

### Outputs

| Signal | Board Output | Description |
|--------|-------------|-------------|
| LED[7] | LED | Result valid |
| LED[6] | LED | Start indicator |
| LED[5:0] | LEDs | MAC output (lower bits) |

---

## Operation

1. Set operand using switches  
2. Press **BTN0** to start MAC  
3. Booth multiplier runs for 8 cycles  
4. Product accumulates into ACC  
5. LEDs update with new value  
6. Press **BTN1** to reset accumulator  

### Example

Switch = 0011 (decimal 3)

Press BTN0 → ACC = 9  
Press BTN0 → ACC = 18  
Press BTN0 → ACC = 27  

---

## Design Specifications

| Parameter | Value |
|----------|------|
Multiplier | Booth (iterative) |
Operand width | 8-bit signed |
Accumulator width | 32-bit signed |
Latency | 8 clock cycles |
Throughput | 1 MAC / 8 cycles |
Clock | 100 MHz |
FPGA | Arty A7-100T |

---

## Simulation Waveform

<img width="1574" height="404" alt="image" src="https://github.com/user-attachments/assets/be4c1235-e358-42c5-b892-c63df7465085" />

---

## Example Simulation Output

A = 3, B = 3 → ACC = 9  
A = 3, B = 3 → ACC = 18  
A = 3, B = 3 → ACC = 27  

---

## What This Project Demonstrates

- Multi-cycle hardware datapath design  
- Booth multiplication implementation  
- Signed arithmetic handling  
- Accumulator architecture  
- FPGA hardware bring-up  
- Register-transfer level design  
- Control + datapath separation  
- Real hardware validation  

---

## Applications

- DSP MAC engines  
- FIR filters  
- Dot-product accelerators  
- AI inference hardware  
- Fixed-point arithmetic units  
- Digital signal processing cores  

---

## Future Improvements

- Wallace tree multiplier option  
- Fully pipelined MAC  
- Streaming input interface  
- AXI-Stream support  
- Vector dot-product engine  
- DSP slice comparison  

---

## Hardware Used

- Digilent Arty A7-100T FPGA  
- Xilinx Vivado  
- Verilog HDL  

---



FPGA implementation of a **signed Booth-based Multiply-Accumulate unit** designed for DSP datapath applications and validated on hardware.


## Block Diagram

