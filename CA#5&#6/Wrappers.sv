
module InpWrp(input clk, reset, StartData, Ready, input logic ReadyForInput,
                     input [7:0] BusData, output logic ReadyToAccept, Start, DvdReset, 
                     output logic [15:0] Dividend, Divisor);

    logic rst, countEn, dcdEn, co, coIW;
    logic [1:0] count, DcdData;
    logic [3:0] DcdOut;
    logic [7:0] DividerRegPO1, DividerRegPO2, DivisorRegPO1, DivisorRegPO2;  

    Counter2 InpCounter(clk, rst, countEn, count, co);
    Dcd2to4 dcd(dcdEn, DcdData, DcdOut);
    Reg8Bit reg1(clk, rst, DcdOut[0], BusData, DividerRegPO2);
    Reg8Bit reg2(clk, rst, DcdOut[1], BusData, DividerRegPO1);
    Reg8Bit reg3(clk, rst, DcdOut[2], BusData, DivisorRegPO2);
    Reg8Bit reg4(clk, rst, DcdOut[3], BusData, DivisorRegPO1);
    
    assign Dividend =  {DividerRegPO2,DividerRegPO1};
    assign Divisor =  {DivisorRegPO2,DivisorRegPO1};

    assign coIW = &{count};

    logic [3:0] ps,ns;
    parameter Idle = 4'b0000,
                ReceiveInput = 4'b0001,
                WaitForNext = 4'b0010,
                Accept = 4'b0011,
                Waiting = 4'b0100,
                ResetDvd = 4'b0101,
                RunDivider = 4'b0110,
                RunDvd = 4'b0111,
                Cal = 4'b1000;

    always @(ps, StartData, ReadyForInput, Ready) begin
        Start = 0; ReadyToAccept = 0; dcdEn = 0; countEn = 0; rst = 0; DvdReset = 0; 
        case(ps)
            Idle: begin ReadyToAccept = 1; rst = 1; ns = (StartData) ? ReceiveInput: Idle; end
            ReceiveInput: begin dcdEn = 1; DcdData = count; ns = (StartData) ? ReceiveInput: WaitForNext; end
            WaitForNext: begin  countEn = StartData ? 1: 0; ns = (StartData && ~coIW) ? ReceiveInput: (StartData && coIW) ? Accept: WaitForNext; end
            Accept: begin ns = (StartData) ? Accept: Waiting; end
            Waiting: begin ns = (ReadyForInput) ? ResetDvd: Waiting;end
            ResetDvd: begin  DvdReset = 1; ns = RunDvd; end
            RunDvd: begin Start = 1; ns = (Ready) ? RunDvd : Cal; end
            Cal: begin  ns = (Ready) ? Idle : Cal; end
        endcase

    end

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            ps <= Idle;
        end 
        else
            ps <= ns;
    end
endmodule



module OutWrapper(input clk, reset, Ready, ReceiveData, input [15:0] Quotient, Remainder,
                     output logic OutBuffFull, ReadyForInput, output logic [7:0] BusDataOut);

    logic rst, ld, countEn, co, coOW;

    logic [1:0] DataSel, count;
    logic [31:0] regOutput;
    logic [7:0] muxOut;

    //***********
    // just for test (Proccessor is not support in this project to take the data from buffer)
    assign BusDataOut = muxOut;
    //***********


    Reg32Bit reg32(clk, rst, ld, {Quotient,Remainder}, regOutput);
    MUX4to1 mux(regOutput[31:24], regOutput[23:16], regOutput[15:8], regOutput[7:0], DataSel, muxOut);
    Counter2 counter(clk, rst, countEn, count, co);

    assign coOW = &{count};

    logic [1:0] ps,ns;

    parameter ReadyForSend = 2'b00,
                Load = 2'b01,
                WaitForReceive = 2'b10,
                MakeSureReceive = 2'b11;

    always @(ps, ReceiveData, Ready) begin
        rst = 0; ld = 0; countEn = 0; ReadyForInput = 0; OutBuffFull = 0;
        case(ps)
        ReadyForSend: begin ReadyForInput = 1; rst = 1; ns = (Ready) ? Load: ReadyForSend; end
        Load: begin ld=1 ; ns = WaitForReceive; end
        WaitForReceive: begin OutBuffFull=1; DataSel=count; ns = (ReceiveData && Ready) ? MakeSureReceive : (~ReceiveData && Ready) ?  WaitForReceive : ReadyForSend; end
        MakeSureReceive: begin countEn = (~ReceiveData) ? 1:0; ns = (~ReceiveData && coOW) ? ReadyForSend: (~ReceiveData && ~coOW) ? WaitForReceive: MakeSureReceive ; end
        endcase
    end

    always @(posedge clk, posedge reset) begin
        if(reset)
            ps <= ReadyForSend;
        else
            ps <= ns;
    end

endmodule

