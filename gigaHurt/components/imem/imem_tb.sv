//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: tb_imem
//     Description: Test bench for instruction memory
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_IMEM
`define TB_IMEM

`timescale 1ns/100ps
`include "imem.sv"

module tb_imem;
    parameter n = 16; // bit length of registers/memory
    parameter r = 5; // we are only addressing 64=2**6 mem slots in imem
    logic [(n-1):0] instr;
    logic [(r-1):0] imem_addr;
    integer k;

   initial begin
        $dumpfile("imem.vcd");
        $dumpvars(0, uut);
        //$monitor("enable = %b clk = %b", enable, clk);
        $monitor("time=%0t \t imem_addr=%h readdata=%b",$realtime, imem_addr, instr);
    end

    initial begin
        #10 imem_addr <= #(r)'b00000;
        #10 imem_addr <= #(r)'b00001;
        #10 imem_addr <= #(r)'b00010;
        #10 imem_addr <= #(r)'b00011;
        #10 imem_addr <= #(r)'b00100;
        #10 imem_addr <= #(r)'b00101;
        $finish;
    end

   imem uut(
        .pc(imem_addr),
        .instr(instr)
    );

    
endmodule

`endif // TB_IMEM