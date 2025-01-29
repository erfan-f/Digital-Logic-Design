`timescale 1ns/1ns


module Dlatch_TB();

    logic clk = 1, D = 0;
    wire Q;

    DLatch1 Latch(clk, D, Q);

    initial begin
        #50 clk = 0;
        #20 
        #60 D = 1;
        #50 clk = 1;
        repeat(5) #100 clk = ~clk;
        #47 D = 0;
        #25
        repeat(5) #100 clk = ~clk;
        #42 
        repeat(3) #96 D = ~D;
        #50 clk = 0;
        #120 $stop;
    end

endmodule



