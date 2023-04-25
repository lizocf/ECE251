///////////////////////////////////////////////////////////////////////////////
//
// Four-way 32-bit multiplexer module
//
// An four-way 32-bit multiplexer module for your Computer Architecture Elements Catalog
//
// module: 4mux32
// hdl: Verilog
//
// author: Lizelle Ocfemia <lizelle.ocfemia@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

module fourmux32(Y, D0, D1, D2, D3, S);
  output [31:0] Y;

  input [31:0] D0;
  input [31:0] D1;
  input [31:0] D2;
  input [31:0] D3;

  input [1:0] S;

  genvar k;
  generate for (k = 0; k < 32; k = k + 1)
    begin
      fourmux m41(Y[k], D0[k], D1[k], D2[k], D3[k], S);
    end
  endgenerate

endmodule
