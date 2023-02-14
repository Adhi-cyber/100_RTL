module priorityencoder_tb;
  reg [7:0]i;
  reg en;
  wire [2:0]y;
   priorityencoder dut(en,i,y);
  initial
    begin
      $dumpfile("pen.vcd");
      $dumpvars(0,priorityencoder_tb);
    end
  initial
    begin
       $monitor("en=%b i=%b y=%b",en,i,y);
      en=0; i[7]=1;i[6]=1;i[5]=1;i[4]=1;i[3]=1;i[2]=1;i[1]=1;i[0]=1;
      #5en=1; i[7]=0;i[6]=1;i[5]=1;i[4]=1;i[3]=1;i[2]=1;i[1]=1;i[0]=1;
      #5en=1; i[7]=1;i[6]=1;i[5]=1;i[4]=1;i[3]=1;i[2]=1;i[1]=1;i[0]=1;
      #5$finish;
    end
endmodule
