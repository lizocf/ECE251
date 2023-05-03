//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: gigaHurt
// 
//     Create Date: 2023-02-07
//     Module Name: adder
//     Description: 16 bit adder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef ADDER
`define ADDER

`timescale 1ns/100ps

module adder#(parameter n = 16)(A,B,S);
    
    input [(n-1):0] A;
    input [(n-1):0] B;
    output [31:0] S;
    output Cout;
    wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15;

    fullAdder a1(1'b0,A[0],B[0],c1,S[0]);
    fullAdder a2(c1,A[1],B[1],c2,S[1]);
    fullAdder a3(c2,A[2],B[2],c3,S[2]);
    fullAdder a4(c3,A[3],B[3],c4,S[3]);
    fullAdder a5(c4,A[4],B[4],c5,S[4]);
    fullAdder a6(c5,A[5],B[5],c6,S[5]);
    fullAdder a7(c6,A[6],B[6],c7,S[6]);
    fullAdder a8(c7,A[7],B[7],c8,S[7]);
    fullAdder a9(c8,A[8],B[8],c9,S[8]);
    fullAdder a10(c9,A[9],B[9],c10,S[9]);
    fullAdder a11(c10,A[10],B[10],c11,S[10]);
    fullAdder a12(c11,A[11],B[11],c12,S[11]);
    fullAdder a13(c12,A[12],B[12],c13,S[12]);
    fullAdder a14(c13,A[13],B[13],c14,S[13]);
    fullAdder a15(c14,A[14],B[14],c15,S[14]);
    fullAdder a16(c15,A[15],B[15],Cout,S[15]);
endmodule

module fullAdder(cin,a,b,cout,s);

  input cin, a, b;
  output cout, s;
  wire c1, c2, s1;

  halfAdder h1 (a, b, c1, s1);
  halfAdder h2 (s1, cin, c2, s);
  or(cout, c1, c2);

endmodule

module halfAdder(A, B, C, S);

    input  A, B;
    output C, S;

    xor (S,A,B);
    and (C,A,B);

endmodule
`endif