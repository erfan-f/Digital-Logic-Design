`timescale 1ns/1ns
`include "Latch.sv"

module Register8Bit(input clk,R, input [7:0] PI,output [7:0] PO);

    genvar k;
    generate
        for (k = 0; k<8; k=k+1) begin : dlatch
            DLatch2 dd (clk, R, PI[k], PO[k]);
        end
    endgenerate

endmodule


module Register8Bit_MSDFF(input clk,R, input [7:0] PI,output [7:0] PO);

    genvar k;
    generate
        for (k = 0; k<8; k=k+1) begin : ms_dff
            MSDFF msdff (clk, R, PI[k], PO[k]);
        end
    endgenerate

endmodule