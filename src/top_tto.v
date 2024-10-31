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

   wire		     _unused_ok = &{1'b0,
                                    ena,
                                    uio_in,
                                    uio_out,
                                    ui_in,
                                    1'b0};
   wire		     tx_pin0;
   wire		     tx_pin1;
   wire		     tx_pin2;
   wire		     reset;

   assign uio_out[0] = tx_pin0;
   assign uio_out[1] = tx_pin1;
   assign uio_out[2] = tx_pin2;
   assign uio_out[3] = clk;
   assign uio_out[4] = rst_n;
   assign uio_out[5] = reset;

   assign reset       = !rst_n;

   uart_tx uart_tx(.clk(clk),
		   .reset(reset),
		   .tx_pin0(tx_pin0),
		   .tx_pin1(tx_pin1),
		   .tx_pin2(tx_pin2));
        
endmodule
