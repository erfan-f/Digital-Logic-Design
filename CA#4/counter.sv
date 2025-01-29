`timescale 1ns/1ns

module Counter(input clk,rst,en, output logic [3:0] C);

    always @(posedge clk, posedge rst) begin
        if(rst)
            C <= 0;
        else
            C <= (en) ? C + 1 : C;
    end

endmodule


