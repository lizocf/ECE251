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
`include "aludec.sv"
`include "../clock/clock.sv"

module aludec_tb;
    logic [3:0] funct;
    logic [1:0] aluop;
    logic [3:0] alucontrol;
    integer i;

   initial begin
        $dumpfile("aludec.vcd");
        $dumpvars(0, uut);
        $monitor("time=%0t funct=%b aluop=%b alucontrol=%b",
            $realtime, funct, aluop, alucontrol);
    end

    initial begin
        #10 funct <= 4'b0;
        for (i=0; i<10; i = i+1)
        begin
            funct = funct + 3'b001;
            #10;
        end
        $finish;
    end
    
   aludec uut(
        .funct(funct),
        .aluop(aluop),
        .alucontrol(alucontrol)
    );

endmodule

`endif // maindec