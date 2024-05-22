`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 07:35:12 PM
// Design Name: 
// Module Name: Single_Pulser
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


module Single_Pulser(
    input pulse_input,
    input clk,
    output reg pulse_output
);

    reg state = 0;

    always @(posedge clk) begin
        if (pulse_input & state == 0) begin
            pulse_output = 1;
            state = 1;
        end else if(pulse_input & state) begin
            pulse_output = 0;
        end else begin
            state = 0;
        end
    end

endmodule
