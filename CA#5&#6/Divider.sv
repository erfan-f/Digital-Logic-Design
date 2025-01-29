`timescale 1ns/1ns

// restroing algorithem

module Divider(input clk,reset, start, output logic ready,error, input [15:0] N,M, output logic[15:0] Q,R);

    logic rst, Rshld, Qshld, regld, Iz, cout, cen, shen, IzR, IzQ, cld;
    wire [15:0] AddPart;
    logic [15:0] NegM, RshO, QshO;
    wire [15:0] NegM_Interval, Sum;
    logic [3:0] Count;
    wire [3:0] PI_counter = 4'b0001;
    wire Acin = 0;
    wire Qsout, Qsin, Rsout, Acout, SignBit;

    assign error = ~|{M};
    assign Q = QshO;
    assign R = RshO;
    assign SignBit = Sum[15];
    assign AddPart = {RshO[14:0],QshO[15]}; 
    assign Qsin = (SignBit) ? 0: 1;
    
    _2sComplement twosComp(M, NegM_Interval);
    Reg16Bit divisorReg(clk, rst, regld, NegM_Interval, NegM);

    Adder adder(Acin, AddPart, NegM, Acout, Sum);

    _16ShiftReg Qshifter(clk, rst, IzQ, Qshld, shen, Qsin, N, QshO, Qsout);
    _16ShiftReg Rshifter(clk, rst, IzR, Rshld, shen, Qsout, Sum, RshO, Rsout);

    Counter cou(clk, rst, cld, cen, PI_counter, Count, cout);

    logic [2:0] ps, ns;
    parameter  idle = 3'b000,
                starting = 3'b001,
                loading = 3'b010,
                synchStep = 3'b011,
                dividing = 3'b100;

    always @(ps,error, start, cout, Sum[15]) begin
        ready = 0; regld = 0; Rshld=0; Qshld=0; cen = 0;shen=0 ; rst=0; IzR=0; IzQ=0; cld=0;
        case(ps)
            idle: begin ready=1; ns = start & (~error) ? starting: idle; end
            starting: begin rst=1; ns = start ? starting: loading; end
            loading: begin  regld=1; IzR=1; cld=1; Qshld=1; ns = synchStep; end
            synchStep: begin  ns = dividing; end
            dividing: begin  Rshld = ~SignBit ; shen=1; cen=1; ns = (cout) ? idle: dividing; end
        endcase
    end
  
    always @(posedge clk, posedge reset) begin
        if(reset)
            ps <= idle;
        else
            ps <= ns;
    end

endmodule