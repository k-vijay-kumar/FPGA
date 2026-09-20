# The Look-Up Table (LUT)

The Look-Up Table (LUT) is the core building block used to create combinational logic (like AND, OR, and NOT gates) inside an FPGA.
It does not calculate math using physical transistors; instead, it looks up the answer from a tiny pre-saved memory table.

```text
Inputs (A, B) ───► [ Multiplexer Selector Switch ] ───► Output (Y)
                                ▲
                                │ Selects 1 of 4 slots
   SRAM Storage:   [ Slot 0 | Slot 1 | Slot 2 | Slot 3 ] (Truth Table)
```

## How It Works

**The SRAM Array:** Every LUT contains a small set of volatile SRAM memory slots.
These slots hold a pre-calculated truth table—a list of answers for every possible input combination.

**The Multiplexer Switch:** A hardware selector switch links the inputs directly to the memory slots.

**The Inputs:** Your input signals act as a binary address that instantly points the multiplexer switch to a specific memory slot.