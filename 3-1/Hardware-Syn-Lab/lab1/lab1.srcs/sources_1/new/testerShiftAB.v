`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2023 11:12:29 PM
// Design Name: 
// Module Name: testerShiftAB
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


module testerShiftAB;
wire [1:0] qa;
wire [1:0] qb;
wire [15:0] qc;
reg clock,d;
shiftA a1(qa,clock,d);
shiftB b1(qb,clock,d);
nBitShift #(16) c1(qc,clock,d);

always

    #10
    clock = ~clock;
    
initial
begin    
    #0
    clock = 0;
    d = 0;
    
    #20
    d = 1;
    
    #20
    d = 1;
    
    #20
    d = 0;
    
    #20
    d = 0;
    
    #20
    d = 1;
    
    #20
    d = 1;
    
    #20
    d = 0;
    
    #20
    d = 1;
    
    #20
    d = 1;
    
    #20
    d = 0;
    
    #20
    d = 1;
    
    #20
    d = 1;
    
    #20
    d = 0;
    
    #20
    $finish;
   
end
endmodule
