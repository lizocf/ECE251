//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: Lizelle Ocfemia & Nicholas Storniolo
// 
//     Create Date: 2023-05-01
//     Module Name: dff
//     Description: 16 bit D flip flop
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef DFF
`define DFF

`timescale 1ns/100ps

module dff
    #(parameter n = 16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic CLOCK, RESET,
    input  logic [(n-1):0] D,
    output logic [(n-1):0] Q
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    always @(posedge CLOCK, posedge RESET)
    begin
        if (RESET)
        begin
            Q <= 0;
        end
        else
        begin
            Q <= D;
        end
    end
endmodule

`endif // DFF