# VLSI Design Assignment – Verilog RTL to GDS Flow

This repository contains the complete source files and design flow for my undergraduate VLSI assignment, where I implemented and verified a **7-bit ALU and a datapath system** with control logic. The project was designed using **Verilog HDL** and follows a full **RTL-to-GDSII** design methodology using **Sky130 PDK** via the **OpenLane toolchain**.

## 📌 Project Overview

The assignment was divided into two major components:

### 🔹 Part 1: 7-bit ALU Design
- Operations Implemented:
  - `NOT` (bitwise inversion)
  - `ROR` (rotate right)
- RTL implementation using Verilog
- Testbench simulation using Icarus Verilog + GTKWave
- Functional verification using waveform analysis

### 🔹 Part 2: FSM-Controlled Datapath System
- Built a controller (FSM) to sequence ALU operations
- Designed datapath with register file, multiplexer, ALU, and control lines
- Interfaced FSM with datapath to simulate stepwise instruction flow
- Verified timing and state transition via waveform inspection

---

## ⚙️ Tools & Technologies

| Tool/Platform       | Purpose                                  |
|---------------------|-------------------------------------------|
| Verilog HDL         | RTL design of ALU and FSM                |
| Icarus Verilog      | Compilation and simulation                |
| GTKWave             | Waveform analysis                        |
| OpenLane            | Synthesis, Floorplanning, Routing         |
| Sky130 PDK          | Standard cells and tech library           |
| Magic VLSI          | Physical layout and GDS viewing           |
| KLayout             | Final GDSII inspection                    |

---

## 🏗️ OpenLane Flow Coverage

The physical design flow followed via OpenLane includes:

- Synthesis (`yosys`)
- Floorplanning and placement
- Clock Tree Synthesis (CTS)
- Routing
- Static Timing Analysis (STA)
- Power report generation
- GDSII file export

---

## 📁 Repository Structure

```bash
.
├── ALU/                   # ALU design and testbench files
├── FSM_Controller/        # FSM logic and control path files
├── Datapath/              # Integrated datapath module
├── Testbenches/           # Simulation waveforms & .vcd files
├── OpenLane_Flow/         # Configs, run logs, and GDS output
├── Reports/               # Area, power, timing, and cell usage
└── README.md


🧠 Learning Outcomes
Gained hands-on experience with Verilog RTL design and modular testbenches

Learned to interface datapath units with control FSM logic

Applied full physical design flow using OpenLane and Sky130 PDK

Understood power analysis, standard cell mapping, floorplanning, and layout verification
