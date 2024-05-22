`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 10:47:20 PM
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

    reg state = 0; // State variable, 0 - Waiting for pulse_input, 1 - Generating pulse

    always @(posedge clk) begin
        if (pulse_input && state == 0) begin
            pulse_output <= 1;
            state <= 1;
        end else begin
            pulse_output <= 0;
            state <= 0;
        end
    end

endmodule

