`timescale 1ns/1ns
`include "Latch.sv"

module NandLatch_TB();

    logic S = 1,R = 1,clk = 0;
    wire Q;

    SRLatchNand Latch(clk, S, R, Q);

    initial begin
        #86 S = 0;
        #60
        #73 S = 1; R = 0;
        #96 S = 0; R = 1;
        #100 S = 1;
        #109 R = 0;
        #110 R = 0; S = 0;
        #56
        #49 R = 1;
        #43
        #78 clk = 1;
        #65
        #125 R = 0; S= 1;
        #90
        #57 S = 0;
        #110 $stop;
    end

endmodule



