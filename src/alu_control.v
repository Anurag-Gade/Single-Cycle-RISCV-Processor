`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2024 06:44:02 PM
// Design Name: 
// Module Name: alu_control
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


module alu_control(input [1:0] ALUop,
                   input [14:12] Funct3,
                   input [31:25] Funct7,
                   output reg [3:0] ALUcontrol

    );
    
    
    always @ (ALUop, Funct7, Funct3) begin
    
        if(ALUop == 0) //LW and SW requires the ADD operation.
            ALUcontrol <= 4'b0010;
        else if(ALUop == 1) //BEQ is required to perform subtraction.
        
            ALUcontrol <= 4'b0110;
        else
        
            case({Funct7, Funct3})
            
                10'b0000000_001: ALUcontrol <= 4'b0011; //SLL  (Funct Code: 0, ALUcontrol: 3)
                10'b0000000_101: ALUcontrol <= 4'b0100; //SRL  (Funct Code: 2, ALUcontrol: 4)
                10'b0000000_000: ALUcontrol <= 4'b0010; //ADD  (Funct Code: 32, ALUcontrol: 2)
                10'b0100000_000: ALUcontrol <= 4'b0110; //SUB  (Funct Code: 34, ALUcontrol: 6)
                10'b0000000_111: ALUcontrol <= 4'b0000; //AND  (Funct Code: 36, ALUcontrol: 0)
                10'b0000000_110: ALUcontrol <= 4'b0001; //OR   (Funct Code: 37, ALUcontrol: 1)
                10'b0000000_100: ALUcontrol <= 4'b1001; //XOR  (Funct Code: 38, ALUcontrol: 9)
                // 10'b100111: ALUcontrol <= 4'b1100; //NOR  (Funct Code: 39, ALUcontrol: 12)
                // 10'b101011: ALUcontrol <= 4'b1110; //SLTU (Funct Code: 43, ALUcontrol: 14)
                
            endcase
    end
endmodule
