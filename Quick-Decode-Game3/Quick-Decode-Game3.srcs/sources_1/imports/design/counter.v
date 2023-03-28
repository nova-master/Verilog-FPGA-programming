`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2023 10:29:27 AM
// Design Name: 
// Module Name: countUD4L
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


module Score_Counter1(
input Up, Dw, clk,
output [3:0] Q
    );
wire t1;               //used as the enable signal for all flip-flops.
wire [3:0]D;           //used to store the data input for the flip-flops


//assigns the value of the logic expression to the wire D to determine the value of D[0] to D[3]
assign D[0]=((Q[0]^((Up)|(~Up&Dw))));
assign D[1]=((Q[1]^((Up&Q[0])|(~Up&Dw&~Q[0]))));
assign D[2]=((Q[2]^((Up&Q[0]&Q[1])|(~Up&Dw&~Q[0]&~Q[1]))));
assign D[3]=((Q[3]^((Up&Q[0]&Q[1]&Q[2])|(~Up&Dw&~Q[0]&~Q[1]&~Q[2]))));

assign t1=(Up|Dw);                                                       // at least one of these input should be high                                       ////Goint to high when all Q3Q2Q1Q0=0000
FDRE #(.INIT(1'b0)) ff_0 (.C(clk), .R(1'b0), .CE(t1), .D(D[0]), .Q(Q[0]));
FDRE #(.INIT(1'b0)) ff_1 (.C(clk), .R(1'b0), .CE(t1), .D(D[1]), .Q(Q[1]));
FDRE #(.INIT(1'b0)) ff_2 (.C(clk), .R(1'b0), .CE(t1), .D(D[2]), .Q(Q[2]));
FDRE #(.INIT(1'b0)) ff_3 (.C(clk), .R(1'b0), .CE(t1), .D(D[3]), .Q(Q[3]));
endmodule


//http://www.ajbasweb.com/old/ajbas/2011/July-2011/63-71.pdf
//https://www.vlsifacts.com/circuit-design-4-bit-binary-counter-using-d-flip-flops/
//https://drive.google.com/file/d/0B2D2Vl5_6vK1MkVVWkNETk1adnc/view?resourcekey=0-jZoNcsiGCirNY3zl5afjtw
//https://www.dirzon.com/Doc/ReaderAsync?target=telegram%3Amade%20easy%20digital%20electronics.pdf page number 72
//youtube.com



















