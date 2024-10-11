`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2024 03:26:47 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(input clk,
                       input rst,
                       input [31:0] PCin,
                       output reg [31:0] PCout

    );
    
    always @ (posedge clk) begin
        
        if(rst == 1) 
            PCout <= 0;
            
        else
            PCout <= PCin;
        
    end
    
endmodule
