`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2023 10:22:50 PM
// Design Name: 
// Module Name: tester
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

`timescale 1ns/1ns

module tester;
    reg a,b,cin;
    wire cout1,s1,cout2,s2;
    fullAdder a1(cout1,s1,a,b,cin);
    fullAdder2 a2(cout2,s2,a,b,cin);

initial
begin

    $monitor("time %t:{%b %b} <- {%d %d %d}",$time,cout1,s1,cout2,s2,a,b,cin);
    #0;
    a=0;
    b=0;
    cin=0;
    
    #10
    a=1;
    b=0;
    cin=0;
    
    #10
    a=0;
    b=1;
    cin=0;
    
    #10
    a=1;
    b=1;
    cin=0;
    
    #10
    a=0;
    b=0;
    cin=1;
    
    #10
    a=1;
    b=0;
    cin=1;
    
    #10
    a=0;
    b=1;
    cin=1;
    
    #10
    a=1;
    b=1;
    cin=1;
    
    #10
    
    $finish;

end
endmodule
