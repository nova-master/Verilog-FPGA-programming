`timescale 1ns/1ps
// Verilog code to test UTC and DTC of your 15 bit counter
// Winter 2023



module testTC();
    reg clkin, btnC, btnR;
    reg [15:0] sw;
    wire [15:0] led;
    wire dp;
    wire [3:0] an;
    wire [6:0] seg;
  
  TOP // replace with your top level module's name
   UUT (
        .clkin(clkin),
        .btnC(btnC),
        .btnR(btnR),
        .sw(sw),
        .led(led),
        .an(an),
        .seg(seg)
      );
     
    parameter PERIOD = 10;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 2;
    
    initial    // Clock process for clkin
    begin
    
      btnC = 1'b0;
      btnR = 1'b0;
      sw = 16'b0;
       #OFFSET
        clkin = 1'b1;
       forever
         begin
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clkin = ~clkin;
         end
      end
    
    initial
    begin
    #2000

    btnC = 1'b1;
    #200
    btnC = 1'b0;
    #20
    sw[0] = 1;

    end
 
endmodule