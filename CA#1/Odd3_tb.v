`timescale 1ns/1ns

module Odd3TB();

    reg aa=0,bb=0,cc=0;
    wire ww;

    Odd3 OddUT(aa,bb,cc,ww);

    initial begin
        #50 aa = 1;
        #57
        #40 bb = 1;
        #50
        #60 cc = 1;
        repeat(5) #80 aa = ~aa;
        #50 bb = 0;
        #60 
        $stop;
    end

endmodule