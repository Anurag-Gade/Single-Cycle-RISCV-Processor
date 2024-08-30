//Author: Anurag Gade
//File: data_mem.v

`timescale 1ns / 1ps

module data_mem(input clk,
                input write_enable, 
                input read_enable,
                input [31:0] address,
                input [31:0] data_in,
                output reg [31:0] data_out
    );
    
    reg [31:0] dmem [255:0];
    
    always @ (posedge clk) begin
        
        if(write_enable == 1) 
            dmem[address] <= data_in; 
            
    end
            
    always @ (negedge clk) begin 
        
        if(read_enable == 1) 
            data_out <= dmem[address];
            
    end
        
endmodule
