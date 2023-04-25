///////////////////////////////////////////////////////////////////////////////
//
// EXAMPLE TESTBENCH module
//
// An example testbench module for your Computer Architecture Elements Catalog
//
// module: example_tb
// hdl: Verilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module regFile_tb;

 // Inputs
 reg [31:0] Ip1;
 reg [3:0] sel_i1;
 reg [3:0] sel_o1;
 reg [3:0] sel_o2;

 reg RD;
 reg WR;
 reg rst;
 reg EN;

 reg clk;

 // Outputs

 wire [31:0] Op1;
 wire [31:0] Op2;

 // Instantiate the Unit Under Test (UUT)

 regFile uut (.Ip1(Ip1), .sel_i1(sel_i1), .Op1(Op1), .sel_o1(sel_o1), 
              .Op2(Op2), .sel_o2(sel_o2), .RD(RD), .WR(WR), .rst(rst), 
              .EN(EN), .clk(clk));

 initial begin

  // Initialize Inputs

  Ip1  = 32'b0;
  sel_i1  = 4'b0;
  sel_o1  = 4'b0;
  sel_o2  = 4'b0;

  RD  = 1'b0;
  WR  = 1'b0;
  rst  = 1'b1;
  EN  = 1'b0;

  clk  = 1'b0;

  // Wait for global reset to finish

  #10;        

  // Add stimulus here

   rst  = 1'b0;
   EN  = 1'b1;
   #10;

   WR  = 1'b1;
   RD = 1'b0;

   Ip1  = 32'habcd_efab;
   sel_i1  = 4'h0;
   #10;

   Ip1  = 32'h0123_4567;
   sel_i1  = 4'h1;
   #10;

   WR  = 1'b0;
   RD     = 1'b1;

   sel_o1  = 4'h0;
   sel_o2  = 4'h1;
 end 

   always begin

  #10;

  clk = ~clk;

 end 

endmodule
