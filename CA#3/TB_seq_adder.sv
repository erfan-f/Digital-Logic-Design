`timescale 1ns/1ns
`include "seqAdder.sv"

module seqAdder_TB();

    logic clk = 0,reset = 0;  
    logic [7:0] A = 8'b00010111;
    wire [7:0] P;
    
    SequenceAdder SA(clk,reset, A, P);

    initial begin
        #25 clk = 1;
        #50 reset = 1;
        #600 reset = 0; clk = 0;
        #100 A = 8'b00000001;
        #300
        #350 clk = 1;
        #350 clk = 0;
        #50  clk = 1;
        #100 A = 8'b01111111;
        #600 clk = 0; 
        #300 $stop;
    end

endmodule

module seqAdder_MSDFF_TB();

    logic clk = 0, reset = 0;
    logic [7:0] A = 8'b00000001;
    wire [7:0] P;
    
    SequenceAdder_MSDFF SA(clk, reset, A, P);

    initial begin
        #20 reset = 1; #35 clk = 1; #30 clk = 0; #60 reset = 0;
        #300
        #30 clk = 1; #30 clk = 0;
        #75 reset = 1; #100 clk = 1; #30 clk = 0;#60 reset = 0;
        #375 A = 8'b00000011;
        #30 clk = 1; #30 clk = 0;
        #75 reset = 1; #100 clk = 1; #30 clk = 0;#60 reset = 0;
        #360 A = 8'b00001000;
        #30 clk = 1; #30 clk = 0;
        #75 reset = 1; #100 clk = 1; #30 clk = 0;#60 reset = 0;
        #375 A = 8'b00000101;
        #30 clk = 1; #30 clk = 0;
        #75 reset = 1; #100 clk = 1; #30 clk = 0;#60 reset = 0;
        #380 A = 8'b00010100;
        #30 clk = 1; #30 clk = 0;
        #100 $stop;
    end

endmodule





module MS_VS_LATCH_TB();

    logic clk = 0, reset = 0;
    logic [7:0] A = 8'b00000001;
    wire [7:0] P1,P2;

    SequenceAdder SA1(clk,reset, A, P1);
    SequenceAdder_MSDFF SA2(clk, reset, A, P2);

    initial begin
        #20 reset = 1; #35 clk = 1; #30 clk = 0; #60 reset = 0;
        #400
        #100 clk = 1; #375 clk = 0;
        #400 A = 8'b00000011;
        #75 clk = 1; #375 clk = 0;
        #75 reset = 1; #100 clk = 1; #30 clk = 0;#60 reset = 0;
        #400 A = 8'b00001000;
        #75 clk = 1; #375 clk = 0;
        #100 A = 8'b00000101;
        #75 clk = 1; #375 clk = 0;
        #75 reset = 1; #100 clk = 1; #30 clk = 0;#60 reset = 0;
        #400 A = 8'b00010100;
        #75 clk = 1; #375 clk = 0;
        #100 $stop;
    end


endmodule

