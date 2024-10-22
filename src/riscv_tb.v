`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2024 12:51:05 PM
// Design Name: 
// Module Name: riscv_tb
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


module riscv_tb;

reg clk;
reg reset;

riscv uut(.clk(clk), .reset(reset));

always #20 clk = ~clk;

initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0, uut);
end

initial begin
       clk = 0; reset = 1;
       @(negedge clk) reset = 0;
       #1000
       $finish;
   end



endmodule
