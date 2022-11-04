`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2022 10:55:59 PM
// Design Name: 
// Module Name: Adder
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


module Adder#(parameter N=16)
(   input logic [N-1:0] A,
    input logic [N-1:0] B,
    input logic C_in,
    output logic [N-1:0] S,
    output logic C_out
    );
    
    logic [N:0] C;
    assign C[0] = C_in;
    assign C_out = C[N];
    
    generate
        for (genvar i=0; i<N; i++) begin:add
            Full_Adder fa (
                .a (A[i]),
                .b (B[i]),
                .c_in (C[i]),
                .c_out (C[i+1]),
                .sum (S[i])
            );
        end
    endgenerate    
endmodule
