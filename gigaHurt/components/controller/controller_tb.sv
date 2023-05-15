//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: gigaHurt
// 
//     Create Date: 2023-02-07
//     Module Name: maindec_tb
//     Description: Controls signal decoder testbench
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef TB_CONTROLLER
`define TB_CONTROLLER

`timescale 1ns/100ps
`include "controller.sv"
`include "../clock/clock.sv"

module controller_tb;
    logic [2:0] op;
    logic [3:0] funct, alucontrol;
    logic [1:0] aluop;
    logic       zero, memtoreg, memwrite, pcsrc, alusrc;
    logic       regdst, regwrite, jump; 
    integer i;

   initial begin
        $dumpfile("controller.vcd");
        $dumpvars(0, uut);
        $monitor("time=%0t op=%b aluop=%b funct=%b zero=%b, memtoreg=%b memwrite=%b pcsrc=%b alusrc=%b regdst=%b regwrite=%b jump=%b alucontrol=%b",
                $realtime, op, aluop, funct, zero, memtoreg, memwrite, pcsrc, 
                alusrc, regdst, regwrite, jump, alucontrol);
    end

    initial begin
        #10 op <= 011; funct <= 0001; zero <= 0;
        #10 op <= 000; funct <= 0001;
                // clk = 0;
                // reset = 1;
        // #10
        // reset = 0;
        // zero0 = 0;
        // instr = 16'b0110101000000111; // addi $2 $4 7
        // #10
        // instr = 16'b0110110000001010; // addi $3 $0 10 
        // #10
        // instr = 16'b0000001000010001; // or $1 $2 $3
        // #10
        // readdata = 16'b0000000000011111;
        // instr =    16'b0100000010000000 ; // sw $2 2($1)
        // #10
        // $finish;
        $finish;
    end
    
   controller uut(
        .op(op),
        .funct(funct),
        .zero(zero),
        .memtoreg(memtoreg),
        .memwrite(memwrite),
        .pcsrc(pcsrc),
        .alusrc(alusrc),
        .regdst(regdst),
        .regwrite(regwrite),
        .jump(jump),
        .alucontrol(alucontrol)
    );

endmodule

`endif // controller