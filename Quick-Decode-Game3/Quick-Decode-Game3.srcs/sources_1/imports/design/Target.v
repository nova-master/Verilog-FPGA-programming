`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2023 01:00:28 PM
// Design Name: 
// Module Name: Target
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


module Target(
input clk,
input CE,
input [3:0] D,
output [3:0] Q
);
wire [3:0] t;

FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .CE(CE), .D(D[0]), .Q(t[0]));
FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(CE), .D(D[1]), .Q(t[1]));
FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(CE), .D(D[2]), .Q(t[2]));
FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(CE), .D(D[3]), .Q(t[3]));
assign Q=t; 

endmodule
