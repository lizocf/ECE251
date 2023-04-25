///////////////////////////////////////////////////////////////////////////////
//
// Full Adder module
//
// A full adder module for your Computer Architecture Elements Catalog
//
// module: FullAdder
// hdl: Verilog
//
// author: Lizelle Ocfemia <lizelle.ocfemia@coop.edu>
//
///////////////////////////////////////////////////////////////////////////////

`include "../HalfAdder/HalfAdder.sv"

module FullAdder(OUT, S, IN, A, B);
   input IN, A, B;
   output OUT, S;
   wire s1, c1, c2;

   halfadder ha1(s1, c1, A, B);
   halfadder ha2(S, c2, s1, IN);
   or (OUT, c1, c2);
   
endmodule