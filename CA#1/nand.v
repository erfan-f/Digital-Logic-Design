`timescale 1ns/1ns
module twoInputNandGate(input a, b, output w);
    wire j;
    supply1 Vdd;
    supply0 Gnd;

    pmos #(4,7,9) T1(w,Vdd,a), T2(w,Vdd,b);
    nmos #(3,5,7) T3(w,j,a), T4(j,Gnd,b);
endmodule


module primitiveNand(input a,b, output w);

    nand #(14,10) (w,a,b);
    
endmodule