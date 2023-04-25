`timescale 1ns/100ps
//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: Your Name
// 
// Create Date: 2023-02-07
// Module Name: bcd_to_decimal_decoder
// Description: converts a BCD input and returns a binary string with its position turned on
// Example: 1001 input -> 0000 0000 01 output
//
// Revision: 1.0
// Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bcd_to_decimal_decoder (Input,Output);
    input [1:0] Input;
    output [3:0] Output;
    
    wire [3:0] nots;
    
    not #0 (nots[0],Input[0]);
    not #0 (nots[1],Input[1]);
    
    and #0 (Output[0],nots[0],nots[1]); // 00 -> 1000
    and #0 (Output[1],nots[0],Input[1]); // 01 -> 0100
    and #0 (Output[2],Input[0],nots[1]); // 10 -> 0010
    and #0 (Output[3],Input[0],Input[1]); // 11 -> 0001
endmodule
