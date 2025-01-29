`timescale 1ns/1ns
`include "Adder.sv"

module oneBitAdderTB();

    logic AA = 1'b1, BB = 1'b1, cin = 1'b0;
    wire cout, SS;

    _1BitAdder OBA(AA, BB, cin, SS, cout);

    initial begin
        #90 AA = 0;
        #67
        #56 AA = 1;
        #100
        repeat(3) #200 BB = ~BB;
        #76
        #26 AA = 0;
        #100 $stop;
    end

endmodule


module TwoBitAdderTB();

    logic [1:0] AA = 2'b00;
    logic [1:0] BB= 2'b11;
    logic cin = 0;
    wire [1:0]SS;
    wire cout;

    _2BitAdder TwoBA(AA,BB,cin,SS,cout);

    initial begin
        #100 AA[0] = 1;
	    #150 
        #34 AA[0] = 0;
        #168
        repeat(4) #250 BB[1] = ~BB[0];
        #56 $stop;
    end

endmodule

module ThreeBitAdderTB();

    logic [2:0] AA = 3'b000;
    logic [2:0] BB = 3'b111;
    logic cin = 0;
    wire [2:0] SS;
    wire cout;

    _3BitAdder ThreeBA(AA,BB,cin,SS,cout);

    initial begin
        #100 AA[0] = 1;
        #180
        #56 AA[0] = 0;
        #200
        $stop; 
    end

endmodule


module FourBitAdderTB();

    logic [3:0] AA = 4'b0011;
    logic [3:0] BB = 4'b1100;
    logic cin = 0;
    wire [3:0] SS;
    wire cout;

    _4BitAdder ThreeBA(AA,BB,cin,SS,cout);

    initial begin
        #200 BB[0] = 1;
        #196
        #59 BB[0] = 0;
        #267
        $stop; 
    end

endmodule

module FiveBitAdderTB();

    logic [4:0] AA = 5'b00110;
    logic [4:0] BB = 5'b11001;
    logic cin = 0;
    wire [4:0] SS;
    wire cout;

    _5BitAdder ThreeBA(AA,BB,cin,SS,cout);

    initial begin
        #268 AA[0] = 1;
        #386
        #87 AA[0] = 0;
        #324
        $stop; 
    end

endmodule


