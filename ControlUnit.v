module ControlUnit (
  input [3:0] opcode,
  output reg reg_write,
  output reg mem_read,
  output reg mem_write,
  output reg branch,
  output reg [3:0] alu_ctrl,
  output reg alu_src);
always @(*) begin// control signals based on opcode
  reg_write=0;//defaulting vals to 0
  mem_read =0;
  mem_write=0;
  branch= 0;
  alu_ctrl= 4'b0000;
  alu_src=0;
  case(opcode)
    4'b0000: begin//add 
      reg_write= 1;
      alu_ctrl=4'b0000;
    end
    4'b0001: begin // sub 
      reg_write=1;
      alu_ctrl=4'b0001;
    end
    4'b0010: begin//sll
      reg_write=1;
      alu_ctrl=4'b0010;
    end
    4'b0011: begin //and
      reg_write= 1;
      alu_ctrl=4'b0011;
    end
    4'b0100: begin//lw
      reg_write=1;
      mem_read=1;
      alu_src=1;
      alu_ctrl= 4'b0000;
    end
    4'b0101: begin // sw
      mem_write= 1;
      alu_src=1;
      alu_ctrl=4'b0000;
    end
    4'b0110: begin //beq
      branch=1;
      alu_ctrl= 4'b0001;
    end
    default: begin
      reg_write =0;
    end
  endcase
end
endmodule
