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
`ifndef TB_CPU
`define TB_CPU

`include "../datapath/datapath.sv"
`include "../controller/controller.sv"
`include "../clock/clock.sv"

module tb_cpu;
    parameter n = 16;
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    logic clk, reset; //            in
    logic [(n-1):0] pc; //          out
    logic [(n-1):0] instr; //       in
    logic memwrite; //              out
    logic [(n-1):0] aluout, writedata; // out
    logic [(n-1):0] readdata; //    in
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic memtoreg, alusrc, regdst, regwrite, jump, pcsrc, zero, zero0;
    logic [3:0] alucontrol;

   initial begin
        $dumpfile("cpu.vcd");
        $dumpvars(0, uut1, uut2);
        $monitor("time=%0t pc=%d instr=%b memwrite=%b aluout=%b writedata=%b",
                $realtime, pc, instr, memwrite, aluout, writedata);
    end

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        #10
        reset = 0;
        zero0 = 0;
        instr = 16'b0110010010001100;
        #10
        instr = 16'b0110100100001000;
        #10
        zero0 = 0;
        instr = 16'b0000010110100001;
        #10
        instr = 16'b0100110110000000;
        $finish;
    end

    // MIPS controller
    controller uut1(
        instr[15:13], instr[3:0], zero0,
        memtoreg, memwrite, pcsrc,
        alusrc, regdst, regwrite,
        jump, alucontrol);

    // MIPS datapath
    datapath uut2(
        clk, reset, memtoreg,
        pcsrc, alusrc, regdst,
        regwrite, jump, alucontrol,
        zero, pc, instr,
        aluout, writedata, readdata);

endmodule

`endif // CPU