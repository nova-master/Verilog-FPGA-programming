module FullAdder(
    input a,
    input b,
    input Cin,
    output s,
    output Cout
    );
    assign Cout = a & b | a & Cin | b & Cin;  
    assign s = a ^ b ^ Cin;
    
    endmodule