`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2022 11:14:27 PM
// Design Name: 
// Module Name: ALU
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


module ALU#(parameter N=16)
(
    input logic [N-1:0] A,
    input logic [N-1:0] B,
    input logic [N-1:0] Reg0,
    input logic [N-1:0] Reg1,
    input logic [N-1:0] Reg2,
    input logic F0,
    input logic F1,
    input logic ENA,
    input logic ENB,
    input logic INVA,
    input logic INC,
    output logic [N-1:0] FUNC,
    output logic Ovflag
    );
    
    logic [N-1:0] A_, A_inv, A_adder, A_adder_OR, B_adder;
    logic [N-1:0] Final_Adder, Final_OR, Final_AND, Final_XOR;
    logic [N-1:0] F1_input1, F1_input2;
    logic [N-1:0] INC_Func, INC_Adder1, INC_Adder2;
    logic Ovf1, Ovf2, Ovf3;
    
    Mux #(.N(N)) mx1 (.A(Reg1),.B(Reg0),.en(INVA),.C(A_));
    assign A_inv =  A ^ A_;
    Mux #(.N(N)) mx2 (.A(A_inv),.B(Reg0),.en(ENA),.C(A_adder));
    Mux #(.N(N)) mx3 (.A(B),.B(Reg0),.en(ENB),.C(B_adder));
    Adder #(.N(N)) Add1 (.A(A_adder),.B(B_adder),.C_in(1'b0),.S(Final_Adder),.C_out(Ovf1));
    
    Mux #(.N(N)) mx4 (.A(A_adder),.B(A_),.en(ENA),.C(A_adder_OR));
    assign Final_OR =  A_adder_OR | B_adder;
    
    Mux #(.N(N)) mx5 (.A(Final_Adder),.B(Final_OR),.en(F0),.C(F1_input1));
    
    assign Final_AND = A_inv & B;
    
    assign Final_XOR = Reg1 ^ B;
    
    Mux #(.N(N)) mx6 (.A(Final_XOR),.B(Final_AND),.en(F0),.C(F1_input2));
    
    Mux #(.N(N)) mx7 (.A(F1_input1),.B(F1_input2),.en(F1),.C(INC_Adder2));
    
    Mux #(.N(N)) mx8 (.A(Reg2), .B(Reg0), .en(INC), .C(INC_Adder1));
    
    Adder #(.N(N)) Add3 (.A(INC_Adder1), .B(INC_Adder2), .C_in(1'b0), .S(FUNC), .C_out(Ovf2));
    
    or(Ovflag, Ovf1, Ovf2, Ovf3);

endmodule
