`timescale 1ns/1ns
`include "Adder.sv"

module _63OC(input [62:0] A, output [5:0] W);

    wire initial_cin = 0;
    wire cout, _cout;
    wire [31:0] B;
    wire [23:0] C;
    wire [15:0] D;
    wire [9:0] E;

    _1BitAdder OA1(A[0],A[1],A[2],B[0],B[1]);
    _1BitAdder OA2(A[3],A[4],A[5],B[2],B[3]);
    _1BitAdder OA3(A[6],A[7],A[8],B[4],B[5]);
    _1BitAdder OA4(A[9],A[10],A[11],B[6],B[7]);
    _1BitAdder OA5(A[12],A[13],A[14],B[8],B[9]);
    _1BitAdder OA6(A[15],A[16],A[17],B[10],B[11]);
    _1BitAdder OA7(A[18],A[19],A[20],B[12],B[13]);
    _1BitAdder OA8(A[21],A[22],A[23],B[14],B[15]);
    _1BitAdder OA9(A[24],A[25],A[26],B[16],B[17]);
    _1BitAdder OA10(A[27],A[28],A[29],B[18],B[19]);
    _1BitAdder OA11(A[30],A[31],A[32],B[20],B[21]);
    _1BitAdder OA12(A[33],A[34],A[35],B[22],B[23]);
    _1BitAdder OA13(A[36],A[37],A[38],B[24],B[25]);
    _1BitAdder OA14(A[39],A[40],A[41],B[26],B[27]);
    _1BitAdder OA15(A[42],A[43],A[44],B[28],B[29]);
    _1BitAdder OA16(A[45],A[46],A[47],B[30],B[31]);


    _2BitAdder TA1(B[3:2],B[1:0],A[48],C[1:0],C[2]);
    _2BitAdder TA2(B[7:6],B[5:4],A[49],C[4:3],C[5]);
    _2BitAdder TA3(B[11:10],B[9:8],A[50],C[7:6],C[8]);
    _2BitAdder TA4(B[15:14],B[13:12],A[51],C[10:9],C[11]);
    _2BitAdder TA5(B[19:18],B[17:16],A[52],C[13:12],C[14]);
    _2BitAdder TA6(B[23:22],B[21:20],A[53],C[16:15],C[17]);
    _2BitAdder TA7(B[27:26],B[25:24],A[54],C[19:18],C[20]);
    _2BitAdder TA8(B[31:30],B[29:28],A[55],C[22:21],C[23]);

    _3BitAdder THA1(C[5:3],C[2:0],A[56],D[2:0],D[3]);
    _3BitAdder THA2(C[11:9],C[8:6],A[57],D[6:4],D[7]);
    _3BitAdder THA3(C[17:15],C[14:12],A[58],D[10:8],D[11]);
    _3BitAdder THA4(C[23:21],C[20:18],A[59],D[14:12],D[15]);

    _4BitAdder FA1(D[7:4],D[3:0],A[60],E[3:0],E[4]);
    _4BitAdder FA2(D[15:12],D[11:8],A[61],E[8:5],E[9]);

    _5BitAdder FiA1(E[4:0],E[9:5],A[62],W[4:0],W[5]);

endmodule