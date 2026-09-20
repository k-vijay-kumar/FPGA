`timescale 1ns / 1ps

module blinky_1hz (
    input  wire sys_clk,   // Master Input Clock Source (27MHz) - 3.3V Domain
    output reg  led        // Digital Output Pin driving the LED - 1.8V Domain
);

    // 24-bit register to store the clock cycle count
    reg [23:0] counter;
    
    // Internal state tracking register (1 = Logical ON, 0 = Logical OFF)
    reg led_state = 1'b0;

    // Sequential Block: Runs synchronously on the 27MHz clock edge
    always @(posedge sys_clk) begin
        if (counter == 24'd13499999) begin
            counter   <= 25'd0;         // Reset counter after 0.5 seconds (13.5M cycles)
            led_state <= ~led_state;    // Toggle the internal logical state
        end 
        else begin
            counter   <= counter + 1'b1; // Normal increment step
        end
    end

    // Inversion Layer: 
    // If led_state is 1 (ON), drive the physical pin LOW (0V) to light the LED.
    // If led_state is 0 (OFF), drive the physical pin HIGH (1.8V) to extinguish it.
    always @(*) begin
        led = ~led_state;
    end

endmodule