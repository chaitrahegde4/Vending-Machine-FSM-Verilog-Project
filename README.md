# Vending-Machine-FSM-Verilog-Project
A Verilog HDL project simulating a finite state machine (FSM)-based vending machine. Designed for learning and demonstrating digital system design, this project models coin inputs and product dispensing with change return logic.

## Overview

This vending machine accepts **1-unit and 2-unit coins**. When **3 units or more** are inserted:
- It **dispenses a product**
- **Returns change** if 4 units are inserted
The design is implemented as a **Moore FSM**, using behavioral Verilog and verified with a self-checking testbench.
 
## Toolchain
Icarus Verilog – Verilog compilation and simulation

GTKWave – Waveform viewing and analysis

Ubuntu (Linux) – Command-line based development environment



## File Structure

| File Name            | Description                                        |
|----------------------|----------------------------------------------------|

| `vending_fsm.sv`     | RTL Verilog module for the vending FSM             |

| `vending_fsm_tb.sv`  | Testbench to simulate and verify FSM functionality |


## 📈 Finite State Machine

| State | Value   | Description                            |
|-------|---------|----------------------------------------|
| `ideal` | 3'b000 | Initial/Idle state                    |
| `rs1`   | 3'b001 | 1 unit inserted                       |
| `rs2`   | 3'b010 | 2 units inserted                      |
| `rs3`   | 3'b011 | 3 units inserted → dispense product   |
| `rs4`   | 3'b100 | 4 units inserted → product + change   |

> Transition occurs on positive clock edges based on coin input. Outputs are asserted at specific states.

  **Sample Tests**
- Insert `2 + 1` → Product dispensed
- Insert `2 + 2` → Product + Change
- Insert `1 + 1 + 1` → Product dispensed


 ## Simulation Result:
 <img width="1637" height="427" alt="vend 1" src="https://github.com/user-attachments/assets/ea912348-5f4a-47a0-8092-ca38379231d5" />

