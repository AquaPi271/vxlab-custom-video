`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2021 10:56:18 PM
// Design Name: 
// Module Name: modify_video
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


module modify_video(
    input [31:0] display_control,
    input clk,
    input [23:0] rgb_in,
    input hsync_in,
    input vsync_in,
    input video_active_in,
    output [23:0] rgb_out,
    output hsync_out,
    output vsync_out,
    output video_active_out
    );
        
    reg [23:0] rgb_out;
    reg hsync_out;
    reg vsync_out;
    reg video_active_out;
        
    always @(posedge clk)
        begin
            //rgb_out[23:0] <= ~rgb_in[23:0];
            rgb_out[23:0] <= ~display_control[23:0] & rgb_in[23:0];
            hsync_out <= hsync_in;
            vsync_out <= vsync_in;
            video_active_out <= video_active_in;
        end
        
endmodule
