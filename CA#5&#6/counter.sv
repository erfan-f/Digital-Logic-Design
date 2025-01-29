`timescale 1ns/1ns

module Counter(input clk,rst,ld,en, input [3:0] PI, output logic [3:0] C, output logic cout);

    always @(posedge clk, posedge rst) begin
        if(rst)
            C <= 0;
        else if(ld)
            C <= PI;
        else
            {cout,C} <= (en) ? C + 1 : C;
    end

endmodule


module Counter2(input clk,rst,en, output logic [1:0] C, output logic cout);

    always @(posedge clk, posedge rst) begin
        if(rst)
            C <= 0;
        else
            {cout,C} <= (en) ? C + 1 : C;
    end

endmodule