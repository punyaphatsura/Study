`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 11:01:26 PM
// Design Name: 
// Module Name: Single_Pulser_Testbench
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


module Single_Pulser_Testbench;
// Declare signals
    reg pushed,clock;
    wire d;

    // Instantiate the Single Pulser
    Single_Pulser pulser (
        .pushed(pushed),
        .clock(clock),
        .d(d)
    );
    reg clock_gen = 0;

    always begin
        #5 clock_gen = ~clock_gen; // Toggle the clock every 5 time units
    end
    
    initial begin
        pushed = 0;
        repeat(6) begin
            pushed = 1;
            #10;
        end
        repeat(6) begin
            pushed = 0;
            #10;
        end
        repeat(6) begin
            pushed = 1;
            #10;
        end
        repeat(6) begin
            pushed = 0;
            #10;
        end
        repeat(6) begin
            pushed = 1;
            #10;
        end
        repeat(6) begin
            pushed = 0;
            #10;
        end
        repeat(6) begin
            pushed = 1;
            #10;
        end
        $stop;
    end
    
    always begin
        clock = clock_gen;
        #5;
    end
    
endmodule
