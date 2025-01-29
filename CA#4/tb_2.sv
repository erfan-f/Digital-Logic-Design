`timescale 1ns/1ns

module Harmonic_Adder_TB();

    logic [3:0] n = 6;
    logic clk = 0, reset = 0, start = 0;
    logic [18:0] sum; 

    HA ha(.clk(clk), .reset(reset),.start(start), .n(n), .sum(sum));

    always #10 clk = ~clk;

    initial begin
	    #5 reset = 1; #15 reset = 0;
        #10 start = 1; #45 start = 0;
        #500
        #10 n = 2;
        #10 start = 1; #45 start = 0;
        #180 $stop;

    end

endmodule

