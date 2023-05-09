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
    output logic [3:0] alucontrol
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    always @*
    case(aluop) // all this does is make funct = alucontrol
        2'b00: alucontrol <= 4'b0011; // add (for lw/sw/addi)
        2'b01: alucontrol <= 4'b0100; // sub (for beq)
        default:
            case(funct) // R-type instructions
                4'b0000: alucontrol <= 4'b0000; // and
                4'b0001: alucontrol <= 4'b0100; // or
                4'b0010: alucontrol <= 4'b0000; // nor
                4'b0011: alucontrol <= 4'b0001; // add
                4'b0100: alucontrol <= 4'b0111; // sub
                4'b0101: alucontrol <= 4'b0101; // mul
                4'b1000: alucontrol <= 4'b1000; // div
                4'b1001: alucontrol <= 4'b1001; // slt
                4'b1010: alucontrol <= 4'b1010; // jr

                default: alucontrol <= 4'bxxxx; // ???
            endcase
    endcase

endmodule

`endif // ALUDEC