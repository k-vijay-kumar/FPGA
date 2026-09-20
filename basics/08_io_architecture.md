# Input/Output (I/O) Architecture

Because an FPGA allows you to design custom hardware, its physical interface pins cannot be rigid. The Input/Output Blocks (IOBs) surrounding the chip fabric are highly configurable interfaces that act as translators between internal logic and external components.

```text
                  ┌─────────────────────────────────────┐
                  │              FPGA CHIP              │
                  │                                     │
                  │                ┌─────-┐             │
External Pin ──   ┼─►[ I/O Block ]─┤ LUT  ├             │
  (3.3V / 1.2V)   │   (Voltage &   │Fabric│             │
                  │    Standard)   └─────-┘             │
                  └─────────────────────────────────────┘
```

## Programmable Voltage & Electrical Standards

**What it does:** A single physical pin can be configured to operate at different voltage levels (for example, 3.3V, 2.5V, 1.8V, or 1.2V) depending on what external chip it needs to communicate with.

**Why it matters:** It allows the FPGA to talk directly to legacy components (like older 3.3V sensors) or modern low-power devices without needing external level-shifter chips on your board.

## Differential Signaling (High-Speed Pairs)

**What it does:** A pair of pins can be locked together to speak in differential modes (like LVDS). Instead of checking if a single pin is high or low, the chip compares the tiny voltage difference between two pins.

**Why it matters:** This configuration filters out electrical noise, allowing the pins to toggle at hundreds of megahertz to drive high-speed interfaces like video links (HDMI/DVI) or display panels.

## Integrated Pull-up / Pull-down Resistors

**What it does:** Internal electronic resistors can be programmatically turned on or off for any pin.

**Why it matters:** When connecting an external button or switch, you do not need to solder a physical resistor onto the board to prevent floating signals; you simply enable the resistor inside the I/O block via configuration.