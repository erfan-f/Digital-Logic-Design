`timescale 1ns/1ns

module oneCouTB();

reg aa=0, bb=0, cc=0;
wire ww,zz;

oneCounter ONECOUN(aa,bb,cc,ww,zz);

initial begin
    #50
    #57 cc = 1;
    #100 
    #26 aa = 1;
    #120
    #50 cc = 1;
    #87
    repeat(7) #100 cc = ~cc;
    #100
    $stop; 
end

endmodule


