# System Architecture Document (SAD)

## Functional Specifications

- **System Goal:** Provide a highly accurate 1 Hz visual heartbeat indicator.
- **Primary Input:** External crystal oscillator oscillating at a fixed frequency.
- **Primary Output:** A square-wave digital signal with a strict 50% duty cycle running at exactly 1.000 Hz.

## Hardware Resource Constraints

- **Clock Source:** On-board Crystal Oscillator (27 MHz → 27,000,000 clock cycles per second).
- **Visual Transducer:** On-board LED.