module halfAdder(sum, carry, in1, in2);
        input in1, in2;
        output sum, carry;

        xor x1(sum, in1, in2);
        and a1(carry, in1, in2);

endmodule



module bit1FullAdder(sum, carry, in1, in2, cin);
        input in1, in2, cin;
        output sum, carry;
        wire s1, c1, c2;

        halfAdder ha1(s1, c1, in1, in2);
        halfAdder ha2(sum, c2, s1, cin);
        or o1(carry, c1, c2);

endmodule



module bit4FullAdder(sum, carry, in1, in2, cin);
        input [3:0] in1, in2;
        input cin;
        output [3:0] sum;
        output carry;
        wire c0, c1, c2;

        bit1FullAdder b1fa1(sum[0], c0, in1[0], in2[0], cin);
        bit1FullAdder b1fa2(sum[1], c1, in1[1], in2[1], c0);
        bit1FullAdder b1fa3(sum[2], c2, in1[2], in2[2], c1);
        bit1FullAdder b1fa4(sum[3], carry, in1[3], in2[3], c2);

endmodule


module bit8FullAdder(sum, carry, in1, in2, cin);
        input [7:0] in1, in2;
        input cin;
        output [7:0] sum;
        output carry;
        wire ctemp;

        bit4FullAdder b4fa1(sum[3:0], ctemp, in1[3:0], in2[3:0], cin);
        bit4FullAdder b4fa2(sum[7:4], carry, in1[7:4], in2[7:4], ctemp);
        
endmodule



module bit32FullAdder(sum, carry, in1, in2, cin);
        input [31:0] in1, in2;
        input cin;
        output [31:0] sum;
        output carry;
        wire ctemp1, ctemp2, ctemp3;

        bit8FullAdder b8fa1(sum[7:0], ctemp1, in1[7:0], in2[7:0], cin);
        bit8FullAdder b8fa2(sum[15:8], ctemp2, in1[15:8], in2[15:8], ctemp1);
        bit8FullAdder b8fa3(sum[23:16], ctemp3, in1[23:16], in2[23:16], ctemp2);
        bit8FullAdder b8fa4(sum[31:24], carry, in1[31:24], in2[31:24], ctemp3);

endmodule

/*module testbench4;
	reg [31:0] in1, in2;
	reg cin;
	wire [31:0] sum;
	wire carry;
	bit32FullAdder ebfa1(sum, carry, in1, in2, cin);
	initial
		begin
		$monitor($time, "    input1 = %b, input2 = %b, carryIn = %b, sum = %b, carry = %b", in1, in2, cin, sum, carry);
		#2 in1 = 32'b 10000001000000010000000100000001; in2 = 32'b 01000000010000000100000001000000; cin = 1'b 0;
		end
		
endmodule*/

