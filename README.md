# spi-protocol-verilog
SPI protocol transmitter implementation in Verilog HDL using FSM-based control logic.

This project implements an SPI (Serial Peripheral Interface) transmitter using Verilog HDL.

## Features

- FSM-based SPI controller
- Serial data transmission
- SPI clock generation
- Chip select control
- 16-bit data transfer
- Synthesizable RTL design

## Module Ports

| Port | Direction | Description |
|------|------------|-------------|
| clk | Input | System clock |
| rst | Input | Reset signal |
| data_in | Input | 16-bit parallel input data |
| spi_cs | Output | SPI chip select |
| spi_sclk | Output | SPI serial clock |
| spi_data | Output | SPI MOSI data |
| counter | Output | Bit counter |

## State Machine

The design uses 3 states:

1. Idle State
2. Load State
3. Transmission State

## Working

- Data is loaded into the MOSI register.
- Chip select becomes active low.
- Serial clock is generated.
- Data bits are shifted MSB first.
- After transmission, chip select returns high.

## Simulation

Simulated using:
- Icarus Verilog
- GTKWave
- Vivado Simulator

## Tools Used

- Verilog HDL
- Xilinx Vivado
- GTKWave

## Author

Pravalika Vemula
