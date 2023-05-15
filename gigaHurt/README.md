# GigaHurt CPU

The GigaHurt CPU is a 16 bit single cycle-MIPS inspired CPU designed entirely in verilog completed for ECE-251 at the Cooper Union under Prof. Rob Marano

The ISA of our CPU is linked [here](https://cdn.discordapp.com/attachments/911824785124757536/1107778792849670344/GigaHurt_Reference_Data.pdf).

Unfortunately, there is a bug in our jump and branch commands. However, the rest of our CPU runs smoothly.

## Usage

To test the overall computer test the /components/computer module. Each component of the CPU has an attached testbench and Makefile.
*To test individual components run `make clean compile simulate` in their local directories*

__The computer comes loaded with a Fibonacci program in */components/fib.txt* and */components/leaf_ex.txt*; for an explanation of this code see */components/fib_explained.txt*, */components/fib_Cver.txt*, and */components/Leaf_ex_explained.txt*.__

The Fibonacci program calculates the 8th term of the Fibonacci series using recursive techniques (jal and jr instructions)

## The components
adder: 16 bit adder
ALU: handles arithmetic logic for R-type instructions.
aludec: handles control signals for ALU module.
clock: A simple 50% duty cycle clock.
computer: instantiates the CPU, imem, and dmem modules to run a test of a computer program.
controller: instantiates maindec and aludec modules.
CPU: instantiates controller and datapath of a CPU.
datapath: instantiates register file, ALU, and other datapath elements.
dff: 16-bit D-flip-flop.
dmem: handles stored data memory.
imem: handles stored read only instruction memory.
maindec: decodes the control signals for all instruction types.
mux2: 2:1 multiplexer.
regfile: input and output registers of the CPU, as well as the data within each.
signext: signextension module for i type instructions using two's complement.
sl2: **due to our 16-bit implementation, our sl2 component shifts one bit instead.**

## Authors
Lizelle Ocfemia lizelle.ocfemia@cooper.edu
Nicholas Storniolo nicholas.storniolo@cooper.edu
