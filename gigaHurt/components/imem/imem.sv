//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: gigaHurt
// 
//     Create Date: 2023-02-07
//     Module Name: imem
//     Description: instruction memory
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef IMEM
`define IMEM

`timescale 1ns/100ps

module imem
    #(parameter n = 16, parameter r = 5)(

    input  logic [(r-1):0] pc,
    output logic [(n-1):0] instr
    // output logic [(n-1):0] instr2
);

    logic [(n-1):0] RAM[0:((2**r)-1)];

  initial
    begin
      $readmemb("Code.txt",RAM); 
    end

  assign instr = RAM[pc];
  // assign instr2 = ROM[pc+2];

endmodule

`endif