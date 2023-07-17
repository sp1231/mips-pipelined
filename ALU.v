`include "adder.v"
`include "gates.v"
`include "mux.v"

module ALU(Result, in1, in2, Operation, Cin, Carry, Binvert);
        input [31:0] in1, in2;
        input [1:0] Operation;
        input Binvert, Cin;
        output [31:0] Result;
        output Carry;
        wire [31:0] not_in2, mux_out, and_out, or_out, sum;
        

        bit32Not n1(not_in2, in2);
        bit32_mux2to1 m1(mux_out, Binvert, in2, not_in2);
        bit32FullAdder f1(sum, Carry, in1, mux_out, Cin);
        bit32And a1(and_out, in1, mux_out);
        bit32Or o1(or_out, in1, mux_out);
        bit32_mux3to1 m2(Result, Operation, and_out, or_out, sum);
        
endmodule