///////////////////////////////////////////////////////////////////////////////
//
// Half Adder Testbench module
//
// A half adder testbench module for your Computer Architecture Elements Catalog
//
// module: HalfAdder_tb
// hdl: Verilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module halfadder_tb();
   reg a, b;
   wire s, c;

   halfadder uut(a,b,s,c);
   
   initial begin
      $monitor("Time = %0d, a = %b, b = %b, s = %b, c = %b\n", $time, a, b, s, c);
      a = 1'b0;
      b = 1'b0;
      #10
      a = 1'b1; 
      b = 1'b0;
      #10
      a = 1'b0; 
      b = 1'b1;
      #10
      a = 1'b1; 
      b = 1'b1;
   end 

endmodule