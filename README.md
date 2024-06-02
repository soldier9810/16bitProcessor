###### OPCODES

### 00011: ADD 
### 00100: ADD IMMEDIATE
### 00101: SUBTRACT
### 00110: SUBTRACT IMMEDIATE
### 01110: MULTIIPLICATION
### 01111: MULTIPLY IMMEDIATE
### 11001: LESS THAN
### 10000: GREATER THAN
### 00111: LESS THAN IMMEDIATE
### 10001: GREATER THAN IMMEDIATE
### 10011: EQUAL TO IMMEDIATE
### 10010: EQUAL TO
### 01000: LEFT SHIFT
### 01001: RIGHT SHIFT
### 01010: BITWISE AND
### 01011: BITWISE OR
### 01100: BITWISE XOR
### 01101: NEGATION

### 00000: LOAD
### 00001: LOAD IMMEDIATELY
### 00010: STORE

### 10101: DISPLAY ACCUMULATOR
### 10110: DISPLAY REGISTER
### 10111: DISPLAY DATA MEMORY
### 11000: DISPLAY BOOL
### 11001: DISPLAY PC_CURRENT

### 10100: JUMP INSTRUCTION
### 000-> UNCONDITIONAL
### 001-> BOOL
### 010-> ZERO
### 011-> CARRY
### 100-> OVERFLOW

### Type: 00 (For ALU related instructions)
### Type(2)Opcode(5) RegisterDestination(3) R1(3) R2(3)
### Type(2)Opcode(5) RegisterDestination(3) Constant_Value(6) // For immediate type instructions

### Type: 01
### For Load/Store type instructions: Type(2) Opcode(5) RegisterLocation(3) MemoryLocation(6)

### Type: 10
### Type(2) Opcode(5) PCAddress(6) 000-> check bool
### 			       001-> check zero
### 			       010-> check carry
### 			       011-> check overflow

### Type: 11
### Type(2) Opcode(5) Specify Address in case of Registers/Data Memory(3/6) Rest bits don't care(6/3)
