# GigaHurt CPU

The GigaHurt CPU is a 16 bit single cycle MIPS inspired cpu
Designed entirely in verilog
Completed for ECE-251 at the Cooper Union under Prof. Rob Marano

## Usage

To test the overall computer test the /components/computer module.

Each component of the CPU has an attached testbench and makefile

*To test individual components run `make clean compile simulate` in their local directories*

__The computer comes loaded with a Fibonacci program in */components/computer/Code.txt* and */components/imem/Code.txt*; for an explanation of this code see */components/imem/Code_explained.txt* and */components/imem/Code_Cver.txt*__

The Fibonacci program calculates the 8th term of the Fibonacci series using recursive techniques (jal and jr instructions)


## The Design
The 32 bit MIPS CPU architecture has plenty of benefits in terms of simplicity, and GigaHurt comes from considering "what do simple programs actually need?"

16 bits is a limitation in many ways, but still provides enough room for all base level computations.

A 3 bit opcode only leaves room for 8 instructions, but similar to MIPS all r-type instructions fall under OP=000 and instead utilize the last four bits of instruction (funct) to determine the operation

This leaves room for all basic arithmetic and bit operations as well as jumping. Through Jal and Jr GigaHurt is even capable of making function calls opening the door to nested procedures or even recursion.

Another limitation of this design is that registers are also only identifiable by 3 bits. 8 registers is a small number to work with, though as shown through example it is enough to run one call of fibonacci without using moving data between memory- proof that such a limitation is not a problem for simple algorithms.

## The Components
adder: 16 bit adder

alu: handles arithmetic logic for r type instructions

aludec: handles control signals for alu module

clock: A simple 50% duty cycle clock

computer: instantiates the cpu, imem, and dmem modules to run a test of a computer program

controller: instantiates maindec and aludec modules

cpu: instantiates controller and datapath of a cpu

datapath: instantiates register file, alu, and other datapath elements

dff: 16 bits of D-flip-flop

dmem: handles stored data memory

imem: handles stored read only instruction memory

maindec: handles control sginals for all instruction types

mux2: two to one multiplexor

regfile: input and output of registers of the cpu

signext: signextension module for i type instructions using two's complement

sl2: binary shift left 2 (truncate two upper bits AND append two 0 lower bits)

## Authors
Lizelle Ocfemia lizelle.ocfemia@cooper.edu

Nicholas Storniolo nicholas.storniolo@cooper.edu
