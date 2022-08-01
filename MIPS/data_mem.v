module data_mem (
input [31:0] add ,write_data,
input clk ,write_enable,reset,
output [31:0] read_data ,
output [15:0] test_value 
);
integer i;
reg [31:0] mem [0:99];

always @(posedge clk,negedge reset)
    begin 
        if (!reset)
            begin  
                for(i=0;i<100;i=i+1)  
                    mem[i] <= 32'h0000;  
            end 
        else if (write_enable)
            mem[add]<=write_data;
    end
        
assign read_data =mem[add];
assign test_value=mem[32'h00000000];
endmodule 