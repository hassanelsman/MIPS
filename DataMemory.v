module DataMemory (
input wire              clk ,
input wire              rst ,
input wire[31:0]        A ,
input wire[31:0]        WD,
input wire              WE,
output wire [31:0]      RD ,
output wire [15:0]      test_value 
);

//interal signals
reg [31:0] RAM [0:99];
integer i;

//RTL
always @(posedge clk,negedge rst)
    begin 
        if (!rst)
            begin  
                for(i=0;i<100;i=i+1)  
                    RAM[i] <= 32'h0000;  
            end 
        else if (WE)
            RAM[A]<=WD;
    end
        
assign RD =RAM[A];
assign test_value=RAM[0][15:0];

endmodule 