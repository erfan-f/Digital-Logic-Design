`timescale 1ns/1ns

module onesCounter(input a,b,c, output w,z);

    Maj3 m1(a,b,c,w);
    Odd3 o1(a,b,c,z);

endmodule
