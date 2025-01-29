`timescale 1ns/1ns
module notTB();
    reg aa = 0;
    wire ww;

    notGate notG(aa,ww);
    
    initial begin
        #50 aa = 1;
        #76
        #20 aa = 0;
        #50
	$stop;
    end

endmodule