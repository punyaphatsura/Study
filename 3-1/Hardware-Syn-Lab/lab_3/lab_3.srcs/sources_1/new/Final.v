`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 11:58:27 PM
// Design Name: 
// Module Name: Final
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


module Final(
    input [7:0] sw,
    input btnU,btnC,
    input clk,
    output [6:0] seg,
    output [3:0] an,
    output dp
    );
    wire btnU1,btnC1,btnU2,btnC2,spBtnU,spBtnC,bncBtnU,bncBtnC;
    wire cout0,bout0,cout1,bout1,cout2,bout2,cout3,bout3;
    wire [3:0]num0;
    wire [3:0]num1;
    wire [3:0]num2;
    wire [3:0]num3;
    wire [3:0]An;
    wire [7:0] sp_sw;
    wire clockdiv;
    wire [7:0] bncSw,sw1,sw2;
    wire [6:0] segments;
    wire [19:0] clk_div;
    
    assign clk_div[0] = clk;
    assign seg = segments;
    assign an = An;
    
    generate for(genvar i = 0;i<20;i = i+1) begin
        clock_divider div1(clk_div[i],clk_div[i+1]);
    end endgenerate
    
    assign clockdiv = clk_div[19];
    
    generate for(genvar i = 0;i < 8; i = i + 1)begin
        Debouncer db(sw[i],clk_div[19],bncSw[i]);
        DFlipFlop dff(bncSw[i],clk_div[19],sw1[i]);
        DFlipFlop dff2(sw1[i],clk_div[19],sw2[i]);
        Single_Pulser sp(sw2[i],clk_div[19],sp_sw[i]);
    end endgenerate
    
    Debouncer db2(btnU,clk_div[19],bncBtnU);
    Debouncer db3(btnC,clk_div[19],bncBtnC);
    DFlipFlop dff3(bncBtnU,clk_div[19],btnU1);
    DFlipFlop dff4(bncBtnC,clk_div[19],btnC1);
    DFlipFlop dff5(btnU1,clk_div[19],btnU2);
    DFlipFlop dff6(btnC1,clk_div[19],btnC2);
    Single_Pulser sp1(btnU2,clk_div[19],spBtnU);
    Single_Pulser sp2(btnC2,clk_div[19],spBtnC);
    
    BCD_Counter bcd0(sp_sw[1],sp_sw[0],spBtnU|cout3,spBtnC|bout3,clk_div[19],num0,cout0,bout0);
    BCD_Counter bcd1(sp_sw[3]|cout0,sp_sw[2]|bout0,spBtnU|cout3,spBtnC|bout3,clk_div[19],num1,cout1,bout1);
    BCD_Counter bcd2(sp_sw[5]|cout1,sp_sw[4]|bout1,spBtnU|cout3,spBtnC|bout3,clk_div[19],num2,cout2,bout2);
    BCD_Counter bcd3(sp_sw[7]|cout2,sp_sw[6]|bout2,spBtnU|cout3,spBtnC|bout3,clk_div[19],num3,cout3,bout3);
    
    seven_segment_tdm segment_controller(clk_div[19],num3,num2,num1,num0,segments,An,1);
    
endmodule
