`timescale 1ns/1ns
module AdderReg(input clk,rst,en, input [18:0] PI, output logic [18:0] PO);

    always @(posedge clk, posedge rst) begin
        if(rst)
            PO <= 0;
        else
           PO <= (en) ? PI : PO;
    end

endmodule


module CmpReg(input clk,rst,en, input [3:0] PI, output logic [3:0] PO);

    always @(posedge clk, posedge rst) begin
        if(rst)
            PO <= 0;
        else
           PO <= (en) ? PI : PO;
    end

endmodule


