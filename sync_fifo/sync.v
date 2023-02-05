module fifo #(parameter WIDTH = 8, DEPTH = 8) (
  input  clk,
  input rst,
  input wr_en,
  input wr_data,
  output full,
  output empty,
  input  rd_en,
  output reg rd_data
);
  reg [WIDTH-1:0] mem [0:DEPTH-1];
  reg [3:0] wr_ptr, rd_ptr;

  always @(posedge clk) begin
    if (rst) begin
      wr_ptr <= 0;
      rd_ptr <= 0;
    end else if (wr_en & !full) begin
      mem[wr_ptr] <= wr_data;
      wr_ptr <= wr_ptr + 1;
    end else if (rd_en & !empty) begin
      rd_data <= mem[rd_ptr];
      rd_ptr <= rd_ptr + 1;
    end
  end

  assign full = (wr_ptr == rd_ptr) & (wr_en == 0);
  assign empty = (wr_ptr == rd_ptr) & (rd_en == 0);

endmodule
