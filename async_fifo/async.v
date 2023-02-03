module async_fifo #(parameter WIDTH = 8, DEPTH = 8) (
  input wire wr_en,
  input wire [WIDTH-1:0] wr_data,
  output wire full,
  output wire empty,
  input wire rd_en,
  output wire [WIDTH-1:0] rd_data
);
  reg [WIDTH-1:0] mem [0:DEPTH-1];
  reg [3:0] wr_ptr, rd_ptr;
  wire wr_rst, rd_rst;

  assign wr_rst = (wr_ptr == DEPTH-1) & wr_en;
  assign rd_rst = (rd_ptr == DEPTH-1) & rd_en;

  always @(wr_en or wr_rst) begin
    if (wr_rst) begin
      wr_ptr <= 0;
    end else if (wr_en) begin
      mem[wr_ptr] <= wr_data;
      wr_ptr <= wr_ptr + 1;
    end
  end

  always @(rd_en or rd_rst) begin
    if (rd_rst) begin
      rd_ptr <= 0;
    end else if (rd_en) begin
      rd_data <= mem[rd_ptr];
      rd_ptr <= rd_ptr + 1;
    end
  end

  assign full = (wr_ptr == rd_ptr+1);
  assign empty = (wr_ptr == rd_ptr);

endmodule
