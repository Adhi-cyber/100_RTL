module seq_101(clk, rst, seqin, dout);

input clk;
input rst;
input seqin;

output reg dout;

parameter [1:0] s0 = 2'b00;
parameter [1:0] s1 = 2'b01;
parameter [1:0] s2 = 2'b10;


reg [1:0] pst_st;
reg [1:0] nst_st;

always@ (posedge clk)
begin
	if(rst) begin
		dout = 1'b0;
		pst_st = s0;
		nst_st = s0;
	end
	else begin
		pst_st = nst_st;
		case(pst_st)

		s0 :begin if(seqin) begin
			dout = 1'b0;
			nst_st = s1;
		         end
		     else begin
	     		dout = 1'b0;
			nst_st = s0;
		          end
		end
		
		s1 :begin if(~seqin)begin
			dout = 1'b0;
			nst_st = s2;
	                 end 
		     else begin
			dout = 1'b0;
			nst_st = s1;
	               	 end
		end

		s2 :begin if(seqin)begin
			dout = 1'b1;
			nst_st = s1;
		         end
		    else begin
			dout = 1'b0;
			nst_st = s0;
		          end
		end

		endcase
	
	end
end
endmodule

			
