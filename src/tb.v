`default_nettype none
`timescale 1ns/1ps

/*
 this testbench just instantiates the module and makes some convenient wires
 that can be driven / tested by the cocotb test.py
 */

module tb (
           // testbench is controlled by test.py
           input  clk,
           input  rst_n,
           output uart_tx_pin
           );

   // this part dumps the trace to a vcd file that can be viewed with GTKWave
   initial begin
      $dumpfile ("tb.vcd");
      $dumpvars (0, tb);
      #1;
   end

   // wire up the inputs and outputs
   wire [7:0] uart_tx_pins;

   // instantiate the DUT
   tt_um_tomkeddie_b tt_um_tomkeddie_b (
					.ui_in  (8'b0),    // Dedicated inputs
					.uio_in (8'b0),    // IOs: Input path
					.uo_out(uart_tx_pins),   // IOs: Output path
					.ena    (1'b1),    // enable - goes high when design is selected
					.clk    (clk),     // clock
					.rst_n  (rst_n)
					);

endmodule
