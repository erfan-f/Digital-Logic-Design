`timescale 1ns/1ns

module Reg8Bit(input clk,rst, ld, input [7:0] PI, output logic [7:0] PO);

    always @(posedge clk, posedge rst) begin
        if(rst)
            PO <= 0;
        else
           PO <= (ld) ? PI: PO;
    end

endmodule


module Reg32Bit(input clk,rst, ld, input [31:0] PI, output logic [31:0] PO);

    always @(posedge clk, posedge rst) begin
        if(rst)
            PO <= 0;
        else
           PO <= (ld) ? PI: PO;
    end

endmodule

module Reg16Bit(input clk,rst, ld, input [15:0] PI, output logic [15:0] PO);

    always @(posedge clk, posedge rst) begin
        if(rst)
            PO <= 0;
        else
           PO <= (ld) ? PI: PO;
    end

endmodule

module _16ShiftReg(input clk,rst,Iz,ld,shen,sin, input [15:0] PI, output logic [15:0] PO, output sout);

    always @(posedge clk, posedge rst) begin
        if(rst)
            PO <= 16'b0;
        else if(Iz)
            PO <= 16'b0;
        else if(ld)
            PO <= PI;
        else 
            PO <= (shen) ? {PO[14:0],sin} : PO;
    end

    assign sout = PO[15];

endmodule