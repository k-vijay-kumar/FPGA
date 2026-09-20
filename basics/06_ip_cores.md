# Dedicated Hardware Blocks (Hard IP Cores)

Building complex mathematics or managing high-speed clock waves using only standard LUTs is highly inefficient.
To save space and maximize speed, FPGAs embed fixed, specialized hardware blocks right into the silicon grid alongside the programmable blocks.

```text
       ┌──────────────────────────────────────────────────┐
       │                    FPGA CHIP                     │
       │                                                  │
       │   ┌───────────┐    ┌─────────────┐    ┌───────┐  │
       │   │LUT Fabric │ ──►│  DSP Block  │ ──►│  PLL  │  │
       │   │  (General)│    │ (Math Core) │    │(Clock)│  │
       │   └───────────┘    └─────────────┘    └───────┘  │
       └──────────────────────────────────────────────────┘
```

## DSP / Multiplier Blocks

**What it is:** Fixed, hardwired arithmetic engines built into the silicon layout.

**Why they exist:** Multiplying two large binary numbers using basic LUTs takes dozens of blocks and creates long wiring paths.
A dedicated DSP block performs high-bitwidth multiplication and addition in a single clock cycle.

## Clock Management Blocks (PLLs)

**What it is:** Phase-Locked Loops (PLLs) are specialized circuits used to clean, shift, and manipulate clock frequencies.

**Why they exist:** An FPGA board usually has just one fixed crystal oscillator (the master heartbeat).
A PLL takes this source clock and can multiply it (for example, speeding it up for high-speed calculation logic) or divide it down cleanly.