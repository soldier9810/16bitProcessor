## Introduction
### Singularis is a processor with a custom instruction set architecture made by Aryan Gupta and Adweit Singh of IIT Guwahati. It has been successfully implemented on a Nexys A7 100T FPGA. It takes in 16-bit instructions that are given to the FPGA using the UART protocol. A custom assembler is made on python which converts assembly language into machine code and sends it to the FPGA. For this purpose the PySerial library was used. This allows anyone to test the processor. The incoming instructions are displayed on the 16 LED's above the switches and the output is displayed in hexadecimal on the 7-segment displays that are available on the FPGA. The HDL used for this project is Verilog and Vivado was used for simulation and testing purposes.

## Specifications
### Our processor has 8 registers therefore 3 bits are used for addressing the registers. The data memory can store 64 words therefore 6 bits are used for addressing data memory. The instruction memory can store 64 words therefore the program counter is 6 bits long. There are a total of 32 instructions.

## Format of Instructions
###A 16-bit instruction is divided into multiple parts that differ depending on what the instruction does. The first two bits and the next five are always assigned to the Type and Opcode respectively.

### Type 00: For ALU related instructions
### Type(2)Opcode(5) R0(3) R1(3) R2(3) // For R-type instructions where R0 is the destination and R1, R2 are operands
### Type(2)Opcode(5) R0(3) Constant_Value(6) // For immediate type instructions where the R0 is the destination as well as the operand.

### 00011: ADD (R0 = R1 + R2)
### 00100: ADD IMMEDIATE (R0 = R0 + Constant_Value)
### 00101: SUBTRACT (R0 = R1 - R2)
### 00110: SUBTRACT IMMEDIATE (R0 = R0 - Constant_Value)
### 01110: MULTIIPLICATION (R0 = R1 * R2)
### 01111: MULTIPLY IMMEDIATE ( R0 = R0 * Constant_Value)
### 11001: LESS THAN (bool_flag = (R1<R2)?1:0)
### 10000: GREATER THAN (bool_flag = (R1>R2)?1:0)
### 00111: LESS THAN IMMEDIATE (bool_flag = (R1<Constant_Value)?1:0)
### 10001: GREATER THAN IMMEDIATE (bool_flag = (R1>Constant_Value)?1:0)
### 10011: EQUAL TO IMMEDIATE (bool_flag = (R1==Constant_Value)?1:0)
### 10010: EQUAL TO (bool_flag = (R1==R2)?1:0)
### 01000: LEFT SHIFT (R0 = R1<<R2)
### 01001: RIGHT SHIFT (R0 = R1>>R2)
### 01010: BITWISE AND (R0 = R1 & R2)
### 01011: BITWISE OR (R0 = R1 | R2)
### 01100: BITWISE XOR (R0 = R1 ^ R2)
### 01101: NEGATION (R1 = ~R1) (Type(2) Opcode(5) Don't Care (3) R0(3) Don't Care(3))


### Type 01: For Load/Store type instructions
### 00000: LOAD (Type(2) Opcode(5) R0(3) M0(6)) This instruction copies any data in M0 to the register R0
### 00001: LOAD IMMEDIATELY (Type(2) Opcode(5) R0(3) Constant_Value(6)) This instruction copies the Constant_Value to the register R0
### 00010: STORE (Type(2) Opcode(5) R0(3) M0(6)) This instruction copies any data in R0 to the data memory M0


### Type 10: For Jump type instructions. The program counter jumps to the PCAddress according to the last three bits. For example if the last three bits are 000 then jump is unconditional but if they are 001 then jump happens only if BOOL is 1.
### Type(2) Opcode(5) PCAddress(6) 000-> UNCONDITIONAL
### 			       001-> BOOL
###                                010-> ZERO
###                                011-> CARRY
###                                100-> OVERFLOW


### Type 11: For Display Instructions
### 10101: DISPLAY ACCUMULATOR (Type(2) Opcode(5) Rest of the bits don't care) Displays the value inside accumulator
### 10110: DISPLAY REGISTER (Type(2) Opcode(5) R0(3) Rest of the bits don't care) Displays the value inside register R0
### 10111: DISPLAY DATA MEMORY (Type(2) Opcode(5) M0(6) Rest of the bits don't care) Displays the value inside data memory M0
### 11000: DISPLAY BOOL (Type(2) Opcode(5) Rest of the bits don't care) Displays the value of Bool flag.
### 11001: DISPLAY PC_CURRENT (Type(2) Opcode(5) Rest of the bits don't care) Displays the value of the program counter.
