`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2024 12:33:24 AM
// Design Name: 
// Module Name: data_mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module data_mem(input clk,
                input reset,
                input write_enable, 
                input read_enable,
                input [31:0] address,
                input [31:0] data_in,
                output reg [31:0] data_out
    );
    
    reg [7:0] dmem [255:0];
    
    initial $readmemh("data_memory.mem", dmem);
    integer i;
    
    always @ (posedge clk) begin
        
        if(reset) begin
            for (i = 0; i < 256; i = i + 1) begin
                dmem[i] = 8'b00000000;
            end
        end
        
        if(write_enable == 1) begin
            dmem[address] <= data_in[7:0]; 
            dmem[address + 1] <= data_in[15:8];
            dmem[address + 2] <= data_in[23:16];
            dmem[address + 3] <= data_in[31:24];
        end
    end
            
    always @ (negedge clk) begin 
        
        if(read_enable == 1) begin
            data_out <= {dmem[address + 3], dmem[address + 2], dmem[address + 1], dmem[address]};
        end
    end
        
endmodule
