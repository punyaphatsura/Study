`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 02:29:03 AM
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
    input [7:0] sw,
    input clk,
    input btnU, btnR, btnD, btnL,
    output [6:0] seg,
    output [3:0] an,
    output dp
    );
    
    wire [6:0] segments;
    wire [3:0] An;
    wire [19:0] clk_div;
    wire [4:0] addr;
    
    reg [3:0] num2, num0, num1;
    reg [1:0] op = 2'b00;
    reg [11:0] data[1023:0];
    
    initial $readmemb("ROM.mem", data);
    
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

//    Switch_Handle sh2(btnU,clk_div[19],Add);
//    Switch_Handle sh3(btnL,clk_div[19],Sub);
//    Switch_Handle sh4(btnD,clk_div[19],Mul);
//    Switch_Handle sh5(btnR,clk_div[19],Div);
    
    always @(posedge clockdiv & (btnU||btnL||btnD||btnR)) begin
        case({btnU, btnL, btnD, btnR})
            4'b1000: op = 2'b00; // ADD
            4'b0100: op = 2'b01; // SUB
            4'b0010: op = 2'b10; // MUL
            4'b0001: op = 2'b11; // DIV
        endcase
        {num2,num1,num0} = data[{op, sw[7:0]}];

    end
    
    seven_segment_tdm segment_controller(clk_div[19],4'b0000,num2,num1,num0,segments,An,1);
    
endmodule
