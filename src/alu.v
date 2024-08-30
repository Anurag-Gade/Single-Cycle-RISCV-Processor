//Author: Anurag Gade
//File: alu.v

`timescale 1ns / 1ps

module alu(input [31:0] a,
           input [31:0] b,
           input [3:0] ALUcontrol,
           input [4:0] shamt,
           output reg [31:0] ALUout,
           output zero

    );
    
    always @ (a, b, ALUcontrol, shamt) begin
        case(ALUcontrol)
            
            4'b0001: ALUout = a | b;            //OR
            4'b0000: ALUout = a & b;            //AND
            4'b0010: ALUout = a + b;            //ADD
            4'b0110: ALUout = a - b;            //SUB
            4'b1001: ALUout = a ^ b;            //XOR
            4'b1100: ALUout = ~(a | b);         //NOR
            4'b0011: ALUout = b << shamt;       //SLL
            4'b0100: ALUout = b >> shamt;       //SRL
 //           4'b0100: ALUout = b << a;           //SLLV
 //           4'b0110: ALUout = b >> a;           //SRLV
            4'b1110: ALUout = a < b ? 1 : 0;    //SLTU
            default: ALUout <= 0;
            
        endcase
    end
    
    assign zero = (ALUout == 0);
    
endmodule
