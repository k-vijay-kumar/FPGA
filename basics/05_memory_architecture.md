# Memory Architecture (On-Chip vs. Off-Chip)

FPGAs need memory to store data during processing. Instead of a single uniform RAM pool, FPGAs utilize a hybrid memory architecture split into ultra-fast internal memory and deep external memory.

```text
                  ┌──────────────────────────────────────────┐
                  │               FPGA CHIP                  │
                  │                                          │
                  │  [LUTs] ───► Block RAM (BRAM)            │
                  │  (Logic)     (Fast, On-Chip, Small)      │
                  │                                          │
                  └───────────────────┬──────────────────────┘
                                      │ External Bus Pins
                                      ▼
                             [ Pseudo-SRAM / DRAM ]
                             (Slower, Off-Chip, Large)
```

## Internal Memory: Block RAM (BRAM)

**What it is:** Pockets of dedicated hardware memory arrays built directly inside the silicon fabric right next to the logic blocks.

**How it works:** It operates at the internal clock speed of the FPGA, allowing single-cycle, instant reads and writes.

## External Memory: Interface RAM (PSRAM / DRAM)

**What it is:** Larger memory chips located outside the main FPGA logic fabric (either as a separate die inside the same package or on the external circuit board).

**How it works:** It offers massive capacity but requires an internal memory controller circuit to communicate across interface pins, resulting in higher access latency.