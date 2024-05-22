`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 10:18:18 PM
// Design Name: 
// Module Name: RAMtest
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


module RAMtest;
    wire [7:0] d;
    reg [7:0] addr;
    reg we,oe;
    reg clk;
    
    SinglePortRAM ram(d,addr,oe,we,clk);
    
    initial begin
        clk = 1;
        forever #50 clk = ~clk;
    end
   
endmodule
