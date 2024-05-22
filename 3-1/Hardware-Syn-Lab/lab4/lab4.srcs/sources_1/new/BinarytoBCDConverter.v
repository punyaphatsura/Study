`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 09:53:50 PM
// Design Name: 
// Module Name: BinarytoBCDConverter
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


module BinaryToBCDConverter (
    input wire [7:0] binaryInput, // 8-bit binary input
    output wire [3:0] bcdOutput1,  // 4-bit BCD output 1
    output wire [3:0] bcdOutput2,  // 4-bit BCD output 2
    output wire [3:0] bcdOutput3   // 4-bit BCD output 3
);

reg [3:0] temp1, temp2, temp3; // Temporary registers for BCD conversion
integer i;

always @(*) begin
    // First BCD conversion (LSB)
    temp1 = 0; // Initialize the temporary register
    for (i = 0; i < 8; i = i + 1) begin
        if (binaryInput[i] == 1) begin
            temp1 = temp1 + 1;
        end
        if (i != 7) begin
            temp1 = temp1 << 1; // Left shift by 1 for the next bit
        end
    end

    // Second BCD conversion
    temp2 <= temp1; // Use temp1 as a starting point

    // Third BCD conversion (MSB)
    temp3 <= temp2; // Use temp2 as a starting point
end

assign bcdOutput1 = temp1;
assign bcdOutput2 = temp2;
assign bcdOutput3 = temp3;

endmodule

