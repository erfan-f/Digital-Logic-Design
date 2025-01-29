`timescale 1ns/1ns

module ROM(input clk, rst, en, input [3:0]addr,output logic [15:0]dout);

    (*rom_style = "block" *) logic [15:0] data;

    always @(posedge clk) begin
        if (rst)
            data <= 16'b0;
        else
            if(en)
                case(addr)
                    4'b0000: data <= 16'b1111111111111111;
                    4'b0001: data <= 16'b1000000000000000;
                    4'b0010: data <= 16'b0101010101010101;
                    4'b0011: data <= 16'b0100000000000000;
                    4'b0100: data <= 16'b0011001100110011;
                    4'b0101: data <= 16'b0010101010101010;
                    4'b0110: data <= 16'b0010010010010010;
                    4'b0111: data <= 16'b0010000000000000;
                    4'b1000: data <= 16'b0001110001110001;
                    4'b1001: data <= 16'b0001100110011001;
                    4'b1010: data <= 16'b0001011101000101;
                    4'b1011: data <= 16'b0001010101010101;
                    4'b1100: data <= 16'b0001001110110001;
                    4'b1101: data <= 16'b0001001001001001;
                    4'b1110: data <= 16'b0001000100010001;
                    4'b1111: data <= 16'b0001000000000000;
                endcase
    end

    assign dout = data; 

endmodule


