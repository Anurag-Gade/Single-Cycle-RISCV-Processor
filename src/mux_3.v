//Author: Anurag Gade
//File: mux_3.v

`timescale 1ns / 1ps

module mux_3(input [31:0] ReadData,
             input [31:0] ALUresult,
             input MemtoReg,
             output reg [31:0] WriteData

    );
    
    always @ (MemtoReg) begin
        case(MemtoReg)
            
            0: WriteData <= ALUresult;
            1: WriteData <= ReadData;
            
        endcase
    end
        
endmodule
