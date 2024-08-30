//Author: Anurag Gade
//File: sign_extend.v

`timescale 1ns / 1ps

module sign_extend(input [15:0] instb15_0,
                   output reg [31:0] SignExtend

    );
    
    always @ (*) begin
        
        SignExtend[31:0] <= instb15_0[15:0];
        
    end
    
endmodule
