module cpu(
  input clk,
  input reset);
// pc stuff
wire[15:0] pc_out;
wire [15:0] pc_next;
wire jump = 0; // jump not used rn
wire[15:0] instr;//instruction fetching
// break up instruction fields
wire[3:0] opcode =instr[15:12];
wire[3:0] rs=instr[11:8];
wire[3:0] rt=instr[7:4];
wire [3:0] rd_or_imm=instr[3:0]; //might be dest reg or imm depending on op
wire reg_we;//control wires
wire mem_rd;
wire mem_wr;
wire do_branch;
wire alu_input_sel;
wire[3:0] alu_op;
wire[15:0] reg_a, reg_b;//reg file wires
wire[15:0] write_data;
wire[15:0] imm_ext;//immediate
wire[15:0] alu_b;//alu
wire[15:0] alu_result;
//memory
wire [15:0] mem_out;
assign pc_next =pc_out +16'd2;//pc update 
program_counter pc_inst(//connecting the components
  .clk(clk),
  .reset(reset),
  .jump_to(jump),
  .cin(pc_next),
  .cout(pc_out));
InstructionMemory im(
  .address(pc_out[7:0]),
  .instruction(instr));
RegisterFile regs(
  .clk(clk),
  .wr_en(reg_we),
  .rd1_sel(rs),
  .rd2_sel(rt),
  .wr_sel(rd_or_imm),
  .wr_data(write_data),
  .rd1_data(reg_a),
  .rd2_data(reg_b));
SignExtension ext(
  .imm_in(rd_or_imm),
  .imm_out(imm_ext));
MUX alu_mux(
  .in0(reg_b),
  .in1(imm_ext),
  .sel(alu_input_sel),
  .out(alu_b));
ALU core(
  .a(reg_a),
  .b(alu_b),
  .ctrl(alu_op),
  .out(alu_result));
DataMemory mem(
  .clk(clk),
  .mem_read(mem_rd),
  .mem_write(mem_wr),
  .address(alu_result[7:0]),
  .write_data(reg_b),
  .read_data(mem_out));
MUX wb_mux(
  .in0(alu_result),
  .in1(mem_out),
  .sel(mem_rd),
  .out(write_data));
ControlUnit cu(
  .opcode(opcode),
  .reg_write(reg_we),
  .mem_read(mem_rd),
  .mem_write(mem_wr),
  .branch(do_branch),
  .alu_ctrl(alu_op),
  .alu_src(alu_input_sel));
endmodule
