`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 10:13:08 PM
// Design Name: 
// Module Name: BCD_Counter
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


module BCD_Counter (
    input up,
    input down,
    input set9,
    input set0,
    input clock,
    output reg [3:0] DCBA,
    output reg cout,
    output reg bout
    );
    
    initial 
        DCBA = 4'b0000;
    
    always @(posedge clock) begin
        bout = 0;
        cout = 0;
        case({up,down,set9,set0})
            4'b1000: begin
                cout = (DCBA == 9);
                DCBA = (DCBA + 1) % 10;
                end
            4'b0100: begin
                bout = (DCBA == 0);
                DCBA = (DCBA + 9) % 10;
                end
            4'b0010: DCBA = 9;
            4'b0001: DCBA = 0;
        endcase
    end
endmodule
