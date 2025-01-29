`timescale 1ns/1ns
`include "ones_counter.sv"

module _1BitAdder(input A,B,cin, output S,cout);

    onesCounter onesCounter(A,B,cin, cout,S);

endmodule


module _2BitAdder(input [1:0] A,B, input cin, output [1:0] S, output cout);

    wire _1cin;
    _1BitAdder OC1(A[0],B[0],cin,S[0],_1cin);
    _1BitAdder OC2(A[1],B[1],_1cin,S[1],cout);

endmodule

module _3BitAdder(input [2:0] A,B, input cin, output [2:0] S, output cout);

    wire _1cin;
    _1BitAdder OneBA(A[0],B[0],cin,S[0],_1cin);
    _2BitAdder TwoBA(A[2:1],B[2:1],_1cin,S[2:1],cout);

endmodule


module _4BitAdder(input [3:0] A,B, input cin, output [3:0] S, output cout);

    wire _1cin;
    _2BitAdder TwoBA1(A[1:0],B[1:0],cin,S[1:0],_1cin);
    _2BitAdder TwoBA2(A[3:2],B[3:2],_1cin,S[3:2],cout);

endmodule


module _5BitAdder(input [4:0] A,B, input cin, output [4:0] S, output cout);

    wire _1cin;
    _2BitAdder TwoBA1(A[1:0],B[1:0],cin,S[1:0],_1cin);
    _3BitAdder ThreeBA1(A[4:2],B[4:2],_1cin,S[4:2],cout);

endmodule



