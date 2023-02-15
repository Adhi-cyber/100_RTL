module LFSR8_8E(reset_, clock, q, lfsr_to);
  input clock, reset_;
  output [63:0] q;
  output lfsr_to;
  
  reg [63:0] LFSR;
  wire  lfsr_to;
    
  assign lfsr_to = (LFSR == 64'h9C69832196724182);

  always @(posedge clock or negedge reset_)
    begin
      if (!reset_) 
        LFSR[63:0] <= 64'hffff_ffff_ffff_ffff;
      else if (lfsr_to) 
        LFSR[63:0] <= 64'hffff_ffff_ffff_ffff;
      else
      begin
        LFSR[63:0] <= {(LFSR[62]^LFSR[61]),
                       (LFSR[61]^LFSR[60]),
                       (LFSR[60]^LFSR[59]),
                       (LFSR[59]^LFSR[58]),
                       LFSR[58:0],
                       LFSR[63]};
      end
    end
  assign q = LFSR;
endmodule
