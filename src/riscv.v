`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 04:05:02 PM
// Design Name: 
// Module Name: riscv
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


module riscv(input clk,
             input reset

    );
    
    //DATA CONNECTIONS 
    
    //Instruction memory
    wire [31:0] PCout;
    wire [31:0] Instr;
    
    //Register file
    wire [19:15] readReg1;
    wire [24:20] readReg2;
    wire [11:7] writeReg;
    wire [31:0] readData1;
    wire [31:0] readData2;
    wire [31:0] writeData;
    
    //Immediate Generator
    wire [31:0] gen_output;
    
    //Multiplexer 1
    wire [31:0] mux1_output;
    
    //ALU 
    wire [31:0] ALUout;
    
    //Data memory
    wire [31:0] data_out;
    
    //Address computation
    wire [31:0] PCplusfour;
    wire [31:0] branch_address;
    
    //Multiplexer 3
    wire [31:0] PCin;
    
    //CONTROL CONNECTIONS
    
    //Control unit
    wire [6:0] opcode;
    wire [2:0] imm_select;
    wire Jump;
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire [1:0] ALUop;
    wire MemWrite;
    wire ALUsrc;
    wire RegWrite;
    
    //ALU control
    wire [3:0] ALUcontrol;
    
    //Branching 
    wire zero;
    wire outBranch;
    
    program_counter pc(.clk(clk), .rst(reset), .PCin(PCin), .PCout(PCout));
    instruction_mem im(.clk(clk), .address(PCout), .instr(Instr));
    adder add1(.A(PCout), .B(3'b100), .Sum(PCplusfour));
    
    
    control_main control(.opcode(opcode), .imm_select(imm_select), .Jump(Jump), 
                         .Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg),
                         .ALUop(ALUop), .MemWrite(MemWrite), .ALUsrc(ALUsrc),
                         .RegWrite(RegWrite));
    register_file registers(.clk(clk), .reset(reset), .RegWrite(RegWrite), 
                            .readReg1(readReg1), .readReg2(readReg2), .writeReg(writeReg),
                            .writeData(writeData), .readData1(readData1), .readData2(readData2));                     
    immediate_generator imm_gen(.Instr(Instr), .imm_select(imm_select), .gen_output(gen_output)); 
    
    
    mux mux1(.a(readData2), .b(gen_output), .sel(ALUsrc), .mux_out(mux1_output));
    alu_control alu_ctl(.ALUop(ALUop), .Funct3(Instr[14:12]), .Funct7(Instr[31:25]), .ALUcontrol(ALUcontrol));
    alu alu1(.a(readData1), .b(mux1_output), .ALUcontrol(ALUcontrol), .ALUout(ALUout), .zero(zero));
    adder add2(.A(PCout), .B(gen_output), .Sum(branch_address));
    branch_and b_and(.branch(Branch), .zero(zero), .outBranch(outBranch));
    mux mux2(.a(PCplusfour), .b(branch_address), .sel(outBranch), .mux_out(PCin));
    
    data_mem dm(.clk(clk), .reset(reset), .write_enable(MemWrite), .read_enable(MemRead), 
             .address(ALUout), .data_in(readData2), .data_out(data_out));
    mux mux3(.a(ALUout), .b(data_out), .sel(MemtoReg), .mux_out(writeData));
    
    
endmodule
