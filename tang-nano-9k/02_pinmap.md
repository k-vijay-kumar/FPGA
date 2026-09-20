# On-Board Core Components

| Hardware Resource | FPGA Pin | Direction | Default Voltage | Logic State / Notes |
| --- | ---: | --- | --- | --- |
| System Clock | 52 | Input | LVCMOS33 | On-board 27 MHz crystal oscillator |
| User Button 1 (S1) | 3 | Input | LVCMOS33 | Active-Low (0 = Pressed) |
| User Button 2 (S2) | 4 | Input | LVCMOS33 | Active-Low (0 = Pressed) |
| UART TX (to USB) | 17 | Output | LVCMOS33 | Serial data transmit |
| UART RX (from USB) | 18 | Input | LVCMOS33 | Serial data receive |

## On-Board LEDs (Active-Low)

The 6 user LEDs are tied to a 1.8V common anode rail. You must pull the pin LOW (1'b0) to turn the LED ON, and HIGH (1'b1) to turn it OFF.

> Note: Ensure the I/O bank standard is set correctly (LVCMOS18 or explicitly mapped via your synthesis setup).

| LED | FPGA Pin |
| --- | ---: |
| LED 0 | 10 |
| LED 1 | 11 |
| LED 2 | 13 |
| LED 3 | 14 |
| LED 4 | 15 |
| LED 5 | 16 |