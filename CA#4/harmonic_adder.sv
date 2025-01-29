`timescale 1ns/1ns

module HA(input clk,reset, start, input [3:0] n, output logic [18:0] sum);
    logic en, rst, ready; 
    logic [1:0] pState, nState;
    logic [3:0] count, nRead;
    wire [18:0] Interval;
    logic [15:0] S = 0;
    wire gt,eq,cout;
    wire [2:0] Z = 3'b0;

    Counter cou(clk, rst, en, count);
    CmpReg cmpRegister(clk, rst, en, n, nRead);
    CMP cmp(n, count, gt, eq);
    ROM rom(clk, rst, en, count, S);
    Adder Add(en, 0, sum, {Z,S}, Interval);
    AdderReg adderRegister(clk, rst, en, Interval, sum);

    parameter [1:0] A=2'b00, B=2'b01, C=2'b10;
    always @(pState, start, gt) begin
    ready=0;
    en=0;
    rst=0;
    case(pState)
        A: begin ready=1; rst=0; en=0; nState = start ? B : A; end
        B: begin ready=0; rst=1; en=0; nState = start ? B : C; end
        C: begin ready=0; rst=0; en=1; nState = gt ? C : A; end
    endcase
    end

    always @(posedge clk, posedge reset) begin
        if(reset)
            pState <= A;
        else    
            pState <= nState;
    end

endmodule