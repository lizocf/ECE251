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

module datapath_tb;
    parameter n = 16;
    logic        clk, reset;
    logic        memtoreg, pcsrc;
    logic        alusrc, regdst;
    logic        regwrite, jump;
    logic [3:0]  alucontrol;
    logic        zero0, zero1;
    logic [(n-1):0] pc;
    logic [(n-1):0] instr;
    logic [(n-1):0] aluout, writedata;
    logic [(n-1):0] readdata;

    logic [2:0]  writereg;
    logic [(n-1):0] pcnext, pcnextbr, pcplus2, pcbranch; // +2 to go up to next inst
    logic [(n-1):0] signimm, signimmsh;
    logic [(n-1):0] srca, srcb;
    logic [(n-1):0] result;
    logic [2:0] op;
    logic [3:0] funct;
    
    initial begin
        $dumpfile("datapath.vcd");
        $dumpvars(0, uut1, uut2);
        $monitor("time=%0t instr=%b zero1=%b pc=%d alucontrol=%b aluout=%b writedata=%b",
                $realtime, 
                //op=%b funct=%b zero0=%b memtoreg=%b memwrite=%b pcsrc=%b alusrc=%b regdst=%b regwrite=%b jump=%b alucontrol=%b 
                // op, funct, zero0, memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump, alucontrol, 
                instr, zero1, pc, alucontrol, aluout, writedata);
    end

    always #5 clk = ~clk;

    assign op = instr[15:13];
    assign funct = instr[3:0]; 

    initial begin
        clk = 0;
        reset = 1;
        #10
        reset = 0;
        zero0 = 0;
        instr = 16'b0110100000000111; // addi $2 $0 7
        #10
        instr = 16'b0110110000001010; // addi $3 $0 10
        #10
        instr = 16'b0000110100010001; // or $1 $2 $3
        #10
        instr = 16'b0100000010000000 ; // sw $2 2($1)
        #10
        $finish;
    end

   controller uut1(
        .op(op),
        .funct(funct),
        .zero(zero0),
        .memtoreg(memtoreg),
        .memwrite(memwrite),
        .pcsrc(pcsrc),
        .alusrc(alusrc),
        .regdst(regdst),
        .regwrite(regwrite),
        .jump(jump),
        .alucontrol(alucontrol)
    );

    datapath uut2(clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump, alucontrol,
                  zero1, pc, instr, aluout, writedata, readdata);


endmodule

`endif // TB_DATAPATH