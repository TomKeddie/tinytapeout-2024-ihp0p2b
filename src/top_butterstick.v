/* Copyright 2020 Gregory Davill <greg.davill@gmail.com>
 Hacked 2021 by Tommy Thorn
 */
`default_nettype none

/*
 *  Blink an LED on the ButterStick r1.0 using Verilog
 */

module top #(parameter DIVIDER=5000)
   (
	    input	 clk_30,
	    output [6:0] led_rgb_multiplex_a,
	    output [2:0] led_rgb_multiplex_b,

	    output	 pdm_en,
	    output [2:0] pdm,
	    output	 rst_n,
	    input [1:0]	 user_btn,


	    output	 SYZYGY0_PMOD1A_1,
	    output	 SYZYGY0_PMOD1A_2,
	    output	 SYZYGY0_PMOD1A_3,
	    output	 SYZYGY0_PMOD1A_4,
	    output	 SYZYGY0_PMOD1A_7,
	    output	 SYZYGY0_PMOD1A_8,
	    output	 SYZYGY0_PMOD1A_9,
	    output	 SYZYGY0_PMOD1A_10,
	    output	 SYZYGY0_PMOD1B_1,
	    output	 SYZYGY0_PMOD1B_2,
	    output	 SYZYGY0_PMOD1B_3,
	    output	 SYZYGY0_PMOD1B_4,
	    output	 SYZYGY0_PMOD1B_7,
	    output	 SYZYGY0_PMOD1B_8,
	    output	 SYZYGY0_PMOD1B_9,
	    output	 SYZYGY0_PMOD1B_10,
	    input	 SYZYGY0_PMOD2A_1,
	    input	 SYZYGY0_PMOD2A_2,
	    input	 SYZYGY0_PMOD2A_3,
	    input	 SYZYGY0_PMOD2A_4,
	    input	 SYZYGY0_PMOD2A_7,
	    input	 SYZYGY0_PMOD2A_8,
	    input	 SYZYGY0_PMOD2A_9,
	    input	 SYZYGY0_PMOD2A_10,
	    input	 SYZYGY0_PMOD2B_1,
	    input	 SYZYGY0_PMOD2B_2,
	    input	 SYZYGY0_PMOD2B_3,
	    input	 SYZYGY0_PMOD2B_4,
	    input	 SYZYGY0_PMOD2B_7,
	    input	 SYZYGY0_PMOD2B_8,
	    input	 SYZYGY0_PMOD2B_9,
	    input	 SYZYGY0_PMOD2B_10,

	    );

   assign led_rgb_multiplex_b = 3'b001;
   
   assign led_rgb_multiplex_a[0] = counter[20];
   assign led_rgb_multiplex_a[1] = SYZYGY0_PMOD2B_1;
   assign led_rgb_multiplex_a[6:2] = 5'b00000;

   assign pdm_en = 1'b1;
   assign pdm[0] = counter[18]; // 15 = 2.5V, 12 = 2.2V, 16 = 2.8V, 17 = 3.1V, 18 = 3.3V
   assign rst_n = user_btn[0];

   reg [15:0]            clk_divide_counter = 16'b0;
   reg [0:9]		 rst_counter = 10'b11_1111_1111;

   reg			 rst;
   wire			 rst_n;
   assign rst_n = !rst;
   
   wire			 locked;
   wire			 clk_12;
   reg	   clk_dut;
 
   wire [7:0]		 outputs;
   
   // P1A is pmod the right
   assign SYZYGY0_PMOD1A_1   = outputs[0];
   assign SYZYGY0_PMOD1A_2   = outputs[1];
   assign SYZYGY0_PMOD1A_3   = outputs[2];
   assign SYZYGY0_PMOD1A_4   = outputs[3];

   // instantiate the DUT
   tt_um_tomkeddie_b tt_um_tomkeddie_b(.ena(1'b1), .clk(clk_dut), .uio_out(outputs), .rst_n(rst_n));

   // clock divider
   always @(posedge clk_12) begin
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

   // POR delay
   always @ (posedge clk_12) begin
      if (rst_counter != 0) begin
	 rst <= 1'b1;
	 if (locked) begin
	    rst_counter <= rst_counter - 1;
	 end
      end else begin
	 rst <= 1'b0;
      end
   end

   // ecppll -i 30 -o 12 --highres -f tom
   // Pll parameters:
   // Refclk divisor: 1
   // Feedback divisor: 1
   // clkout0 divisor: 20
   // clkout0 frequency: 12 MHz
   // clkout1 divisor: 50
   // clkout1 frequency: 12 MHz
   // clkout1 phase shift: -1.78186e+29 degrees
   // VCO frequency: 600
   wire clkfb;
   (* FREQUENCY_PIN_CLKI="30" *)
   (* FREQUENCY_PIN_CLKOS="12" *)
   (* ICP_CURRENT="12" *) (* LPF_RESISTOR="8" *) (* MFG_ENABLE_FILTEROPAMP="1" *) (* MFG_GMCREF_SEL="2" *)
   EHXPLLL #(
             .PLLRST_ENA("DISABLED"),
             .INTFB_WAKE("DISABLED"),
             .STDBY_ENABLE("DISABLED"),
             .DPHASE_SOURCE("DISABLED"),
             .OUTDIVIDER_MUXA("DIVA"),
             .OUTDIVIDER_MUXB("DIVB"),
             .OUTDIVIDER_MUXC("DIVC"),
             .OUTDIVIDER_MUXD("DIVD"),
             .CLKI_DIV(1),
             .CLKOP_ENABLE("ENABLED"),
             .CLKOP_DIV(20),
             .CLKOP_CPHASE(9),
             .CLKOP_FPHASE(0),
             .CLKOS_ENABLE("ENABLED"),
             .CLKOS_DIV(50),
             .CLKOS_CPHASE(-1634628864),
             .CLKOS_FPHASE(65535),
             .FEEDBK_PATH("CLKOP"),
             .CLKFB_DIV(1)
	     ) pll_i (
		      .RST(1'b0),
		      .STDBY(1'b0),
		      .CLKI(clk_30),
		      .CLKOP(clkfb),
		      .CLKOS(clk_12),
		      .CLKFB(clkfb),
		      .CLKINTFB(),
		      .PHASESEL0(1'b0),
		      .PHASESEL1(1'b0),
		      .PHASEDIR(1'b1),
		      .PHASESTEP(1'b1),
		      .PHASELOADREG(1'b1),
		      .PLLWAKESYNC(1'b0),
		      .ENCLKOP(1'b0),
		      .LOCK(locked)
		      );

   // Infrastructure
   // Create a 32 bit register
   reg [31:0] counter = 0;

   // Every positive edge increment register by 1
   always @(posedge clk_12) begin
      if (1'b0) begin
	 counter <= 0;
      end else begin
         counter <= counter + 1;
      end
   end

endmodule
