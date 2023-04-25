///////////////////////////////////////////////////////////////////////////////
//
// Two-way multiplexer module
//
// Two-way multiplexer module for your Computer Architecture Elements Catalog
//
// module: 2mux
// hdl: Verilog
//
// author: Lizelle Ocfemia <lizelle.ocfemia@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

module twomux(Y, D0, D1, S);
  output Y;
  
  input D0;
  input D1;
  input S;

  wire W1, W2, W3;
  
  not (W2, S);
  and (W1, D1, S);
  and (W3, D0, W2);
  
  or (Y, W1, W3);

endmodule
