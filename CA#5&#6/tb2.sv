`timescale 1ns/1ns

module CA6_TB();
    logic clk = 0, rstIw = 0, rstOw = 0, StartData = 0, ReceiveData = 0, OutBuffFull,ReadyToAccept;
    logic [7:0] Input_Data, Output_Data; 

    AccDvd accelerator(clk, rstIw, rstOw, StartData, ReceiveData, Input_Data,
                OutBuffFull, ReadyToAccept, Output_Data);

    always #2 clk = ~clk;

    initial begin
        #20 rstIw=1; #10 rstIw=0;
        #5 Input_Data = 8'd0;
        #20 StartData = 1 ; #10 StartData = 0;
        #5 Input_Data = 8'd99;
        #20 StartData = 1 ; #10 StartData = 0;
        #5 Input_Data = 8'd0;
        #20 StartData = 1 ; #10 StartData = 0;
        #8 Input_Data = 8'd10;
        #20 StartData = 1 ; #10 StartData = 0;
        #40 StartData = 1 ; #10 StartData = 0;
        #20 rstOw=1; #10 rstOw=0;
        #150
        #50 ReceiveData = 1; #10 ReceiveData = 0; 
        #20 ReceiveData = 1; #10 ReceiveData = 0; 
        #20 ReceiveData = 1; #10 ReceiveData = 0; 
        #20 ReceiveData = 1; #10 ReceiveData = 0; 
        #30 $stop;
    end

    
endmodule


