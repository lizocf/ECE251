///////////////////////////////////////////////////////////////////////////////
//
// Two-way 32-bit multiplexer testbench module
//
// Two-way 32-bit multiplexer testbench module for your Computer Architecture Elements Catalog
//
// module: 2mux_tb
// hdl: Verilog
//
// author: Lizelle Ocfemia <lizelle.ocfemia@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module twomux32_tb;
  wire [31:0] out;
  reg [31:0] d0;
  reg [31:0] d1;
  reg s;
  integer i;
  
  twomux32 uut(.Y(out), .D0(d0), .D1(d1), .S(s));
  
  initial begin
    for (i = 0; i < 32; i = i + 1)
      begin
        d0[i] = i%2;
        d1[i] = !(d0[i]);
      end
    $monitor("Time = %0d, out = %b, d0 = %b, d1 = %b, s = %b\n", $time, out, d0, d1, s);
    s = 0;
    #10;
    s = 1;
    #10;
  end
endmodule
