`timescale 1ns/1ns

module AccDvd(input clk, RstIW, RstOW, StartData, ReceiveData, input [7:0] BusDataIn,
                 output OutBuffFull, ReadyToAccept, output [7:0] BusDataOut);

    logic Start, Error, RstDivider, ReadyForInput;
    logic [15:0] Dividend, Divisor;
    logic [15:0] Q,R; 

    InpWrp inpwrp(clk, RstIW, StartData, Ready, ReadyForInput, BusDataIn,
                    ReadyToAccept, Start, RstDivider, Dividend, Divisor);

    Divider dvd(clk, RstDivider, Start, Ready, Error, Dividend, Divisor, Q, R);

    OutWrapper outwrp(clk, RstOW, Ready, ReceiveData, Q, R,
                        OutBuffFull, ReadyForInput, BusDataOut);

endmodule



