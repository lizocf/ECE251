///////////////////////////////////////////////////////////////////////////////
//
// Half Adder module
//
// A Half Adder module for your Computer Architecture Elements Catalog
//
// module: HalfAdder
// hdl: Verilog
//
// author: Lizelle Ocfemia <lizelle.ocfemia@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

module halfadder(S, C, A, B);
   input A, B; 
   output S, C;
   
   xor (S, A, B);
   and (C, A, B);

endmodule