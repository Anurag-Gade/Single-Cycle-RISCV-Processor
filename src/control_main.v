`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2024 11:47:52 AM
// Design Name: 
// Module Name: control_main
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


module control_main(input [6:0] opcode,
                    output reg [2:0] imm_select,
                    output reg Jump,
                    output reg Branch,
                    output reg MemRead,
                    output reg MemtoReg,
                    output reg [1:0] ALUop,
                    output reg MemWrite,
                    output reg ALUsrc,
                    output reg RegWrite
    );
    
    always @ (opcode) begin
        
        case(opcode)
        
            //R-type instructions
            7'b0110011: begin
                       imm_select = 3'bxxx;
                       Jump = 0;
                       Branch = 0;
                       MemRead = 0;
                       MemtoReg = 0;
                       ALUop = 2'b10;
                       MemWrite = 0;
                       ALUsrc = 0;
                       RegWrite = 1;
            end
            
            //LW
            7'b0000011: begin
                       imm_select = 3'b111;
                       Jump = 0;
                       Branch = 0;
                       MemRead = 1;
                       MemtoReg = 1;
                       ALUop = 2'b00;
                       MemWrite = 0;
                       ALUsrc = 1;
                       RegWrite = 1;
            end
                       
            //SW
            7'b0100011: begin
                       imm_select = 3'b001;
                       Jump = 0;
                       Branch = 0;
                       MemRead = 0;
                       MemtoReg = 1;
                       ALUop = 2'b00;
                       MemWrite = 0;
                       ALUsrc = 1;
                       RegWrite = 0;
            end
            
            //BEQ
            7'b1100011: begin
                       imm_select = 3'b011;
                       Jump = 0;
                       Branch = 1;
                       MemRead = 0;
                       MemtoReg = 0;
                       ALUop = 2'b01;
                       MemWrite = 0;
                       ALUsrc = 0;
                       RegWrite = 0;
            end
            
            //JAL
            /* 7'b1101111: begin
                       RegDest = 1'bx;
                       Jump = 1;
                       Branch = 1'bx;
                       MemRead = 0;
                       MemtoReg = 0;
                       ALUop = 2'bxx;
                       MemWrite = 0;
                       ALUsrc = 0;
                       RegWrite = 0;
            end */
            
            default: begin
                       imm_select = 3'bxxx;
                       Jump = 1'bx;
                       Branch = 1'bx;
                       MemRead = 1'bx;
                       MemtoReg = 1'bx;
                       ALUop = 2'bxx;
                       MemWrite = 1'bx;
                       ALUsrc = 1'bx;
                       RegWrite = 1'bx;
            end
            
        endcase
      end
      
endmodule
