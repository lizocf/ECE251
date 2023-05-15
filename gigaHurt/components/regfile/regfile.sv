//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: gigaHurt
// 
//     Create Date: 2023-02-07
//     Module Name: regfile
//     Description: register file
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef REGFILE
`define REGFILE

`timescale 1ns/100ps

module regfile
    // n=bit length of register; r=bit length of addr of registers
    #(parameter n = 16, parameter r = 3)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic        clk, 
    input  logic        we3, // write enable
    input  logic [(r-1):0]  ra1, ra2, wa3, // read/write addr
    input  logic [(n-1):0] wd3, // write data
    output logic [(n-1):0] rd1, rd2 // read data
    );
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    reg [(n-1):0] rf[((2**r)-1):0]; // create reg array
    integer i;

    // three ported register file
    // read two ports combinationally
    // write third port on rising edge of clk
    // register 0 hardwired to 0
    // note: for pipelined processor, write third port
    // on falling edge of clk

    initial begin
        for(i=0;i<8;i=i+1)
        rf[i] <= 16'd0;
    end
    always @(posedge clk)
    begin
        if (we3) 
            begin rf[wa3] <= wd3; end	// if enable, write wd3 to wa3 
    end

    assign rd1 = rf[ra1]; 
    assign rd2 = rf[ra2];
endmodule

`endif // REGFILE