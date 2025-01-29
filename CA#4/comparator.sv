`timescale 1ns/1ns


module CMP (input [3:0] A,B, output gt,eq);

    assign gt = (A>B) ? 1'b1 : 1'b0;
    assign eq = (A==B) ? 1'b1 : 1'b0;

endmodule


