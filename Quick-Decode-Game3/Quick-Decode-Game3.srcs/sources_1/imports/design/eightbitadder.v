`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2023 03:50:06 PM
// Design Name: 
// Module Name: 8bitadder
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


module eightbitadder(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output [7:0]S,
    output Cout
    );
    
    wire [6:0] c;
    FullAdder  adder0 (.a(A[0]), .b(B[0]), .Cin(Cin), .s(S[0]), .Cout(c[0]));
    FullAdder  adder1 (.a(A[1]), .b(B[1]), .Cin(c[0]), .s(S[1]), .Cout(c[1]));
    FullAdder  adder2 (.a(A[2]), .b(B[2]), .Cin(c[1]), .s(S[2]), .Cout(c[2]));
    FullAdder  adder3 (.a(A[3]), .b(B[3]), .Cin(c[2]), .s(S[3]), .Cout(c[3]));
    FullAdder  adder4 (.a(A[4]), .b(B[4]), .Cin(c[3]), .s(S[4]), .Cout(c[4]));
    FullAdder  adder5 (.a(A[5]), .b(B[5]), .Cin(c[4]), .s(S[5]), .Cout(c[5]));
    FullAdder  adder6 (.a(A[6]), .b(B[6]), .Cin(c[5]), .s(S[6]), .Cout(c[6]));
    FullAdder  adder7 (.a(A[7]), .b(B[7]), .Cin(c[6]), .s(S[7]), .Cout(c[7]));
    
endmodule
