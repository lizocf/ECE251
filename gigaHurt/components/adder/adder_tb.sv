//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: tb_adder
//     Description: Test bench for simple behavorial adder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_ADDER
`define TB_ADDER

`timescale 1ns/100ps
`include "adder.sv"

module tb_adder;
    parameter n = 16;
    logic [(n-1):0] a, b, y;

   initial begin
        $dumpfile("adder.vcd");
        $dumpvars(0, uut);
        $monitor("a = %b b = %b y = %b", a, b, y);
    end

    initial begin
        a <= #n'b0;
        b <= #n'b100;
    end

    adder uut(
        .A(a), .B(b), .Y(y)
    );
endmodule
`endif // TB_ADDER