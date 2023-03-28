`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2023 05:05:58 PM
// Design Name: 
// Module Name: 2to1mux
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


module twotoonemux(
    input [6:0] i0,
    input [6:0] i1,
    input s,
    output [6:0] out
    );
    wire [6:0] w;
    assign w = {7{s}};
    assign out = (i0 & ~w) | (i1 & w);
endmodule
