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

module sl2 //actually sl1 for 16-bit
    #(parameter n = 16)(

    input  logic [(n-1):0] A,
    output logic [(n-1):0] Y
);
    // truncate two upper bits AND append two 0 lower bits
    assign Y = {A[(n-3):0], 1'b0};
endmodule

`endif


// 0000 0000 0000 0000 0000 0000 0000 0000
// 0000 0000 0000 0000 0000 0000 0000 0100
// 