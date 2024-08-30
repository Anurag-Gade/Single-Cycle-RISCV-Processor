//Author: Anurag Gade
//File: mux_2.v

`timescale 1ns / 1ps

module mux_2(input [31:0] ReadData2,
             input [31:0] SignExtend,
             input ALUSrc,
             output reg [31:0] ALUinput2

    );
    
    always @ (ALUSrc) begin
    
        case(ALUSrc) 
            0: ALUinput2 <= ReadData2;
            1: ALUinput2 <= SignExtend;
        endcase
        
    end
    
endmodule
