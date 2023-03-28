`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module Time_Counter(

input Inc,R,CE, clk,//R=reset // Inc=increment/Inc
output [6:0] Q
    );
                  //used as the enable signal for all flip-flops.
wire [6:0]D;           //used to store the data input for the flip-flops


//assigns the value of the logic expression to the wire D to determine the value of D[0] to D[3]
assign D[0]=Q[0]^(Inc);
assign D[1]=Q[1]^(Inc&Q[0]);
assign D[2]=Q[2]^(Inc&Q[0]&Q[1]);
assign D[3]=Q[3]^(Inc&Q[0]&Q[1]&Q[2]);
assign D[4]=Q[4]^(Inc&Q[0]&Q[1]&Q[2]&Q[3]);
assign D[5]=Q[5]^(Inc&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]);
assign D[6]=Q[6]^(Inc&Q[0]&Q[1]&Q[2]&Q[3]&Q[4]&Q[5]);

                             
FDRE #(.INIT(1'b0)) ff_0 (.C(clk), .R(R), .CE(CE), .D(D[0]), .Q(Q[0]));
FDRE #(.INIT(1'b0)) ff_1 (.C(clk), .R(R), .CE(CE), .D(D[1]), .Q(Q[1]));
FDRE #(.INIT(1'b0)) ff_2 (.C(clk), .R(R), .CE(CE), .D(D[2]), .Q(Q[2]));
FDRE #(.INIT(1'b0)) ff_3 (.C(clk), .R(R), .CE(CE), .D(D[3]), .Q(Q[3]));
FDRE #(.INIT(1'b0)) ff_4 (.C(clk), .R(R), .CE(CE), .D(D[4]), .Q(Q[4]));
FDRE #(.INIT(1'b0)) ff_5 (.C(clk), .R(R), .CE(CE), .D(D[5]), .Q(Q[5]));
FDRE #(.INIT(1'b0)) ff_6 (.C(clk), .R(R), .CE(CE), .D(D[6]), .Q(Q[6]));

endmodule

