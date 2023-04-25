///////////////////////////////////////////////////////////////////////////////
//
// 32-bit Adder module
//
// A 32-bit adder module for your Computer Architecture Elements Catalog
//
// module: adder32
// hdl: Verilog
//
// author: Lizelle Ocfemia <lizelle.ocfemia@coop.edu>
//
///////////////////////////////////////////////////////////////////////////////

module adder32(OUT, S, IN, A, B);
   output OUT;
   output [31:0] S;

   input IN;
   input [31:0] A;
   input [31:0] B;

  genvar k;
  generate for (k = 0; k < 32; k = k + 1)
    begin
      FullAdder fa(OUT, S[k], IN, A[k], B[k]);
    end
  endgenerate

endmodule