`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2026 05:27:42 PM
// Design Name: 
// Module Name: dds_capture
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

`timescale 1ns / 1ps

module dds_capture(
           input clk , 
           input reset ,
           input sine_valid , 
           input [15:0] sine ,   
          output reg  fifo_wr_en,
          output reg [15:0] fifo_din
                   );
                  always@(posedge clk) begin 
                  if(reset)  begin
                    fifo_wr_en <= 1'b0;
                    fifo_din   <= 16'd0;
                  end
                  else begin 
                          fifo_wr_en <= 1'b0;
                          
                        if(sine_valid) begin 
                            fifo_wr_en <= 1 ;  // if write enable  == 1 then only sine values will transfered to fifo_din 
                            fifo_din <= sine; // output of sine wave we are giving to fifo's input 
                        end 
                    end 
                 end
endmodule 
