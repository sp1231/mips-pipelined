module TwoToFourDecoder(out, in);
	input [1:0] in;
	output [3:0] out;
	wire [1:0] w;
	
	not n1(w[0], in[0]);
	not n2(w[1], in[1]);
	
	and a0(out[0], w[0], w[1]);
	and a1(out[1], in[0], w[1]);
	and a2(out[2], w[0], in[1]);
	and a3(out[3], in[0], in[1]);

endmodule