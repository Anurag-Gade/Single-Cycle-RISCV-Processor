//Author: Anurag Gade
//File: instruction_mem.v

`timescale 1ns / 1ps

module instruction_mem(input clk,
                       input [31:0] address,
                       output reg [31:0] instr

    );
    
    reg [31:0] imem [255:0];
    
    initial $readmemh("memory_instructions.dat", imem);
    
    always @ (posedge clk) begin
    
        instr <= imem[address];
        
    end
    
endmodule
