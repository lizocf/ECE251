`include "bcd_to_decimal.sv"
`timescale 1ns/100ps
//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: Your Name
// 
// Create Date: 2023-02-07
// Test Bench Name: bcd_to_decimal_decoder
// Description: test bench for bcd_to_decimal_decoder
//
// Revision: 1.0
// Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bcd_to_decimal_decoder_tb();
    reg [1:0] A;
    wire [3:0] B;
    
    bcd_to_decimal_decoder DUT(
        .Input(A),
        .Output(B)
        );
    
    initial begin 
        $dumpfile("test.vcd"); 
        $dumpvars(1,bcd_to_decimal_decoder_tb);
        $monitor("A=%2b,B=%4b", A, B);
        #100 A=2'b11;
        #100 $finish;
    end
endmodule
