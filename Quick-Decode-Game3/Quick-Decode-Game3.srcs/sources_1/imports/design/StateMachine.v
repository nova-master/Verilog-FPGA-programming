`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////
//module FSM(
//input clk, Go, anysw, T4, T2, match, won, lost,
//output LoadTarget, Rtime, IncScore, DecScore, ShowTarget, FlashScore, FlashLed
//    );
//    wire [5:0] Q;
//    wire [5:0] D;
        
//        FSM_logic  ex3_1hot_logic (.Go(Go), .anysw(anysw), .T4(T4), .T2(T2), .match(match), .won(won), .lost(lost), .Q(Q), .LoadTarget(LoadTarget), .Rtime(Rtime), .IncScore(IncScore), .DecScore(DecScore), .ShowTarget(ShowTarget), .FlashScore(FlashScore), .FlashLed(FlashLed), .D(D) );
        
//       FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(1'b1), .D(D[0]), .Q(Q[0]));
//       FDRE #(.INIT(1'b0)) Q1to9_FF[5:1] (.C({5{clk}}), .CE({5{1'b1}}), .D(D[5:1]), .Q(Q[5:1]));
//  endmodule
//#################################################################################################//
module FSM(
    input clk, Go,anysw,T4,T2,match,won,lost,
    //input [5:0] Q,
    output LoadTarget, Rtime, IncScore, DecScore, ShowTarget, FlashScore, FlashLed,
    output [6:0] LEDS
    //output [5:0] D
    );
    wire [6:0] Q;
    wire [6:0] D;

    
                             assign D[0] = (~Go & Q[0]) | (Go & anysw & Q[0]) | ((T4 & ~lost)&Q[2]) | ((~won&T2)&Q[4]) ;
                             assign D[1] = ((~anysw&~T2)&Q[1]) | ((~anysw&Go)&Q[0]) ;
                             assign D[2] = (~T4&Q[2]) | ((T2 | (~match&anysw))&Q[1]);
                             assign D[3] = ((~T2&match)&Q[1]) | (~T2 & Q[3]);
                             assign D[4] = (~T2 & Q[4]) | (T2 & Q[3]);
                             assign D[5] = (won&Q[4]) | Q[5];
                             assign D[6] = (lost&Q[2]) | Q[6];
                                        
    assign LoadTarget = Q[0];
    assign Rtime = ((~anysw&Go)&Q[0]) | ((~T2&match)&Q[1]) | (( T2 | ( ~match & anysw))&Q[1]) | (T2 & Q[3]) ;    
    assign IncScore = T2 & Q[3]; 
    assign DecScore = ((T2 | (~match&anysw)) &Q[1]);    
    assign ShowTarget = ~Q[0] ;    
    assign FlashScore = (won&Q[3]) | Q[3] | T2 & Q[3] | Q[4] | Q[5];    
    assign FlashLed = (lost&Q[2]) | Q[2] | Q[5] | Q[6]; 
    
       FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(1'b1), .D(D[0]), .Q(Q[0]));
       FDRE #(.INIT(1'b0)) Q1to9_FF[6:1] (.C({6{clk}}), .CE({6{1'b1}}), .D(D[6:1]), .Q(Q[6:1]));    
   
   assign LEDS = Q;
     
endmodule
    
    
    
    
    
    
    
    
    
    
