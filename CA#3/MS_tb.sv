`timescale 1ns/1ns

module MS_TB();

    logic clk = 0, D = 0, R = 0;
    wire Q;

    MSDFF MSD(clk, R, D, Q);

    initial begin
        #50 clk = 0;
        #20 
        #60 D = 1;
        #50 clk = 1;
        repeat(5) #100 clk = ~clk;
        #47 D = 0;
        #25
        repeat(5) #100 clk = ~clk;
        #42 
        repeat(3) #96 D = ~D;
        #40 D = 1;
        #20 clk = 0;
        #50 R = 1;
        #30 clk = 1; #30 clk = 0;
        #25 R = 0;
        #100 $stop;

    end

endmodule

