///////////////////////////////////////////////////////////////////////////////
//
// Four-way multiplexer module
//
// Four-way multiplexer module for your Computer Architecture Elements Catalog
//
// module: 4mux
// hdl: Verilog
//
// author: Lizelle Ocfemia <lizelle.ocfemia@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

module fourmux(Y, D0, D1, D2, D3, S);
  output Y;
  
  input D0, D1, D2, D3;
  input [1:0] S;

  wire W0, W1, W2, W3, s0, s1;
  
  not (s0, S[0]);
  not (s1, S[1]);
  
  and (W0, D0, s0, s1);
  and (W1, D1, s0, S[1]);
  and (W2, D2, S[0], s1);
  and (W3, D3, S[0], S[1]);

  or (Y, W0, W1, W2, W3);
endmodule
