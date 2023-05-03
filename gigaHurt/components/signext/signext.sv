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
    #(parameter n = 16, i = 7)(

    input  logic [(i-1):0] In,
    output logic [(n-1):0] Out
);
    // take the i-1 bit and fill in to n length
    assign Out = { {n{In[(i-1)]}}, In};
endmodule

`endif