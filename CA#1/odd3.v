`timescale 1ns/1ns
module Odd3(input a,b,c, output w);

assign #(28,27) w = (~a & ~b & c) | (~a & b & ~c) | (a & ~b & ~c) | (a & b & c);

endmodule

