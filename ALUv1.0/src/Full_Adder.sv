`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2022 10:58:00 PM
// Design Name: 
// Module Name: Full_Adder
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


module Full_Adder(
    input logic a,
    input logic b,
    input logic c_in,
    output logic sum,
    output logic c_out
    );
    logic wire_1, wire_2, wire_3;
    
    always_comb begin
        wire_1 = a ^ b;
        wire_2 = wire_1 & c_in;
        wire_3 = a & b;
        sum = wire_1 ^ c_in;
        c_out = wire_2 | wire_3;
    end
    
 
endmodule
