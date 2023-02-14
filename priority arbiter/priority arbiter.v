module priority_arbiter(
  input logic clk,
  input logic rst_n,
  input logic [3:0] in_request,
  output logic [3:0] out_grant
  );
  
  logic [3:0] grant_next;
  logic [3:0] in_request_mask;
  
  assign in_request_mask = in_request & (-in_request);
  assign grant_next = in_request_mask;
  
  always_ff@(posedge clk, negedge rst_n)
    begin
      if(!rst_n) out_grant <= '0;
      else
        out_grant <= grant_next;
    end
  
endmodule
