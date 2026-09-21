# EDA Toolchain Execution Workflow

```text
[ RTL Import ] ──► [ Synthesize ] ──► [ FloorPlan GUI ] ──► [ Place & Route ] ──► [ Program Flash ]
```

## Project Setup & Synthesis Setup

- Open Gowin EDA, create a project for the GW1NR-LV9QN88C6/I5 chip, and import `blinky_1hz.v`.

- **Synthesize:** Double-click **Synthesize**. This converts your text code into hardware primitives (LUTs and Flip-Flops) so the software recognizes your input/output ports.

## Graphical Pin Mapping (The GUI FloorPlan)

- **Open Tool:** Click **FloorPlan Editor** from the top menu bar to open the visual layout window.
- **Assign Pins:** Go to the **I/O Constraints** tab and assign the following parameters:
  - `sys_clk` → Set Location to **52** and IO Type to **LVCMOS33**
  - `led` → Set Location to **10** and IO Type to **LVCMOS18**
- **Save:** Press **Ctrl + S**. The tool automatically writes the `.cst` file in the background.
- Close the editor.

## SDC (Synopsys Design Constraints) File

### Step 1: Open the Timing Editor

- In the **Process** tab on the left, navigate to the **User Constraints** section.
- Double-click on **Timing Constraints Editor** (or look for its icon on the top toolbar).
- This opens a new spreadsheet-like window.

### Step 2: Define the Clock Visually

- On the left tree view of this new window, select **Clocks** under **Timing Constraints**.
- Right-click in the empty space on the right panel and select **Create Clock**.
- A pop-up dialog box appears.
- Fill out the fields:
  - **Clock Name:** `sys_clk`
  - **Source/Port:** Click the `...` button next to it, select your input port `sys_clk`, and hit **OK**.
  - **Period:** Type `37.037` (or specify the frequency directly as `27.000 MHz` if the menu allows switching units).
- Click **OK**.

## Place, Route & Flash

- **Place & Route:** Double-click **Place & Route**. The tool merges your GUI pin choices with the logic fabric and runs physical connection paths.
- **Bitstream:** Place and Route also produces the final `.fs` binary file.
- **Program:** Launch Gowin Programmer, connect the Tang Nano 9K via USB, load the `.fs` file, and click **Program** in SRAM mode.