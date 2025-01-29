`timescale 1ns/1ns
`include "register.sv"


module Add8Bit(input [7:0]A,B,input cin, output [7:0] S, output cout);

 assign #(296) {cout,S} = A + B + cin;

endmodule


module SequenceAdder(input clock, reset, input [7:0] A, output [7:0] P);

    wire [7:0] PI;
    wire cout;
    Add8Bit ADD(A ,P ,0 ,PI, cout);
    Register8Bit Rei(clock,reset,PI,P);

endmodule

module SequenceAdder_MSDFF(input clock, reset, input [7:0] A, output [7:0] P);

    wire [7:0] PI;
    wire cout;
    Add8Bit ADD(A ,P ,0 ,PI, cout);
    Register8Bit_MSDFF Rei(clock,reset,PI,P);

endmodule


