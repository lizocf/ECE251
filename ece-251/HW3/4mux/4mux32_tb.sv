///////////////////////////////////////////////////////////////////////////////
//
// Four-way 32-bit multiplexer testbench module
//
// Four-way 32-bit multiplexer testbench module for your Computer Architecture Elements Catalog
//
// module: 4mux
// hdl: Verilog
//
// author: Lizelle Ocfemia <lizelle.ocfemia@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module fourmux32_tb;
  wire [31:0] out;

  reg [31:0] d0;
  reg [31:0] d1;
  reg [31:0] d2;
  reg [31:0] d3;
  reg [1:0] s;
  integer i;
  
  fourmux32 uut(.Y(out), .D0(d0), .D1(d1), .D2(d2), .D3(d3), .S(s));
  
  initial begin
    for (i = 0; i < 32; i = i + 1)
      begin
        d0[i] = i%2;
        d1[i] = 0;
        d2[i] = !(d0[i]);
        d3[i] = 1;
      end
    $monitor("Time = %0d, out = %b, d0 = %b, d1 = %b, s = %b\n", $time, out, d0, d1, s);
    
    for (i = 0; i < 4; i = i + 1)
      begin
        s = i;
        #10;
      end
  end
endmodule
