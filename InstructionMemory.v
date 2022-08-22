module InstructionMemory (

input wire	[31:0]	PC,
output wire	[31:0]	Instr	) ;

//2D array declaration
reg 	[31:0] ROM [0:99]  ; //should it be wire 

initial
	begin
		$readmemh("Program2.txt",ROM);//? how it can synthesis	-it is not synthesisable but work well in FPGA 
	end
// what is >> 2 refer ?
	
	assign Instr = ROM[PC>>2];	

endmodule


