# RISC-V-Processor-with-implemented-Linear-Search-Algorithm
# Introduction
This README provides a detailed explanation of the pipe_MIPS32 Verilog module, which simulates a pipelined MIPS32 processor. The module consists of several stages: Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), Memory (MEM), and Write Back (WB). The design incorporates essential control signals and handles different types of instructions.

# Module Interface
**Inputs** <br>  
clk1: Clock signal for the first phase of the pipeline.
clk2: Clock signal for the second phase of the pipeline.
**Registers**
PC: Program Counter, holding the address of the next instruction.
IF_ID, IF_ID_NPC, IF_ID_IR: Registers for the IF/ID pipeline stage.
ID_EX_IR, ID_EX_NPC, ID_EX_A, ID_EX_B, ID_EX_Imm: Registers for the ID/EX pipeline stage.
ID_EX_type, EX_MEM_type, MEM_WB_type: Registers for the type of operation in each stage.
EX_MEM_IR, EX_MEM_ALUout, EX_MEM_B: Registers for the EX/MEM pipeline stage.
EX_MEM_cond: Condition flag for branch instructions.
MEM_WB_IR, MEM_WB_ALUout, MEM_WB_LMD: Registers for the MEM/WB pipeline stage.
Reg[0:31]: Register file, containing 32 general-purpose registers.
Mem[0:1023]: Memory, containing 1024 words.
# Parameters
Instruction opcodes (e.g., ADD, SUB, AND, etc.)
Instruction types (e.g., RR_ALU, RM_ALU, LOAD, STORE, BRANCH, HALT)
Control Signals
HALTED: Signal to indicate if the processor has halted.
TAKEN_BRANCH: Signal to indicate if a branch is taken.

# Pipeline Stages
# Instruction Fetch (IF) Stage
The IF stage is responsible for fetching the next instruction from memory. If a branch is taken, the instruction at the branch target address is fetched. Otherwise, the instruction at the current PC address is fetched.
# Instruction Decode (ID) Stage
The ID stage decodes the instruction and reads the necessary register values. It also calculates the immediate value and determines the type of operation.
# Execute (EX) Stage
The EX stage performs the necessary arithmetic or logical operation based on the decoded instruction.
