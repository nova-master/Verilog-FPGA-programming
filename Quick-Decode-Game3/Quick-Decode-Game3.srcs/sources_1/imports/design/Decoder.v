`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module Decoder(
  input [3:0] N,
  output [15:0] Q
);
assign Q[0] = ~N[3] & ~N[2] & ~N[1] & ~N[0];
assign Q[1] = ~N[3] & ~N[2] & ~N[1] & N[0];
assign Q[2] = ~N[3] & ~N[2] & N[1] & ~N[0];
assign Q[3] = ~N[3] & ~N[2] & N[1] & N[0];
assign Q[4] = ~N[3] & N[2] & ~N[1] & ~N[0];
assign Q[5] = ~N[3] & N[2] & ~N[1] & N[0];
assign Q[6] = ~N[3] & N[2] & N[1] & ~N[0];
assign Q[7] = ~N[3] & N[2] & N[1] & N[0];
assign Q[8] = N[3] & ~N[2] & ~N[1] & ~N[0];
assign Q[9] = N[3] & ~N[2] & ~N[1] & N[0];
assign Q[10] = N[3] & ~N[2] & N[1] & ~N[0];
assign Q[11] = N[3] & ~N[2] & N[1] & N[0];
assign Q[12] = N[3] & N[2] & ~N[1] & ~N[0];
assign Q[13] = N[3] & N[2] & ~N[1] & N[0];
assign Q[14] = N[3] & N[2] & N[1] & ~N[0];
assign Q[15] = N[3] & N[2] & N[1] & N[0];

endmodule
 
