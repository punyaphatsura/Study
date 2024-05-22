`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2023 10:26:14 PM
// Design Name: 
// Module Name: combined
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


module combined (
    input clk,[3:0]num0,[3:0]num1,[3:0]num2,[3:0]num3,
    output [6:0] seg,
    output [3:0] an,
    output dp
);
//reg clk;
wire en0,en1,en2,en3;
wire [6:0] segments;
assign an = {en0,en1,en2,en3};
assign seg = segments;

// Instantiate the 7-Segment Time-Division Multiplexer

seven_segment_tdm tdm_inst (clk,num0,num1,num2,num4,segments,en0,en1,en2,en3,dp);

//initial begin
//clk = 0;
//end

//always begin
//     #10    
//     clk = ~clk;
//end

endmodule

