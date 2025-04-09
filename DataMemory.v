module DataMemory(
  input clk,
  input mem_read,       // enables reading from memory
  input mem_write,      // enables writing to mem
  input [7:0] address,  // 8-bit address selects mem location
  input [15:0] write_data,  // data written to memory
  output reg [15:0] read_data); // data read from memory
  reg [15:0] memory [0:255];
  // write data to memory on rising clock edge if mem_write is enabled
  always @(posedge clk)begin
    if(mem_write)
      memory[address]<=write_data;
  end
  always @(*) begin
    if(mem_read)
      read_data= memory[address];
    else
      read_data=16'b0; // default to zero if not reading
  end
endmodule
