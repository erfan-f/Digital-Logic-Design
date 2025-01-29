
module Dcd2to4(input en, input [1:0] A, output [3:0] I);

    assign I = ~en ? 4'b0000 :
            (A == 0) ? 4'b0001:
            (A == 1) ? 4'b0010:
            (A == 2) ? 4'b0100:
            (A == 3) ? 4'b1000:
            4'bx;

endmodule