//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: gigaHurt
// 
//     Create Date: 2023-02-07
//     Module Name: sl2
//     Description: shift left two
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef SL2
`define SL2

`timescale 1ns/100ps

module sl2
    #(parameter n = 16)(

    input  logic [(n-1):0] A,
    output logic [(n-1):0] Y
);
    // truncate two upper bits AND append two 0 lower bits
    assign Y = {A[(n-3):0], 2'b00};
endmodule

`endif