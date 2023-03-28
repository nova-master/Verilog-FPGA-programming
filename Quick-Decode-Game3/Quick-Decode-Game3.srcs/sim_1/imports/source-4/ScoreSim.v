`timescale 1ns / 1ps
///////////////////////////
module ScoreSim;
  reg Up, Dw, clk;
  wire [3:0] Q;
  

  Score_Counter1 UUT (
    .clk(clk),
    .Up(Up),
    .Dw(Dw),
    .Q(Q)
  );
 initial begin
    clk = 0;
    #20
    forever 
    begin
   #20 clk=~clk;
   end
  end
  initial
  begin
  Up = 0;
  Dw = 0;
  #2000
  Up = 1;
  #500
  Up = 0;
  Dw = 1;
  #500
  Dw = 0;

     
    
 
  end

endmodule
