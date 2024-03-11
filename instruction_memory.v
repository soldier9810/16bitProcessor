`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.01.2024 19:57:34
// Design Name: 
// Module Name: memory_instruction
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


module instruction_memory(
    input [5:0] read_address,
    output [15:0] instruction_out
);
    reg [15:0] memory [0:63];
    
    initial
 begin
    memory[0] = 16'b01_00001_000_000000; // LOAD 0 IN R0
    memory[1] = 16'b11_10110_000_111111; // DISPLAY R0
    memory[2] = 16'b00_00100_000_000010; // ADD IMMEDIATE 2 IN R0
    memory[3] = 16'b11_10110_000_111111;
    memory[4] = 16'b00_00111_000_000111; // IS R0 < 7 
    memory[5] = 16'b11_10110_000_111111;
    //memory[5] = 16'b11_11000_111111111; // DISPLAY BOOLEAN
    memory[6] = 16'b10_10100_000010_001; // BRANCH TO 2
    memory[7] = 16'b11_11000_111111111;
 end
    
    assign instruction_out = memory[read_address];
    
endmodule
