`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2022 12:14:52 AM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
    timeunit 1ns;
    timeprecision 1ps;
    localparam CLK_PERIOD = 10;
    logic clk;
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk <= ~clk;
    end
    
    localparam N = 16;
    
    logic [N-1:0] A,B, Reg0, Reg1, FUNC;
    logic F0, F1, ENA, ENB, INVA, INC, Ovflag;
    
    ALU #(.N(N)) dut (.*);
    
    initial begin
        @(posedge clk);
        A <= 16'd1;
        B <= 16'd1;
        Reg0 <= 16'd0;
        Reg1 <= 16'd65535;
        F0 <= 1'b0;
        F1 <= 1'b1;
        ENA <= 1'b1;
        ENB <= 1'b0;
        INVA <= 1'b0;
        INC <= 1'b0;
    end

endmodule
