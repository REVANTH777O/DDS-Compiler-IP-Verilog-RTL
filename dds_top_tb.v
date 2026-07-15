`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2026 02:39:40 PM
// Design Name: 
// Module Name: dds_top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dds_top_tb;     
   reg clk_100mhz ; 
   reg reset ; 
   wire [15:0] sine ; 
   wire sine_valid ; 
   dds_top dut (
              .clk_100mhz(clk_100mhz),
              .reset(reset),
              .sine(sine),
              .sine_valid(sine_valid)             
               );
   //clock generation 
   initial begin 
   clk_100mhz = 0 ; 
   forever #5 clk_100mhz = ~ clk_100mhz ; 
   end 
   //stimuli 
   initial begin 
    reset = 1 ; 
    #20 
    reset = 0 ; 
    #100 
  $finish();
   end 
endmodule
