`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg ena;
  wire [7:0] uo_out;

  // Replace tt_um_example with your module name:
  tt_um_tomkeddie_b tt_um_tomkeddie_b (
      .ui_in  (8'b0),    // Dedicated inputs
      .uio_in (8'b0),    // IOs: Input path
      .uo_out(uo_out),   // IOs: Output path
      .uio_oe (1'b0),
      .ena    (1'b1),    // enable - goes high when design is selected
      .clk    (clk),     // clock
      .rst_n  (rst_n)    // not reset
  );

endmodule
