`timescale 1ns/1ns
module notGate(input a, output w);
supply1 Vdd;
supply0 Gnd;

pmos #(4,7,9) T1(w,Vdd,a);
nmos #(3,5,7) T2(w,Gnd,a);
endmodule