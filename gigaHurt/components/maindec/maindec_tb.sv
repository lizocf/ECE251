<<<<<<< HEAD
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
`ifndef TB_MAINDEC
`define TB_MAINDEC

`timescale 1ns/100ps
`include "maindec.sv"
`include "../clock/clock.sv"

module maindec_tb;
    logic [2:0] op;
    logic memtoreg, memwrite, branch;
    logic alusrc, regdst, regwrite, jump;
    logic [1:0] aluop;
    integer i;

   initial begin
        $dumpfile("maindec.vcd");
        $dumpvars(0, uut);
        $monitor("time=%0t op=%b memtoreg=%b memwrite=%b alusrc=%b branch=%b regdst=%b regwrite=%b jump=%b aluop=%b",
            $realtime, op, memtoreg, memwrite, alusrc, branch, regdst, regwrite, jump, aluop);
    end

    initial begin
        #10 op <= 3'b0;

        for (i=0; i<8; i = i+1)
        begin
            op = op + 3'b001;
            #10;
        end
        $finish;
    end
    
   maindec uut(
        .op(op),
        .memtoreg(memtoreg),
        .memwrite(memwrite),
        .branch(branch),
        .alusrc(alusrc),
        .regdst(regdst),
        .regwrite(regwrite),
        .jump(jump),
        .aluop(aluop)
    );

endmodule

`endif // TB_MAINDEC
=======
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
`ifndef TB_MAINDEC
`define TB_MAINDEC

`timescale 1ns/100ps
`include "maindec.sv"
`include "../clock/clock.sv"

module maindec_tb;
    logic [2:0] op;
    logic memtoreg, memwrite, branch;
    logic alusrc, regdst, regwrite, jump;
    logic [1:0] aluop;
    integer i;

   initial begin
        $dumpfile("maindec.vcd");
        $dumpvars(0, uut);
        $monitor("time=%0t op=%b memtoreg=%b memwrite=%b alusrc=%b branch=%b regdst=%b regwrite=%b jump=%b aluop=%b",
            $realtime, op, memtoreg, memwrite, alusrc, branch, regdst, regwrite, jump, aluop);
    end

    initial begin
        #10 op <= 3'b0;

        for (i=0; i<8; i = i+1)
        begin
            op = op + 3'b001;
            #10;
        end
        $finish;
    end
    
   maindec uut(
        .op(op),
        .memtoreg(memtoreg),
        .memwrite(memwrite),
        .branch(branch),
        .alusrc(alusrc),
        .regdst(regdst),
        .regwrite(regwrite),
        .jump(jump),
        .aluop(aluop)
    );

endmodule

`endif // maindec
>>>>>>> 8abfab859301271f078ca507c777323ad14848d6
