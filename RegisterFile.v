module RegisterFile(
  input clk,
  input wr_en,
  input [3:0] rd1_sel,
  input [3:0] rd2_sel,
  input [3:0] wr_sel,
  input [15:0] wr_data,
  output reg [15:0] rd1_data,
  output reg [15:0] rd2_data);
reg [15:0] regs[0:15];
always @(posedge clk) begin
  if (wr_en)
    regs[wr_sel] <= wr_data;
end
always @(*) begin
  rd1_data = regs[rd1_sel];
  rd2_data = regs[rd2_sel];
end
endmodule
