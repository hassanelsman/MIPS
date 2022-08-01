//module name and ports declarations
module InstructionMemory (

input wire	[31:0]	Address,
output reg	[31:0]	Instruction 	) ;

//2D array declaration

wire [31:0]	ROM	[99:0]  ; //should it be wire 

initial
	begin
		$readmemh("Program1.txt",ROM);//? how it can synthesis
	end
	
	
always @(*)
begin
 Instruction = ROM[Address >> 2] ;
end

endmodule


