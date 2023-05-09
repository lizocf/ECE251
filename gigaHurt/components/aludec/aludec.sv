//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: gigaHurt
// 
//     Create Date: 2023-02-07
//     Module Name: aludec
//     Description: 16-bit RISC-based ALU decoder (MIPS)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef ALUDEC
`define ALUDEC

module aludec(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input logic [3:0] funct,
    input logic [1:0] aluop,
    output logic [2:0] alucontrol
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    always @*
    case(aluop) // should we make alucontrol = funct ???
        2'b00: alucontrol <= 3'b010; // add (for lw/sw/addi)
        2'b01: alucontrol <= 3'b110; // sub (for beq)
        default:
            case(funct) // R-type instructions
                4'b0000: alucontrol <= 4'b0000; // add
                4'b0001: alucontrol <= 3'b110; // sub
                4'b0010: alucontrol <= 3'b000; // and
                4'b0011: alucontrol <= 3'b001; // or
                4'b0100: alucontrol <= 3'b111; // slt
                default: alucontrol <= 3'bxxx; // ???
            endcase
    endcase

endmodule

`endif // ALUDEC