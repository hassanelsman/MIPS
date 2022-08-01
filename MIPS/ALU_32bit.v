//Module name and ports declarations
module ALU_32bit (
input wire [31:0]	A,
input wire [31:0]	B,
input wire 	[2:0]	ALUControl,

output reg [15:0]	ALUResult,
output reg			Zero
/* ,
//input wire			CLK,
output reg			Logic_flag,
output reg			CMP_flag,
output reg			Shift_flag  */);
 
// Internal signals declaration
//reg	[3:0] 	flags;// {3Arith_flag,2Logic_flag,1CMP_flag,0Shift_flag}these signals to avoid latchs
//reg [15:0] ALUResult;

 
//RTL Code
always @(*)
 begin 
  case(ALUControl)
	3'b010 : begin
			   ALUResult = A + B;
			  end
	3'b100 : begin
			   ALUResult = A - B;
			  end
	3'b101 : begin
			   ALUResult = A * B;
			  end
	3'b011 : begin
			   ALUResult = 32'b0;
			  end
	3'b000 : begin
			   ALUResult = A & B;
			  end
	3'b001 : begin
			   ALUResult = A | B;
			  end
	3'b110 :  begin
			   flags = 4'b010;
			   if ((A < B)) //we have to put else as combinational block 
							//so it is not stores the prev. value!
				ALUResult = 32'b1;
			   else
			    ALUResult = 32'b0;			   
			  end
	3'b111 : begin
			   ALUResult = 32'b0;
			  end
/* 	4'b1000 : begin
			   flags = 4'b0100;
			   ALUResult = (A ^ B);
			  end
	4'b1001 : begin
			   flags = 4'b0100;
			   ALUResult = ~(A ^ B);
			  end
	4'b1010 : begin
			   flags = 4'b010;
			   ALUResult = (A == B) ;
			  end
	4'b1011 : begin
			   flags = 4'b010;
			   if ((A > B)) //we have to put else as combinational block 
							//so it is not stores the prev. value!
							// NOTE : if it is display it is prev. value it can display 
							//wrong value so it should force to zero
			    ALUResult = 32'b10;
			   else
			    ALUResult = 32'b0;			   
			  end
	4'b1100 : begin
			   flags = 4'b010;
			   if ((A < B)) //we have to put else as combinational block 
							//so it is not stores the prev. value!
							// NOTE : if it is display it is prev. value it can display 
							//wrong value so it should force to zero
				ALUResult = 32'b11;
			   else
			    ALUResult = 32'b0;			   
			  end
	4'b1101 : begin
			   flags = 4'b0001;
			   ALUResult = A >> 1;
			  end
	4'b1110 : begin
			   flags = 4'b0001;
			   ALUResult = A << 1;
			  end */
	default : begin
			   ALUResult = 32'b0;
			  end
   endcase
 end
 
 assign Zero = (ALUResult == 32'b0) ? 1'b1 : 1'b1 ;
 
/* //other always block to avoid changing the flags if the FUN i/p changed while the cycle 
//as it still doing the prev. operation.
//also important to avoid latching
always @(posedge CLK)
begin
 ALU_OUT <= ALUResult ;
 Arith_flag <= flags[3] ;
 Logic_flag <= flags[2] ;
 CMP_flag   <= flags[1] ;
 Shift_flag <= flags[0] ;
end
 */

endmodule

