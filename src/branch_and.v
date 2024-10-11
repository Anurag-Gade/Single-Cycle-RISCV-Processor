`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2024 06:19:39 PM
// Design Name: 
// Module Name: branch_and
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


module branch_and(input branch,
                 input zero,
                 output reg outBranch

    );
    
    always @ (*) begin
        
        outBranch <= branch && zero;
        
    end 
    
endmodule
