`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 03:19:29 PM
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
    input wire [7:0] address,
    output reg [15:0] instruction
    );
    
    // The bit width of the register is 16 and memory can store
    // 8-bit value or 256 instructions
    reg [15:0] memory [0:255];
    
    initial begin
        $readmemb("program.txt", memory);
    end
    always@(*)
    begin
        instruction = memory[address];
    end
endmodule