//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: gigaHurt
// 
//     Create Date: 2023-02-07
//     Module Name: alu_tb
//     Description: arithmetic logic unit testbench
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ALU
`define TB_ALU

`timescale 1ns/100ps
`include "alu.sv"
`include "../clock/clock.sv"

module alu_tb;
    parameter n = 16;
    wire clk;
    logic clock_enable;
    logic [(n-1):0] A, B;
    logic [3:0] aluctrl;
    logic [(n-1):0] Y;
    integer i;

   initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, uut, uut1);
        $monitor("time=%0t alu_ctrl=%b A=%b B=%b Y=%b",
                 $realtime, aluctrl, A, B, Y);
    end

    initial begin
        #10 clock_enable <= 1;
        A <= #n'h00F;
        B <= #n'h0F1;
        aluctrl <= 4'b0000;
        #20
        
        for (i=0; i<5; i = i+1)
        begin
            A <= #n'h00F;
            B <= #n'h0F1;
            aluctrl = aluctrl + 4'b0001;
            #10;
        end
            
            A <= #n'h00F;
            B <= #n'h0F1;
            aluctrl = 4'b1000;
            #10;

            A <= #n'h00F;
            B <= #n'h0F1;
            aluctrl = 4'b1001;
            #10;


        $finish;
    end
    
   alu uut(
        .clk(clk),
        .a(A),
        .b(B),
        .alucontrol(aluctrl),
        .result(Y)
    );

    clock uut1(
        .ENABLE(clock_enable),
        .CLOCK(clk)
    );
endmodule

`endif // TB_ALU