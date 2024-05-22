`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 11:23:09 PM
// Design Name: 
// Module Name: BinaryToBCDConverterTestbench
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


module BinaryToBCDConverterTestbench;

    // Inputs
    reg [7:0] binaryInput;

    // Outputs
    wire [3:0] bcdOutput1;
    wire [3:0] bcdOutput2;
    wire [3:0] bcdOutput3;

    // Instantiate the BinaryToBCDConverter module
    BinaryToBCDConverter converter (
        .binaryInput(binaryInput),
        .bcdOutput1(bcdOutput1),
        .bcdOutput2(bcdOutput2),
        .bcdOutput3(bcdOutput3)
    );

    initial begin
        // Test all possible binary inputs
        for (integer i = 0; i < 256; i = i + 1) begin
            binaryInput <= i;
            #10;
        end

        // Check the BCD outputs
        if (bcdOutput1 != 4'b0000 || bcdOutput2 != 4'b0000 || bcdOutput3 != 4'b0000) begin
            $display("Error: BCD outputs are incorrect!");
        end else begin
            $display("Success: BCD outputs are correct!");
        end

        $finish;
    end

endmodule
