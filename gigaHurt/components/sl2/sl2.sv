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

    input  logic [(n-1):0] In,
    output logic [(n-1):0] Out
);
    // truncate two upper bits AND append two 0 lower bits
    assign Out = {In[(n-3):0], 2'b00};
endmodule

`endif