`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2021 11:42:33 PM
// Design Name: 
// Module Name: invert_rgb
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


module invert_rgb(
    display_control,
    rgb_in,
    rgb_out,
    clk
    );
    
    input [31:0] display_control;
    input [23:0] rgb_in;
    output [23:0] rgb_out;
    input clk;
    
    reg [23:0] rgb_out;
    
    always @(posedge clk)
        begin
            rgb_out[23:0] <= ~display_control[23:0] & rgb_in[23:0];
            //rgb_out[23:0] <= ~rgb_in[23:0];
        end
endmodule
