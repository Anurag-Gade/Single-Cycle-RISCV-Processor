`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2024 08:12:44 PM
// Design Name: 
// Module Name: instruction_mem
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


module instruction_mem(input clk,
                       input [31:0] address,
                       output reg [31:0] instr

    );
    
    reg [7:0] imem [255:0];
    
    initial $readmemh("memory_instructions.mem", imem);
    
    always @ (posedge clk) begin
    
        instr <= {imem[address + 3], imem[address + 2], imem[address + 1], imem[address]};
        
    end
    
endmodule
