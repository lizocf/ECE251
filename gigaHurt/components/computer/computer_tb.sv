//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2023
// Engineer: Prof Rob Marano
// 
//     Create Date: 2023-02-07
//     Module Name: tb_computer
//     Description: Test bench for a single-cycle MIPS computer
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef TB_COMPUTER
`define TB_COMPUTER

`timescale 1ns/100ps

`include "computer.sv"
`include "../clock/clock.sv"

module computer_tb;
  parameter n = 16; // # bits to represent the instruction / ALU operand / general purpose register (GPR)
  parameter m = 5;  // # bits to represent the address of the 2**m=16 GPRs in the CPU
  logic clk;
  logic clk_enable;
  logic reset;
  logic memwrite;
  logic [n-1:0] writedata;
  logic [n-1:0] dataadr;

  logic firstTest, secondTest;

  // instantiate the CPU as the device to be tested
  computer dut(clk, reset, writedata, dataadr, memwrite);
  // generate clock to sequence tests
  // always
  //   begin
  //     clk <= 1; # 5; clk <= 0; # 5;
  //   end

  // instantiate the clock
  clock dut1(.ENABLE(clk_enable), .CLOCK(clk));


  initial begin
    firstTest = 1'b0;
    secondTest = 1'b0;
    $dumpfile("computer.vcd");
    $dumpvars(0,dut1,clk,reset,writedata,dataadr,memwrite);
    $monitor("t=%t\t%b\t%b\t%b",$realtime,writedata,dataadr,memwrite);
    // $dumpvars(0,clk,a,b,ctrl,result,zero,negative,carryOut,overflow);
    // $display("Ctl Z  N  O  C  A                    B                    ALUresult");
    // $monitor("%3b %b  %b  %b  %b  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)  %8b (0x%2h;%3d)",ctrl,zero,negative,overflow,carryOut,a,a,a,b,b,b,result,result,result);
  end

  // initialize test
  initial begin
    #0 clk_enable <= 0; #50 reset <= 1; # 50; reset <= 0; #50 clk_enable <= 1;
    #100 $finish;
  end

  // monitor what happens at posedge of clock transition
  always @(posedge clk)
  begin
      $display("+");
      $display("\t+instr = %b",dut.instr);
      $display("\t+op = %b",dut.mips.c.op);
      $display("\t+controls = %b",dut.mips.c.md.controls);
      $display("\t+funct = %b",dut.mips.c.ad.funct);
      $display("\t+aluop = %b",dut.mips.c.ad.aluop);
      $display("\t+alucontrol = %b",dut.mips.c.ad.alucontrol);
      $display("\t+alu result = %b",dut.mips.dp.alu.result);
      $display("\t+HiLo = %b",dut.mips.dp.alu.HiLo);
      $display("\t+a = %b",dut.mips.dp.alu.a);
      $display("\t+b = %b",dut.mips.dp.alu.b);
      $display("\t+$v0 = %b",dut.mips.dp.rf.rf[2]);
      $display("\t+$v1 = %b",dut.mips.dp.rf.rf[3]);
      $display("\t+$a0 = %b",dut.mips.dp.rf.rf[4]);
      $display("\t+$a1 = %b",dut.mips.dp.rf.rf[5]);
    //   $display("\t+$t0 = 0x%4h",dut.mips.dp.rf.rf[8]);
    //   $display("\t+$t1 = 0x%4h",dut.mips.dp.rf.rf[9]);
      $display("\t+regfile -- ra1 = %b",dut.mips.dp.rf.ra1);
      $display("\t+regfile -- ra2 = %b",dut.mips.dp.rf.ra2);
      $display("\t+regfile -- we3 = %b",dut.mips.dp.rf.we3);
      $display("\t+regfile -- wa3 = %b",dut.mips.dp.rf.wa3);
      $display("\t+regfile -- wd3 = %b",dut.mips.dp.rf.wd3);
      $display("\t+regfile -- rd1 = %b",dut.mips.dp.rf.rd1);
      $display("\t+regfile -- rd2 = %b",dut.mips.dp.rf.rd2);
      $display("\t+RAM[%2d] = %2d",dut.dmem.addr,dut.dmem.readdata);
      $display("writedata\tdataadr\tmemwrite");
  end

  // run program
  // monitor what happens at negedge of clock transition
  always @(negedge clk) begin
    $display("-");
    $display("\t+instr = %b",dut.instr);
    $display("\t+op = %b",dut.mips.c.op);
    $display("\t+controls = %b",dut.mips.c.md.controls);
    $display("\t+funct = %b",dut.mips.c.ad.funct);
    $display("\t+aluop = %b",dut.mips.c.ad.aluop);
    $display("\t+alucontrol = %b",dut.mips.c.ad.alucontrol);
    $display("\t+alu result = %b",dut.mips.dp.alu.result);
    $display("\t+HiLo = %b",dut.mips.dp.alu.HiLo);
    $display("\t+$v0 = %b",dut.mips.dp.rf.rf[2]);
    $display("\t+$v1 = %b",dut.mips.dp.rf.rf[3]);
    $display("\t+$a0 = %b",dut.mips.dp.rf.rf[4]);
    $display("\t+$a1 = %b",dut.mips.dp.rf.rf[5]);
//   $display("\t+$t0 = 0x%4h",dut.mips.dp.rf.rf[8]);
//   $display("\t+$t1 = 0x%4h",dut.mips.dp.rf.rf[9]);
    $display("\t+regfile -- ra1 = %b",dut.mips.dp.rf.ra1);
    $display("\t+regfile -- ra2 = %b",dut.mips.dp.rf.ra2);
    $display("\t+regfile -- we3 = %b",dut.mips.dp.rf.we3);
    $display("\t+regfile -- wa3 = %b",dut.mips.dp.rf.wa3);
    $display("\t+regfile -- wd3 = %b",dut.mips.dp.rf.wd3);
    $display("\t+regfile -- rd1 = %b",dut.mips.dp.rf.rd1);
    $display("\t+regfile -- rd2 = %b",dut.mips.dp.rf.rd2);
    $display("\t+RAM[%2d] = %2d",dut.dmem.addr,dut.dmem.readdata);
    $display("writedata\tdataadr\tmemwrite");
  end

  always @(negedge clk, posedge clk) begin
    // check results
    // TODO: You need to update the checks below
    // if (dut.dmem.RAM[84] === 32'h9504)
    //   begin
    //     $display("Successfully wrote 0x%4h at RAM[%3d]",84,32'h9504);
    //     firstTest = 1'b1;
    //   end

    if (dut.dmem.RAM[84] === 16'h96)
      begin
        $display("Successfully wrote 0x%4h at RAM[%3d]",84,16'h0096);
        firstTest = 1'b1;
      end
    if(memwrite) begin
      if(dataadr === 84 & writedata === 16'h96)
      begin
        $display("Successfully wrote 0x%4h at RAM[%3d]",writedata,dataadr);
        firstTest = 1'b1;
      end
    end
    if (firstTest === 1'b1)
    begin
        $display("Program successfully completed");
        $finish;
    end
  end

endmodule

`endif // TB_COMPUTER