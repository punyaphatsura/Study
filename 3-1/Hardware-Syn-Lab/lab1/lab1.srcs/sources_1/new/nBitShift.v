`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2023 10:15:39 PM
// Design Name: 
// Module Name: nBitShift
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


module nBitShift #(parameter n=2) (q,clock,d);

output [n-1:0] q;
input clock, d;
reg [n-1:0] q;
always @ (posedge clock)
begin
  q <= {q[n-2:0], d};
end
endmodule
