//Author: Anurag Gade
//File: control_main.v

`timescale 1ns / 1ps

module control_main(input [5:0] opcode,
                    output reg RegDest,
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
            6'b000000: begin
                       RegDest = 1;
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
            6'b100011: begin
                       RegDest = 0;
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
            6'b000100: begin
                       RegDest = 0;
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
            6'b000010: begin
                       RegDest = 0;
                       Jump = 0;
                       Branch = 1;
                       MemRead = 0;
                       MemtoReg = 0;
                       ALUop = 2'b01;
                       MemWrite = 0;
                       ALUsrc = 0;
                       RegWrite = 0;
            end
            
            //JMP
            6'b000010: begin
                       RegDest = 1'bx;
                       Jump = 1;
                       Branch = 1'bx;
                       MemRead = 0;
                       MemtoReg = 0;
                       ALUop = 2'bxx;
                       MemWrite = 0;
                       ALUsrc = 0;
                       RegWrite = 0;
            end
            
            default: begin
                       RegDest = 1'bx;
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
