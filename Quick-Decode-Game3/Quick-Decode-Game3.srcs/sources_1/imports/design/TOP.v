`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module TOP(
input clkin,btnC,btnR,
input [15:0] sw,
output [15:0] led,
output [3:0] an,
output [6:0] seg
);
  wire clkold,digsel,qsec,dp,start,Dec,T4,T2,R,Rtime,t1,t2,FlashLed,FlashScore,ShowTarget,LoadTarget;
  wire won,lost,match;
    wire [3:0] score_value; 
  wire [5:0] timeout; 
  wire [3:0] number;  
  wire [3:0] rndnumber;  
  wire [3:0] targetnumber;  
  wire [3:0] correct_number; 
  wire [3:0] selx1;
  wire [3:0] selx2;
   wire [15:0] lednumber;
   wire [3:0] selout1;
  wire [3:0] selout2;
 
  wire CE1;
  wire clk;
  wire [6:0] seg1;
  wire [6:0] seg2;
  wire [6:0] seg3;
  wire [6:0] seg4;
  wire [6:0] seg11;
  wire [6:0] seg22;
  wire [1:0] selseg;
  wire Go;
  wire Inc;
  wire Inc1;
  wire Dec1;
  wire Incnew;
 wire  Decnew;
wire btnCnew;
wire signout;
wire overflow;
wire CE;
  
   qsec_clks slowit (.clkin(clkin), .greset(btnR), .clk(clk), .digsel(digsel), .qsec(qsec));
   //Clock_divider devider (.clkold(clkold), .clk(clk));
                           //assign start=digsel;
                           //assign CE1 =( sw[15:0] == 16'h0000) ? 1'b1 : 1'b0;
                           //assign Go=btnC;
                           assign won = (score_value == 4'b0100) ? 1'b1 : 1'b0;
                            assign lost = (score_value == 4'b1100) ? 1'b1 : 1'b0;
                                 assign match = (sw == lednumber) ? 1'b1 : 1'b0;
                                 //lednumber
  Time_Counter sec (.Inc(qsec), .R(Rtime), .clk(clk), .CE(1'b1), .Q(timeout));
  assign T2 = timeout[3];
  assign T4 = timeout[4];
  wire [5:0] LEDS;
 FSM states (.clk(clk), .Go(btnC), .anysw(|sw), .T4(T4), .T2(T2), .match(match), .won(won), .lost(lost), 
 .LoadTarget(LoadTarget), .Rtime(Rtime), .IncScore(Inc), .DecScore(Dec), .ShowTarget(ShowTarget), .FlashScore(FlashScore), .FlashLed(FlashLed) ,.LEDS(LEDS));
//////########################/
    
  LFSR random (.clk(clk), .CE(1'b1), .rnd(rndnumber));
  Target  tar ( .clk(clk), .CE(LoadTarget), .D(rndnumber), .Q(targetnumber));
 
  Decoder decode1 (.N(targetnumber), .Q(lednumber));
//   //########################//
//assign Inc = match;
//assign Dec = ~{16{match}}&sw;

//Edge_detector edg1 (.X(Inc), .clk(clk), .Y(Incnew)) ;
//Edge_detector edg2 (.X(Dec), .clk(clk), .Y(Decnew)) ;
//Edge_detector edg3 (.X(btnC), .clk(clk), .Y(btnCnew)) ;

Score_Counter1 scoreb (.clk(clk), .Up(Inc), .Dw(Dec), .Q(score_value));

wire [3:0] RingOut;
RingCounter ring (.digsel(digsel), .clk(clk), .q(RingOut));

wire [3:0]selectOut;
wire [7:0] scorenew;

Selector select (.sel(RingOut), .N({targetnumber, 4'b0, scorenew}), .H(selectOut));
//Score_Counter score1 (.clk(clk), .dir(Incnew), .Q(score_value));
//Score_Counter_down score2 (.clk(clk), .dw(Decnew), .Q(score_value));
wire [6:0]signn;
assign signn = {7{score_value[3]}};

 SignChanger sign (.a({{4{score_value[3]}}, score_value}),.sign(score_value[3]),.b(scorenew));
// assign signn = ( score_value >= 4'b1111) && ( score_value >= 4'b1100) ? 1'b1 : 1'b0 ;
 
  wire [1:0] selmux;
  wire [6:0] hexOut;
  hex7seg display1 (.i(selectOut),.seg(hexOut));
//  //########################//
 
//  selectline ss (.clk(clk), .CE(digsel), .R(1'b0), .Inc(1'b1), .Q(selmux));
                      

// assign an[0]= ((selmux == 2'b00)) ? 0 : 1;
// assign an[1]= ((selmux == 2'b01)) ? 0 : 1;
// assign an[2]= ((selmux == 2'b10)) ? 0 : 1;
// assign an[3]= ((selmux == 2'b11)) ? 0 : 1;
                     
//                      assign dp=1;
//                      assign seg3=7'b1111111;
//                      //assign seg2=7'b0111111;
//                       assign seg2 = (Dec == 1) ? 7'b0111111 : 7'b1111111;
                      
//  hex7seg display1 (.i(rndnumber),.seg(seg4)); 
//  hex7seg display2 (.i(score_value),.seg(seg1)); 

//  fourtoonemux mux4 (.i0(seg1), .i1(seg2), .i2(seg3), .i3(seg4), .s(selmux), .out(seg));
  assign an[3] = ~(RingOut[3] & ShowTarget);
  assign an[0] = ~(RingOut[0] & FlashScore & timeout[0] | ~FlashScore & RingOut[0]);
  
  assign led = (~{16{won}} & lednumber & {16{FlashLed}} & {16{timeout[0]}})| ({16{won}} & {16{1'b1}} & {16{FlashLed}} & {16{timeout[0]}});
  //assign led[14:0] = {8'b0, LEDS};
  wire [6:0] mux1;
  assign mux1 = (~signn & 7'b1111111) | (signn & 7'b0111111);
  assign seg = (~{7{RingOut[1]}} & hexOut | {7{RingOut[1]}} & mux1);
  assign an[1] = ~((FlashScore & timeout[0] & RingOut[1] & score_value[3])| (RingOut[1] & ~FlashScore & score_value[3]));
  
  //twotoonemux(.i0(hexOut), .i1(~hexOut), .s(mux_select), .out(seg));
  //WHAT TO DO: NEGATIVE SIGN LOGIC
  //ringoutcnterout[1];
  //negative sign should display if ringcounter 0010 is up and if score_value[3] is 1
  // FIX SCORE COUNTER
endmodule
