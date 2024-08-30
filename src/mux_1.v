//Author: Anurag Gade
//File: mux_1.v

`timescale 1ns / 1ps

module mux_1(input [20:16] instb20_16,
             input [15:11] instb15_11,
             input RegDest,
             output reg [4:0] WriteReg

    );
    
    always @ (RegDest) begin
    
        case(RegDest) 
            0: WriteReg <= instb20_16;
            1: WriteReg <= instb15_11;
        endcase
        
    end
    
endmodule
