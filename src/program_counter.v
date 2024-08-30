//Author: Anurag Gade
//File: program_counter.v

`timescale 1ns / 1ps

module program_counter(input clk,
                       input rst,
                       input [31:0] PCin,
                       output reg [31:0] PCout

    );
    
    always @ (posedge clk) begin
        
        if(rst == 1) 
            PCout <= 0;
            
        else
            PCout <= PCin + 4;
        
    end
    
endmodule
