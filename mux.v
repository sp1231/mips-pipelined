module mux2to1(out, select, in1, in2);
        input in1, in2, select;
        output out;
        wire not_select, w1, w2;

        not(not_select, select);
        and(w1, not_select, in1);
        and(w2, select, in2);
        or(out, w1, w2);

endmodule

module bit32_mux2to1(out, select, in1, in2);
        input [31:0] in1, in2;
        input select;
        output [31:0] out;
        genvar j;

        generate
            for (j=0; j<32 ;j = j+1 ) begin: mux_loop
                mux2to1 m1(out[j], select, in1[j], in2[j]);
            end
        endgenerate

endmodule

module mux3to1(out, select, in1, in2, in3);
        input in1, in2, in3;
        input [1:0] select;
        output out;
        wire w;

        mux2to1 m1(w, select[0], in1, in2); 
        mux2to1 m2(out, select[1], w, in3);

endmodule

module bit32_mux3to1(out, select, in1, in2, in3);
        input [31:0] in1, in2, in3;
        input [1:0] select;
        output [31:0] out;
        genvar j;

        generate
            for (j=0; j<32 ;j = j+1 ) begin: mux_loop
                mux3to1 m1(out[j], select, in1[j], in2[j], in3[j]);
            end
        endgenerate

endmodule

