//module name and ports declarations
module ProgramCounter (
input wire 			rst,
input wire 			clk,
input wire [31:0]	PC_In,
output reg [31:0] 	PC );

always @(posedge clk , negedge rst)
begin

if (!rst)
 begin
  PC <= 32'b0 ;
 end
else
 begin
  PC <= PC_In;
 end
 
end
endmodule