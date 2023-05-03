//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: gigaHurt
// 
//     Create Date: 2023-02-07
//     Module Name: dmem
//     Description: data memory
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef DMEM
`define DMEM

`timescale 1ns/100ps

module dmem
    #(parameter n = 16, parameter r = 3)(

    input  logic clk, write_enable,
    input  logic [(n-1):0] addr, writedata,
    output logic [(n-1):0] readdata
);
    logic [(n-1):0] RAM[0:((2**r)-1)];

    assign readdata = RAM[addr[(n-1):2]]; // word aligned (ignores lower 2 bits of address)

    always @(posedge clk)
        if (write_enable) RAM[addr[(n-1):2]] <= writedata;

endmodule

`endif