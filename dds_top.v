`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/28/2026 02:02:03 PM
// Design Name: 
// Module Name: dds_top
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


module dds_top(
    input clk_100mhz, 
    input reset , 
    output [15:0] sine,
    output sine_valid
    );
    reg phase_valid;
    reg [15:0] phase_reg;
//reset log
    always@(posedge clk_100mhz) begin 
    if(reset)begin 
        phase_valid <= 0 ;
        phase_reg <= 0 ;
    end
    else begin 
        phase_valid <= 1'b1;
        //new localparam way to change , in future if we want to change sine wave freq to [2mhz to 100mh]
        phase_reg <= phase_reg + 16'd655;
        end       
    end 
    
    assign sine       = m_axis_data_tdata;
    assign sine_valid = m_axis_data_tvalid;
      
        dds_compiler_0 dds (
  .aclk(clk_100mhz),                                
  .s_axis_phase_tvalid(phase_valid),            // input wire s_axis_phase_tvalid
  .s_axis_phase_tdata(phase_reg),              // input wire [15 : 0] s_axis_phase_tdata
  .m_axis_data_tvalid(m_axis_data_tvalid),    // output wire m_axis_data_tvalid
  .m_axis_data_tdata(m_axis_data_tdata)      // output wire [15 : 0] m_axis_data_tdata
); 



endmodule
