`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 11:12:42 PM
// Design Name: 
// Module Name: B2D
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


module B2D (
    input [15:0] binary_input, // 16-bit binary input
    output [3:0] decimal_output // 4-digit decimal output
);

    reg [15:0] binary_temp;
    reg [3:0] decimal_temp;
    integer i;

    always @(*) begin
        binary_temp = binary_input;
        decimal_temp = 4'b0; // Initialize decimal_temp to zero

        // Convert each group of 4 bits to decimal and add to decimal_temp
        
        for (i = 0; i < 4; i = i + 1) begin
            decimal_temp = decimal_temp + binary_temp[3:0];
            binary_temp = binary_temp >> 4; // Shift right by 4 bits
        end
    end

    assign decimal_output = decimal_temp;

endmodule

