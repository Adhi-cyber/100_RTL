module tb_demux;

    // Inputs
    reg Data_in;
    reg [1:0] sel;

    // Outputs
    wire Data_out_0;
    wire Data_out_1;
    wire Data_out_2;
    wire Data_out_3;

    // Instantiate the Unit Under Test (UUT)
    demux1to4 uut (
        .Data_in(Data_in), 
        .sel(sel), 
        .Data_out_0(Data_out_0), 
        .Data_out_1(Data_out_1), 
        .Data_out_2(Data_out_2), 
        .Data_out_3(Data_out_3)
    );

    initial begin
        //Apply Inputs
        Data_in = 1;
        sel = 0;    #100;
        sel = 1;    #100;
        sel = 2;    #100;
        sel = 3;    #100;
        Data_in = 0;
    end
      
endmodule
