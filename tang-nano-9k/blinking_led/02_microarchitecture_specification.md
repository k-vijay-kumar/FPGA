# Microarchitecture Specification (MAS)

## Timing Analysis & Modulo Math

To create a 1 Hz total blink cycle, the LED must toggle its state every 0.5 seconds. We calculate the exact number of clock cycles needed for a 0.5-second delay:

- Target Ticks = 27,000,000 cycles/sec × 0.5 sec = 13,500,000 cycles

- **Counter Width:** To count up to 13,500,000, we need a binary counter wide enough to hold this value. Since 2^23 = 8,388,608 (too small) and 2^24 = 16,777,216 (large enough), a 24-bit register is required.

- **Reset Condition:** The counter will increment from 0 up to 13,499,999 (totaling 13.5 million steps). Upon reaching 13,499,999, it clears back to 0.

- **Toggle Mechanism:** Every time the counter resets, it flips the state of a dedicated 1-bit Flip-Flop driving the LED output.

## Block Level Diagram

```text
                   ┌──────────────────────────────────────────────┐
                   │               1Hz Clock Generator            │
                   │                                              │
                   │     ┌──────────────────────────────────┐     │
  sys_clk ─────────┼────►│  24-Bit Modulo Counter Engine    │     │
(27MHz Ext Clock)  │     │  (Resets when count == 13499999) │     │
                   │     └────────────────┬─────────────────┘     │
                   │                      │                       │
                   │                      ▼ [Counter Reset Event] │
                   │               ┌──────────────┐               │
                   │               │ 1-Bit FF     │               │
                   │               │ (Toggle Reg) │               │
                   │               └──────┬───────┘               │
                   │                      │                       │
                   │                      ▼                       │
                   │                     led                      ├────► To LED Pad
                   └──────────────────────────────────────────────┘
```