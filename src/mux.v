`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2024 03:33:56 PM
// Design Name: 
// Module Name: mux
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


module mux(input [31:0] a,
           input [31:0] b,
           input sel,
           output reg [31:0] mux_out
    );
    
    always @ (sel) begin
    
        case(sel) 
            0: mux_out <= a;
            1: mux_out <= b;
        endcase
        
    end
endmodule
