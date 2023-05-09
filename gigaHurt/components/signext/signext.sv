//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: gigaHurt
// 
//     Create Date: 2023-02-07
//     Module Name: signext
//     Description: sign extender (7 to 16 bit)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef SIGNEXT
`define SIGNEXT

`timescale 1ns/100ps

module signext
    #(parameter n = 16, i = 8)(

    input  logic [(i-1):0] A,
    output logic [(n-1):0] Y
);
    // take the i-1 bit and fill in to n length
    assign Y = { {n{A[(i-1)]}}, A};
endmodule

`endif