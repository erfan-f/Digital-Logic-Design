`timescale 1ns/1ns

module Maj1(input a,b,c, output w);

    wire i,j,p,m,n,k;
    supply1 Vdd;
    supply0 Gnd;
    pmos #(4,7,9) T1(i,Vdd,a), T2(i,Vdd,b), T3(j,i,c), T4(j,i,b), T5(k,j,c), T6(k,j,a), T7(w,Vdd,k);
    nmos #(3,5,7) T8(p,Gnd,c), T9(k,p,a), T10(m,Gnd,b), T11(k,m,a), T12(n,Gnd,b), T13(k,n,c), T14(w,Gnd,k);
  
endmodule


module Maj2(input a,b,c, output w);

    wire i,j,k,m,n;
    twoInputNandGate NAND1(a,c,i);
    twoInputNandGate NAND2(a,b,j);
    twoInputNandGate NAND3(b,c,k);
    twoInputNandGate NAND4(i,j,m);
    twoInputNandGate NAND5(n,k,w);
    notGate NOT1(m,n);

endmodule

module Maj3(input a,b,c, output w);

    assign #(34,23) w = (a&b) | (a&c) | (b&c); 

endmodule




