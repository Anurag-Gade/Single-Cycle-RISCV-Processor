`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2024 02:07:26 PM
// Design Name: 
// Module Name: register_file
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


module register_file(input clk,
                     input reset,
                     input RegWrite,
                     input [19:15] readReg1,
                     input [24:20] readReg2,
                     input [11:7] writeReg,
                     input [31:0] writeData,
                     output [31:0] readData1,
                     output [31:0] readData2

    );
    
    integer i;
    reg [31:0] reg_memory [31:0]; //32 bit registers 
    
    initial $readmemh("register_file.mem", reg_memory);
     
    assign readData1 = (readReg1 != 0) ? reg_memory[readReg1] : 0;
    assign readData1 = (readReg2 != 0) ? reg_memory[readReg2] : 0;
    
  always @ (posedge clk, posedge reset) begin
    if(reset) begin
      for(i = 0; i < 32; i = i + 1) begin
        reg_memory[i] = i;
      end
    end
    else if(RegWrite == 1) begin
            
           reg_memory[writeReg] <= writeData;

    end
            
  end
        
endmodule
