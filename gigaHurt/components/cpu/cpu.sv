///////////////////////////////////////////////////////////////////////////////
//
// MIPS CPU module
//
// 16-bit MIPS CPU
//
// module: cpu
// hdl: Verilog
//
// author: gigaHurt
// See https://booksite.elsevier.com/9780123944245/?ISBN=9780123944245
//
///////////////////////////////////////////////////////////////////////////////
`ifndef CPU
`define CPU

`include "./datapath.sv"
`include "./controller.sv"

module cpu
    #(parameter n = 16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic clk, reset,
    output logic [(n-1):0] pc,
    input logic [(n-1):0] instr,
    output logic memwrite,
    output logic [(n-1):0] aluout, writedata,
    input logic [(n-1):0] readdata
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic memtoreg, alusrc, regdst,
    regwrite, jump, pcsrc, zero;
    logic [3:0] alucontrol;

    // MIPS controller
    controller c(
        instr[15:13], instr[3:0], zero,
        memtoreg, memwrite, pcsrc,
        alusrc, regdst, regwrite,
        jump, alucontrol);

    // MIPS datapath
    datapath dp(
        clk, reset, memtoreg,
        pcsrc, alusrc, regdst,
        regwrite, jump, alucontrol,
        zero, pc, instr,
        aluout, writedata, readdata);

endmodule

`endif // CPU