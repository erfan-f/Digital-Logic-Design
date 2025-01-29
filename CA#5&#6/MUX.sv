
module MUX4to1(input [7:0] A,B,C,D, input [1:0] S, output logic [7:0] W);

    assign W = (S == 2'b00) ? A:
                (S == 2'b01) ? B:
                (S == 2'b10) ? C:
                (S == 2'b11) ? D:
                    8'bx;

endmodule

