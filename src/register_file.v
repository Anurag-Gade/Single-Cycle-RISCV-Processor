//Author: Anurag Gade
//File: register_file.v

`timescale 1ns / 1ps

module register_file(input clk,
                     input regWrite,
                     input [4:0] readReg1,
                     input [4:0] readReg2,
                     input [4:0] writeReg,
                     input [31:0] writeData,
                     output [31:0] readData1,
                     output [31:0] readData2

    );
    
    integer i;
    reg [31:0] memory [31:0]; //32 bit registers 
    
    assign readData1 = (readReg1 != 0) ? memory[readReg1] : 0;
    assign readData1 = (readReg2 != 0) ? memory[readReg2] : 0;
    
    always @ (posedge clk) begin
        if(regWrite == 1'b1) 
            
            memory[writeReg] <= writeData;
            
    end
        
endmodule
