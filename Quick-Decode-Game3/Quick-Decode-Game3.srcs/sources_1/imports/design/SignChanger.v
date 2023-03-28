`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module SignChanger(
    input [7:0] a,
    input sign,
    output[7:0] b
    );
    wire [7:0] c;
    wire w;
    eightbitadder add (.A(~a), .B(8'b00000001), .Cin(8'b0), .S(c), .Cout(w));
    twotoonemux mux (.i0(a), .i1(c), .s(sign), .out(b));
    
    
endmodule
