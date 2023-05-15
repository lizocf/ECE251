# GigaHurt CPU

The GigaHurt CPU is a 16 bit single cycle MIPS inspired cpu
Designed entirely in verilog
Completed for ECE-251 at the Cooper Union under Prof. Rob Marano

The ISA of our CPU is linked [here]:(https://cdn.discordapp.com/attachments/911824785124757536/1107778792849670344/GigaHurt_Reference_Data.pdf)

## Usage

To test the overall computer test the /components/computer module.

Each component of the CPU has an attached testbench and makefile

*To test individual components run `make clean compile simulate` in their local directories*

__The computer comes loaded with a Fibonacci program in */components/computer/Code.txt* and */components/imem/Code.txt*; for an explanation of this code see */components/imem/Code_explained.txt* and */components/imem/Code_Cver.txt*__

The Fibonacci program calculates the 8th term of the Fibonacci series using recursive techniques (jal and jr instructions)

## The components
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

sl2

## Authors
Lizelle Ocfemia lizelle.ocfemia@cooper.edu

Nicholas Storniolo nicholas.storniolo@cooper.edu
