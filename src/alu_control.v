//Author: Anurag Gade
//File: alu_control.v

`timescale 1ns / 1ps

module alu_control(input [1:0] ALUop,
                   input [5:0] Funct,
                   output reg [3:0] ALUcontrol

    );
    
    always @ (ALUop, Funct) begin
    
        if(ALUop == 0)
            ALUcontrol <= 4'b0010;
        else if(ALUop == 1)
        
            ALUcontrol <= 4'b0110;
        else
        
            case(Funct)
            
                6'b000000: ALUcontrol <= 4'b0011; //SLL  (Funct Code: 0, ALUcontrol: 3)
                6'b000010: ALUcontrol <= 4'b0100; //SRL  (Funct Code: 2, ALUcontrol: 4)
                6'b100000: ALUcontrol <= 4'b0010; //ADD  (Funct Code: 32, ALUcontrol: 2)
                6'b100010: ALUcontrol <= 4'b0110; //SUB  (Funct Code: 34, ALUcontrol: 6)
                6'b100100: ALUcontrol <= 4'b0000; //AND  (Funct Code: 36, ALUcontrol: 0)
                6'b100101: ALUcontrol <= 4'b0001; //OR   (Funct Code: 37, ALUcontrol: 1)
                6'b100110: ALUcontrol <= 4'b1001; //XOR  (Funct Code: 38, ALUcontrol: 9)
                6'b100111: ALUcontrol <= 4'b1100; //NOR  (Funct Code: 39, ALUcontrol: 12)
                6'b101011: ALUcontrol <= 4'b1110; //SLTU (Funct Code: 43, ALUcontrol: 14)
                
            endcase
    end
endmodule
