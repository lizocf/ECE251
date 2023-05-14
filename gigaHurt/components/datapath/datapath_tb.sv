//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: datapath
//     Description: 32-bit RISC-based CPU datapath (MIPS)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_DATAPATH
`define TB_DATAPATH

`timescale 1ns/100ps

`include "datapath.sv"
`include "../clock/clock.sv"
`include "../controller/controller.sv"

module datapath_tb
    #(parameter n = 16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    logic        clk, reset,
    logic        memtoreg, pcsrc,
    logic        alusrc, regdst,
    logic        regwrite, jump,
    logic [3:0]  alucontrol,
    logic        zero,
    logic [(n-1):0] pc,
    logic [(n-1):0] instr,
    logic [(n-1):0] aluout, writedata,
    logic [(n-1):0] readdata
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [2:0]  writereg;
    logic [(n-1):0] pcnext, pcnextbr, pcplus2, pcbranch; // +2 to go up to next inst
    logic [(n-1):0] signimm, signimmsh;
    logic [(n-1):0] srca, srcb;
    logic [(n-1):0] result;

    initial begin
        $dumpfile("datapath.vcd");
        $dumpvars(0, uut);
        $monitor("time=%0t instr=%b zero=%b pc=%b aluout=%b writedata=%b",
            $realtime, instr, zero, pc, aluout, writedata);
    end


    
endmodule

`endif // TB_DATAPATH