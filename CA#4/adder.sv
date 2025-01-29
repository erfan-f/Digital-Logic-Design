`timescale 1ns/1ns

module Adder(input en,cin, input [18:0]A,B , output [18:0] S);

    assign S = (en) ? (A+B+cin) : 0; 

endmodule


