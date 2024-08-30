//Author: Anurag Gade
//File: branch_and.v

`timescale 1ns / 1ps

module branch_and(input branch,
                 input zero,
                 output reg outBranch

    );
    
    always @ (*) begin
        
        outBranch <= branch && zero;
        
    end 
    
endmodule
