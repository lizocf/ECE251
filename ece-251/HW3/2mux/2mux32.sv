///////////////////////////////////////////////////////////////////////////////
//
// Two-way 32-bit input multiplexer module
//
// Two-way 32-bit input mux module for your Computer Architecture Elements Catalog
//
// module: 2mux32
// hdl: Verilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

module twomux32(Y, D0, D1, S);
  output [31:0] Y;
  
  input [31:0] D0;
  input [31:0] D1;
  
  input S;

  genvar k;
  generate for (k = 0; k < 32; k = k + 1)
    begin
      twomux m21(Y[k], D0[k], D1[k], S);
    end
  endgenerate

endmodule
