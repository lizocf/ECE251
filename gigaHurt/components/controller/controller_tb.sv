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
        #10 op <= 000; funct <= 0001; zero <= 1;
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