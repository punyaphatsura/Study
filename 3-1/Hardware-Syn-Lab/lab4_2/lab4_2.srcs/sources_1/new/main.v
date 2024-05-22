`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 01:25:29 AM
// Design Name: 
// Module Name: main
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


module main(
    input [4:0] sw,
    input clk,
    
    output [6:0] seg,
    output [3:0] an,
    output dp
    );
    
    wire [3:0] num0, num1;
    wire [6:0] segments;
    wire [3:0] An;
    wire [19:0] clk_div;
//    wire [4:0] swbnc;
    wire [4:0] addr;
    
    reg [7:0] data[0:31];
    
    initial $readmemb("data.mem", data);
    
    assign addr = {sw[4:0]};
    assign {num1,num0} = data[addr];
    assign seg = segments;
    assign clk_div[0] = clk;
    assign an = An;
    
    generate for(genvar i = 0;i<20;i = i+1) begin
        clock_divider div1(clk_div[i],clk_div[i+1]);
    end endgenerate
    
    assign clockdiv = clk_div[19];
    
//    generate for(genvar i = 0;i < 5; i = i + 1)begin
//        Switch_Handle sh1(sw[i],clockdiv,swbnc[i]);
//    end endgenerate
    
    seven_segment_tdm segment_controller(clk_div[19],4'b0000,4'b0000,num1,num0,segments,An,1);
    
endmodule
