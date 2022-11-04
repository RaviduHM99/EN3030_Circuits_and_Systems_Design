`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2022 10:41:32 PM
// Design Name: 
// Module Name: Mux
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


module Mux#(parameter N=16)
(
    input logic [N-1:0]A,
    input logic [N-1:0]B,
    input logic en,
    output logic [N-1:0]C
    );
    
    assign C = en ? A : B;
endmodule
