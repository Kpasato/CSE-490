module ALU(
  input [15:0] a,
  input [15:0] b,
  input [3:0] ctrl,
  output reg [15:0] out);
always @(*) begin
  case(ctrl)
    4'b0000: out= a + b; // add
    4'b0001: out= a - b; // sub
    4'b0010: out= a << b[3:0]; // sll
    4'b0011: out= a & b; // and
    default: out= 16'b0;
  endcase
end
endmodule
