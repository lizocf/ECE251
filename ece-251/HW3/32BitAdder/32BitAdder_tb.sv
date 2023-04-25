///////////////////////////////////////////////////////////////////////////////
//
// 32-bit Adder Testbench module
//
// A 32-bit Adder Testbench module for your Computer Architecture Elements Catalog
//
// module: adder32_tb
// hdl: Verilog
//
// author: Lizelle Ocfemia <lizelle.ocfemia@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module adder32_tb;
   wire out;
   wire [31:0] s;

   reg in;
   reg [31:0] a;
   reg [31:0] b;

   adder32 uut(.OUT(out), .S(s), .IN(in), .A(a), .B(b));

   initial begin
      $monitor("Time = %0d, out = %b, s = %b, in = %b, a = %b, b = %b\n", $time, out, s, in, a, b);
      in = 0;
      a = 32'b00001111000011110000111100001111;
      b = 32'b00000000000000000000000000000001;
      #10;
      in = 1;
   end

endmodule