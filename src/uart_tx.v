`default_nettype none

module uart_tx (
                input  clk,
                input  reset,
                output tx_pin0,
                output tx_pin1,
                output tx_pin2,
                output tx_pin3
                );

  wire [7:0]           text0 [0:45];
  wire [7:0]           text1 [0:45];
  wire [7:0]           text2 [0:45];
  wire [7:0]           text3 [0:45];

  // a couple of random things to push out a serial port
  assign text0[0]  = "T";
  assign text0[1]  = "i";
  assign text0[2]  = "n";
  assign text0[3]  = "y";
  assign text0[4]  = "T";
  assign text0[5]  = "a";
  assign text0[6]  = "p";
  assign text0[7]  = "e";
  assign text0[8]  = "o";
  assign text0[9]  = "u";
  assign text0[10] = "t";
  assign text0[11] = " ";
  assign text0[12] = "I";
  assign text0[13] = "H";
  assign text0[14] = "P"; 
  assign text0[15] = " ";
  assign text0[16] = "0";
  assign text0[17] = "p";
  assign text0[18] = "2";
  assign text0[19] = " ";
  assign text0[20] = "N";
  assign text0[21] = "o";
  assign text0[22] = "v";
  assign text0[23] = "2";
  assign text0[24] = "0";
  assign text0[25] = "2";
  assign text0[26] = "4";
  assign text0[27] = " ";
  assign text0[28] = "T";
  assign text0[29] = "o";
  assign text0[30] = "m";
  assign text0[31] = "K";
  assign text0[32] = "e";
  assign text0[33] = "d";
  assign text0[34] = "d";
  assign text0[35] = "i";
  assign text0[36] = "e";
  assign text0[37] = " ";
  assign text0[38] = " ";
  assign text0[39] = " ";
  assign text0[40] = " ";
  assign text0[41] = " ";
  assign text0[42] = " ";
  assign text0[43] = " ";
  assign text0[44] = "\r";
  assign text0[45] = "\n";
  
  assign text1[0] = "O";
  assign text1[1] = "p";
  assign text1[2] = "e";
  assign text1[3] = "n";
  assign text1[4] = " ";
  assign text1[5] = "t";
  assign text1[6] = "h";
  assign text1[7] = "e";
  assign text1[8] = " ";
  assign text1[9] = "p";
  assign text1[10] = "o";
  assign text1[11] = "d";
  assign text1[12] = " ";
  assign text1[13] = "b";
  assign text1[14] = "a";
  assign text1[15] = "y";
  assign text1[16] = " ";
  assign text1[17] = "d";
  assign text1[18] = "o";
  assign text1[19] = "o";
  assign text1[20] = "r";
  assign text1[21] = "s";
  assign text1[22] = ",";
  assign text1[23] = " ";
  assign text1[24] = "H";
  assign text1[25] = "A";
  assign text1[26] = "L";
  assign text1[27] = " ";
  assign text1[28] = " ";
  assign text1[29] = " ";
  assign text1[30] = " ";
  assign text1[31] = " ";
  assign text1[32] = " ";
  assign text1[33] = " ";
  assign text1[34] = " ";
  assign text1[35] = " ";
  assign text1[36] = " ";
  assign text1[37] = " ";
  assign text1[38] = " ";
  assign text1[39] = " ";
  assign text1[40] = " ";
  assign text1[41] = " ";
  assign text1[42] = " ";
  assign text1[43] = " ";
  assign text1[44] = "\r";
  assign text1[45] = "\n";

  assign text2[0]  = "I";
  assign text2[1]  = "'";
  assign text2[2]  = "m";
  assign text2[3]  = " ";
  assign text2[4]  = "s";
  assign text2[5]  = "o";
  assign text2[6]  = "r";
  assign text2[7]  = "r";
  assign text2[8]  = "y";
  assign text2[9]  = ",";
  assign text2[10] = " ";
  assign text2[11] = "D";
  assign text2[12] = "a";
  assign text2[13] = "v";
  assign text2[14] = "e";
  assign text2[15] = ".";
  assign text2[16] = " ";
  assign text2[17] = "I";
  assign text2[18] = "'";
  assign text2[19] = "m";
  assign text2[20] = " ";
  assign text2[21] = "a";
  assign text2[22] = "f";
  assign text2[23] = "r";
  assign text2[24] = "a";
  assign text2[25] = "i";   
  assign text2[26] = "d";
  assign text2[27] = " ";
  assign text2[28] = "I";
  assign text2[29] = " ";
  assign text2[30] = "c";
  assign text2[31] = "a";
  assign text2[32] = "n";
  assign text2[33] = "'";
  assign text2[34] = "t";
  assign text2[35] = " ";
  assign text2[36] = "d";
  assign text2[37] = "o";
  assign text2[38] = " ";
  assign text2[39] = "t";
  assign text2[40] = "h";
  assign text2[41] = "a";
  assign text2[42] = "t";
  assign text2[43] = ".";
  assign text2[44] = "\r";
  assign text2[45] = "\n";
   
  assign text3[0] = "T";
  assign text3[1] = "e";
  assign text3[2] = "d";
  assign text3[3] = " ";
  assign text3[4] = "P";
  assign text3[5] = "a";
  assign text3[6] = "r";
  assign text3[7] = "k";
  assign text3[8] = "e";
  assign text3[9] = "r";
  assign text3[10] = " ";
  assign text3[11] = "2";
  assign text3[12] = "3";
  assign text3[13] = " ";
  assign text3[14] = "M";
  assign text3[15] = "a";
  assign text3[16] = "r";
  assign text3[17] = " ";
  assign text3[18] = "1";
  assign text3[19] = "9";
  assign text3[20] = "4";
  assign text3[21] = "2";
  assign text3[22] = " ";
  assign text3[23] = "-";
  assign text3[24] = " ";
  assign text3[25] = "1";
  assign text3[26] = "2";
  assign text3[27] = " ";
  assign text3[28] = "A";
  assign text3[29] = "p";
  assign text3[30] = "r";
  assign text3[31] = " ";
  assign text3[32] = "1";
  assign text3[33] = "9";
  assign text3[34] = "9";
  assign text3[35] = "5";
  assign text3[36] = " ";
  assign text3[36] = " ";
  assign text3[37] = " ";
  assign text3[38] = " ";
  assign text3[39] = " ";
  assign text3[40] = " ";
  assign text3[41] = " ";
  assign text3[42] = " ";
  assign text3[43] = " ";
  assign text3[44] = "\r";
  assign text3[45] = "\n";

  reg [3:0]            bit_counter;
  reg [5:0]            text_index;
  
  reg                  tx_pin0_int;
  reg                  tx_pin1_int;
  reg                  tx_pin2_int;
  reg                  tx_pin3_int;
  assign tx_pin0 = tx_pin0_int;
  assign tx_pin1 = tx_pin1_int;
  assign tx_pin2 = tx_pin2_int;
  assign tx_pin3 = tx_pin3_int;

  always @(posedge clk) begin
    // if reset, set counter to 0
    if (reset) begin
      bit_counter <= 0;
      tx_pin0_int  <= 1'b1;
      tx_pin1_int  <= 1'b1;
      tx_pin2_int  <= 1'b1;
      tx_pin3_int  <= 1'b1;
      text_index   <= 6'b0;
    end else begin
      // bit counter - START, 8xDATA, STOP, IDLE = 11 bits
      if (bit_counter == 10) begin
        // reset
        bit_counter    <= 0;
         if (text_index == 45) begin
          text_index <= 6'b0;
        end else begin
          text_index <= text_index + 1;
        end
      end else begin
        // increment counter
        bit_counter <= bit_counter + 1;
      end
      case(bit_counter)
        0       : begin
          tx_pin0_int = 1'b1; // idle
          tx_pin1_int = 1'b1; // idle
          tx_pin2_int = 1'b1; // idle
          tx_pin3_int = 1'b1; // idle
        end
        1       : begin
          tx_pin0_int = 1'b0; // start
          tx_pin1_int = 1'b0; // start
          tx_pin2_int = 1'b0; // start
          tx_pin3_int = 1'b0; // start
        end
	9       : begin
          tx_pin0_int = 1'b0; // upper bit
          tx_pin1_int = 1'b0; // upper bit
          tx_pin2_int = 1'b0; // upper bit
          tx_pin3_int = 1'b0; // upper bit
	end
        10      : begin
          tx_pin0_int = 1'b1; // stop
          tx_pin1_int = 1'b1; // stop
          tx_pin2_int = 1'b1; // stop
          tx_pin3_int = 1'b1; // stop
        end
        default : begin
          tx_pin0_int = text0[text_index][bit_counter-2];
          tx_pin1_int = text1[text_index][bit_counter-2];
          tx_pin2_int = text2[text_index][bit_counter-2];
          tx_pin3_int = text3[text_index][bit_counter-2];
        end
      endcase
    end
  end
endmodule
