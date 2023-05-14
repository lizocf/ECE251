//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: gigaHurt
// 
//     Create Date: 2023-02-07
//     Module Name: regfile_tb
//     Description: register file
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_REGFILE
`define TB_REGFILE

`timescale 1ns/100ps

module tb_regile;
    parameter n = 16; // #bits for an operand
    parameter r = 3;
    logic WE3;
    logic [(r-1):0] RA1, RA2, WA3;
    logic [(n-1):0] WD3, RD1, RD2;
    logic clk;

    always #5 clk = ~clk;

   initial begin
        $dumpfile("regfile.vcd");
        $dumpvars(0, uut);
        $monitor("time=%0t  WE3=%b  RA1=%b  RA2=%b  WA3=%b  WD3=%b  RD1=%b  RD2=%b",
                 $realtime, WE3, RA1, RA2, WA3, WD3, RD1, RD2);
    end

    initial begin
        clk=0;
        RA1=0;RA2=0;WE3=0;WD3=36;
        #10 
        WE3=1;
        WA3=1;
        RA1=1;
        #10
        WA3=2;
        RA2=2;
        WD3={{10{RD1[5]}},RD1[5:0]};;
        #10
        WE3=0;
        $finish;
    end

    regfile uut(.clk(clk), .we3(WE3), .ra1(RA1), .ra2(RA2), .wa3(WA3), 
            .wd3(WD3), .rd1(RD1), .rd2(RD2));

endmodule



`endif // TB_REGILE