module SignExtension(
  input [3:0] imm_in,
  output reg [15:0] imm_out);
always @(*) begin//sign extending 4bit in to 16 out
  imm_out= {{12{imm_in[3]}}, imm_in};
end
endmodule
