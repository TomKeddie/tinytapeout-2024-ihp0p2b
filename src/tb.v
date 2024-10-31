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
           input  rst,
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
   top #(.DIVIDER(4), .DELAY_BIT(4)) top (
	.CLK(clk),
	.P1B1(rst),
	.P1B2(1'b0),
	.P1B3(1'b0),
	.P1B4(1'b0),
	.P1B7(1'b0),
	.P1B8(1'b0),
	.P1B9(1'b0),
	.P1B10(1'b0)
	);

endmodule
