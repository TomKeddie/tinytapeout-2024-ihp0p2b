`default_nettype none

module tt_um_tomkeddie_b
  (
   input wire [7:0]  ui_in, // Dedicated inputs
   output wire [7:0] uo_out, // Dedicated outputs
   input wire [7:0]  uio_in, // IOs: Input path
   output wire [7:0] uio_out, // IOs: Output path
   output wire [7:0] uio_oe, // IOs: Enable path (active high: 0=input, 1=output)
   input wire	     ena,
   input wire	     clk,
   input wire	     rst_n
   );

   wire		     _unused_ok = &{1'b0, ena, uio_in, ui_in, 1'b0};
   wire		     tx_pin0;
   wire		     tx_pin1;
   wire		     tx_pin2;
   wire		     tx_pin3;
   wire		     tx_pin4;
   wire		     tx_pin5;
   wire		     reset;

   assign uo_out[0] = tx_pin0;
   assign uo_out[1] = tx_pin1;
   assign uo_out[2] = tx_pin2;
   assign uo_out[3] = tx_pin3;
   assign uo_out[4] = tx_pin4;
   assign uo_out[5] = tx_pin5;
   assign uo_out[6] = 1'b0;
   assign uo_out[7] = 1'b0;

   assign uio_out = 8'b0;
   assign uio_oe  = 8'b0;

   assign reset       = !rst_n;

   uart_tx uart_tx(.clk(clk),
		   .reset(reset),
		   .tx_pin0(tx_pin0),
		   .tx_pin1(tx_pin1),
		   .tx_pin2(tx_pin2),
		   .tx_pin3(tx_pin3),
		   .tx_pin4(tx_pin4),
		   .tx_pin5(tx_pin5)
);
        
endmodule
