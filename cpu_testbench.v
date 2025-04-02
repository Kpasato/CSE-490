`timescale 1ns/1ps
module cpu_testbench;
reg clk;
reg reset;
cpu uut(//instantiate cpu
  .clk(clk),
  .reset(reset));
initial begin//clock generation for toggling
  clk = 0;
  forever #5 clk = ~clk; // toggle every 5 time units
end
initial begin//test sequence
  $display("start cpu simulation");
  reset= 1;
  #10;
  reset=0;
  // live monitoring of key CPU signals
  $monitor("time=%0t | pc=%h | instr=%b | reg_a=%h | reg_b=%h | alu_out=%h", 
           $time, uut.pc_out, uut.instr, uut.reg_a, uut.reg_b, uut.alu_result);
  #200;//running for a few cycles
  $display("simulation done");
  $stop;
end
endmodule
