`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2023 11:49:49 AM
// Design Name: 
// Module Name: Debouncer
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


module Debouncer(input q, input clk, output qout);
    
    reg [4:0] clock_counter = 4'b0000;
    reg Qout;
    assign qout = Qout;
    
    always @(posedge clk) begin
        if(q)begin
            if(clock_counter == 15)begin
                Qout = 1;
            end
            else begin
                clock_counter = clock_counter + 1;
            end
        end
        else begin
            clock_counter = 4'b0000;
            Qout = 0;
        end
        
    end


endmodule
