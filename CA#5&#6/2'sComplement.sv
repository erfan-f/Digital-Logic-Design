module _2sComplement(input [15:0] A, output [15:0] W);

    assign W = ~{A} + 1;

endmodule