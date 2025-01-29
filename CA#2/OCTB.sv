`timescale 1ns/1ns
`include "63BitOne'sCounter.sv"

module Counter_TB();
    logic [62:0] AA = 63'b000000000000000111111111111000000000000001111111111111100;
    wire [5:0] WW;

    _63BitOnesCounter counter(AA,WW);

    initial begin
        #896 AA[5] = 0;
        #1000
        #235 AA[62] = 1;
        #1235 
        repeat(2) #2000  AA[60] = ~AA[60];
        #1365
        $stop;
    end
endmodule

