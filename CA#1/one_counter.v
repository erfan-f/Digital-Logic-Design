`timescale 1ns/1ns

module oneCounter(input a,b,c, output w,z);

    Maj1 m1(a,b,c,w);
    Odd3 o1(a,b,c,z);

endmodule



