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
    memory[0] = 16'b01_00001_001_000001; // LOAD 1 IN R1
    memory[1] = 16'b11_10110_001_111111; // DISPLAY R1
    memory[2] = 16'b01_00001_000_000101; // LOAD 5 IN R0
    memory[3] = 16'b00_01110_001_000_001; // R1 = R0 * R1
    memory[4] = 16'b00_00110_000_000001; // SUB IMM R0 BY 1
    memory[5] = 16'b00_10001_000_000001;
    memory[6] = 16'b11_10110_001_111111; // DISPLAY R1
    memory[7] = 16'b10_10100_000011_001; // JUMP TO 3
    memory[8] = 16'b11_10110_001_111111; // DISPLAY R1
 end
    
    assign instruction_out = memory[read_address];
    
endmodule
