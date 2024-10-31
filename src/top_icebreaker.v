module top
  #(parameter DIVIDER=5000, DELAY_BIT=15)
   (
    // testbench is controlled by test.py
    input  CLK,
    input  P1B2,
    input  P1B3,
    input  P1B4,
    input  P1B7,
    input  P1B8,
    input  P1B9,
    input  P1B10,
    output P1A1,
    output P1A2,
    output P1A3,
    output P1A4,
    output P1A7,
    output P1A8,
    output P1A9,
    output P1A10
    );

   // wire up the inputs and outputs
   reg	   clk_dut;
   wire [7:0] outputs = {P1A10, P1A9, P1A8, P1A7, P1A4, P1A3, P1A2, P1A1};
   reg [15:0] clk_divide_counter;
   reg [15:0] rst_delay_counter;
   wire	      rst;
   reg	      rst_delayed_n;

   // clock divider
   always @(posedge CLK) begin
      begin
	 if (rst == 1'b1) begin
	    clk_dut <= 1'b0;
	    clk_divide_counter <= 0;
	 end else if (clk_divide_counter == DIVIDER) begin
            clk_dut     <= !clk_dut;
	    clk_divide_counter <= 0;
	 end else begin
            clk_divide_counter <= clk_divide_counter + 1;
	 end
      end
   end

   // reset delay
   always @(posedge CLK) begin
      begin
	 if (rst == 1'b1) begin
	    rst_delayed_n <= 1'b1;
	    rst_delay_counter <= 0;
	 end else if (rst_delay_counter[DELAY_BIT] == 1'b1) begin
	    rst_delayed_n <= 1'b0;
	 end else begin
            rst_delay_counter <= rst_delay_counter + 1;
	 end
      end
   end

   // instantiate the DUT
   tt_um_tomkeddie_b tt_um_tomkeddie_b(.ena(1'b1), .clk(clk_dut), .uio_out(outputs), .rst_n(rst_delayed_n));
   

endmodule
