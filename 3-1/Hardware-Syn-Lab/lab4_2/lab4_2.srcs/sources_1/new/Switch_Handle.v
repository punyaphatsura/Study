`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 01:31:57 AM
// Design Name: 
// Module Name: Switch_Handle
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


module Switch_Handle( 
    input signal_in,
    input clk,
    output wire signal_out
    );
    
    wire debounced,dff1,dff2;
    
    Debouncer debouncer(signal_in,clk,debounced) ;
    DFlipFlop dflipflop1(debounced,clk,dff1);
    DFlipFlop dflipflop2(dff1,clk,dff2);
    Single_Pulser singlepulser(dff2,clk,signal_out);
    
endmodule
