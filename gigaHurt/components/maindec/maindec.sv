//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: gigaHurt
// 
//     Create Date: 2023-02-07
//     Module Name: maindec
//     Description: 32-bit RISC-based CPU main decoder (MIPS)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef MAINDEC
`define MAINDEC

`timescale 1ns/100ps

module maindec
    #(parameter n = 16)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input   [2:0] op,
    output  memtoreg, memwrite,
    output  branch, alusrc,
    output  regdst, regwrite,
    output  jump,
    output  [1:0] aluop
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [8:0] controls; // 9-bit control vector

    // controls has 9 logical signals
    assign {memtoreg, memwrite, alusrc, branch,
            regdst, regwrite, jump, aluop} = controls;

    always @* begin
        case(op)
            3'b000: controls <= 9'b000011010; // RTYPE
            
            // ITYPE
            3'b001: controls <= 9'b011001000; // LW
            3'b010: controls <= 9'b011000000; // SW
            3'b011: controls <= 9'b001001000; // ADDI
            // 3'b100: controls <= 9'b000100001; // BGT
            3'b101: controls <= 9'b000100001; // BEQ

            // JTYPE
            3'b110: controls <= 9'b000000100; // J
            3'b111: controls <= 9'b000000100; // JAL
            
            default:   controls <= 9'bxxxxxxxxx; // illegal operation
        endcase
    end

endmodule

`endif // MAINDEC
