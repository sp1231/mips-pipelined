`include "Reg32.v" 
`include "decoderFiveToThirtyTwo.v"
`include "mux.v"

module RegFile(clk, reset, ReadReg1, ReadReg2, WriteData, WriteReg, RegWrite, ReadData1, ReadData2);
        input clk, reset, RegWrite;
        input [31:0] WriteData;
        input [4:0] WriteReg, ReadReg1, ReadReg2;
        output [31:0] ReadData1, ReadData2;
        wire [31:0] decw;
        wire[31:0] andout;
        wire[31:0] q;
        wire andw;

        genvar j,n;
        fiveToThirtyTwoDecoder dec(decw, WriteReg);
        generate
                for (j=0; j<4; j=j+1)begin: reg_loop
                and a1(andw, clk, RegWrite);
                and a2(andout[j], decw[j], andw);
                end
        endgenerate

        generate
                for (n = 0; n<32 ; n=n+1 ) begin
                        reg_32bit r1(q[n], WriteData, andout[n], reset);
                end
        endgenerate
  
endmodule