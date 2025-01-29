`timescale 1ns/1ns

module MajTB();

    reg aa = 1,bb = 1,cc=0;
    wire ww,xx,yy;

    Maj1 m1(aa,bb,cc,ww);
    Maj2 m2(aa,bb,cc,xx);
    Maj3 m3(aa,bb,cc,yy);
    
    initial begin
        #100
        #20 bb = 0;
        #100
        #30 bb = 1;
        #50
        #38 aa = 0;
	#58 aa = 1;
        #100 bb = 1;
        repeat(3) #100 bb = ~bb;
        #100
        $stop;    
    end

endmodule



