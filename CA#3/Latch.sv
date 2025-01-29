`timescale 1ns/1ns 

module SRLatchNand(input clk,S,R, output Q);

    wire x,y,Qbar;

    or #(7) OR1(y, clk, R);
    or #(7) OR2(x, clk, S);
    nand #(7) N1(Q, x, Qbar);
    nand #(7) N2(Qbar, y, Q); 

endmodule

module DLatch1(input clk,D, output Q);

    wire k,x,y, Qbar;

    not #(7) NOT1(k,D);
    nand #(7) NAND1(y, k, clk);
    nand #(7) NAND2(x, D, clk);
    nand #(7) NAND3(Q, x, Qbar);
    nand #(7) NAND4(Qbar, y, Q); 

endmodule



module DLatch2(input clk,R,D, output Q);

    wire k,x,y,z,p, Qbar;

    not #(7) NOT1(p,R);
    not #(7) NOT2(k,z);
    nand #(7) NAND1(z,D,p);
    nand #(7) NAND2(y, z, clk);
    nand #(7) NAND3(x, k, clk);
    nand #(7) NAND4(Q, x, Qbar);
    nand #(7) NAND5(Qbar, y, Q); 

endmodule





module MSDFF(input clk,R,D, output Q);

    wire s,p,k,y,x,q,qbar,clkbar,z,e,Qbar;
    not #(7) NOT1(s, R);
    not #(7) NOT2(clkbar, clk);
    not #(7) NOT3(k, p);
    nand #(7) NAND0(p, D, s);
    nand #(7) NAND1(y, clk, p);
    nand #(7) NAND2(x, clk, k);
    nand #(7) NAND3(q, x, qbar);
    nand #(7) NAND4(qbar, y, q);
    nand #(7) NAND5(z, qbar, clkbar);
    nand #(7) NAND6(e, q, clkbar);
    nand #(7) NAND7(Q, e, Qbar);
    nand #(7) NAND8(Qbar, z, Q);

endmodule



