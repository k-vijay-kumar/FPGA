# FPGA

An FPGA is a blank microchip containing thousands of unconfigured digital blocks.
Instead of a fixed CPU executing lines of software code one after another (sequential processing),
an FPGA uses code to physically wire up separate hardware circuits inside the silicon.
Your code defines the hardware layout, not software instructions.

```text
        [ Input / Output Pins ]
                  │
  ─── Logic Block ─── Logic Block ───  ◄─── Programmable Wires
           │              │                 (Switches connect the blocks)
  ─── Logic Block ─── Logic Block ───
                  │
       [ Input / Output Pins ]
```