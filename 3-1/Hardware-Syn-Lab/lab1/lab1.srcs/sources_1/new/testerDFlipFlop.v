`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2023 10:58:16 PM
// Design Name: 
// Module Name: testerDFlipFlop
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


module testerDFlipFlop;

reg clock,nreset,d;
DFlipFlop d1(q,clock,nreset,d);

always

    #10 clock = ~clock;
initial begin
    #0
    d = 0;
    clock = 0;
    nreset = 0;
    
    #50
    nreset = 1;
    
    #50
    nreset = 0;
    
    #50
    nreset = 1;
    
    #50
    nreset = 0;
    
    #50
    nreset = 1;
    
    #50
    nreset = 0;
    
    #50
    nreset = 1;
    
    #50
    $finish;
end

always

    #8
    d = ~d;

endmodule
