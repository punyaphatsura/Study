`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 08:17:46 PM
// Design Name: 
// Module Name: SinglePortRAM
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


module SinglePortRAM (
input wire [7:0] din, // Data In and Out
input wire [7:0] addr , // Address
input wire oe , // Output Enable
input wire we,
input wire clk,
output wire [7:0] dout) ;

reg [7:0] op;
reg [7:0] mem [255:0];

assign dout = op;

always @(posedge clk) begin
    if(we)mem[addr] = din;
    else if(oe)op = mem[addr];
end
endmodule
