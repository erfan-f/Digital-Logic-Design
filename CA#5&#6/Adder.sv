`timescale 1ns/1ns

module Adder(input cin, input [15:0]A,B , output cout, output [15:0] S);

    assign {cout,S} = A + B + cin;

endmodule