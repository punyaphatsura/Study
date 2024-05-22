`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2023 08:15:09 PM
// Design Name: 
// Module Name: system
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


module system(
    input [7:0] sw,
    input clk,
    input btnU, btnC, btnD,
    output [6:0] seg,
    output [3:0] an,
    output dp
);

    reg oe = 0, we = 0;
    reg [7:0] data;
    reg [7:0] addr = 8'd0;
    
    wire [7:0] output_value;
    wire [3:0] num0, num1, num2, num3;
    wire push, pop, reset;
    wire [19:0] clk_div;
    wire [7:0] input_value;
    wire [6:0] segments;
    wire [3:0] An;

    assign seg = segments;
    assign input_value = {sw[7], sw[6], sw[5], sw[4], sw[3], sw[2], sw[1], sw[0]};
    assign {num3,num2} = output_value;
    assign {num1,num0} = addr;
    assign clk_div[0] = clk;
    assign an = An;

    generate
        for (genvar i = 0; i < 19; i = i + 1) begin
            clock_divider div1(clk_div[i], clk_div[i+1]);
        end
    endgenerate
    
    Switch_Handle sh2(btnU,clk_div[19],push);
    Switch_Handle sh3(btnC,clk_div[19],pop);
    Switch_Handle sh4(btnD,clk_div[19],reset);
    
    SinglePortRAM ram(input_value,addr,oe,we,clk_div[19],output_value);
    
    always @(posedge clk_div[19]) begin
        if (reset) begin
            oe = 0;
            we = 0;
            addr = 8'd0;
        end
        else if (push & (addr < 255)) begin
            we = 1;
            oe = 0;
            addr = addr + 1;
        end
        else if (pop & (addr > 0)) begin
            we = 0;
            oe = 1;
            addr = addr - 1;
        end
        else begin
            we = 0;
            oe = 0;
        end
    end
    
    seven_segment_tdm segment_controller(clk_div[19],num3,num2,num1,num0,segments,An,1);
    
endmodule
