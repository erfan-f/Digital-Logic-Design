`timescale 1ns/1ns

module nandTB();
    reg aa = 1, bb= 1;
    wire ww, zz;

    twoInputNandGate nandG(aa,bb,ww);
    primitiveNand  PrimitiveNandG(aa,bb,zz);

    initial begin
        #50 bb = 0;
        #100
        #67 bb = 1;
        #56
        #50 aa = 0;
        #100 aa = 1;
        #98 bb = 0;
        #65
        $stop;
    end

endmodule