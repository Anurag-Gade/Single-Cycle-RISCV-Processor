`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2024 03:18:10 PM
// Design Name: 
// Module Name: immediate_generator
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


module immediate_generator(input [31:0] Instr,
                           input [2:0] imm_select,
                           output reg [31:0] gen_output

    );
    
    always @ (imm_select, Instr) begin
    
        case(imm_select)
            
            // S-type
            3'b001: gen_output = {{21{Instr[31]}}, Instr[30:25], Instr[4:0]};
            
            // B-type (Left shift once is already done in the immediate calculation below)
            3'b011: gen_output = {{21{Instr[31]}}, Instr[29:25], Instr[11:8], Instr[30], 1'b0};
            
            // I-type (Load instruction)
            3'b111: gen_output = {{21{Instr[31]}}, Instr[30:20]};
            
            default: gen_output = 0;
            
        endcase 
        
    end
    
endmodule
