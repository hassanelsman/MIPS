//combinantial 32bit_ALU with no flobs
module ALU_32bit (
input wire [31:0]	SrcA,
input wire [31:0]	SrcB,
input wire 	[2:0]	ALUControl,

output reg [31:0]	ALUResult,
output wire			Zero
);
 
//RTL Code
always @(*)
 begin 
  case(ALUControl)
	3'b000 : begin
			    ALUResult = SrcA & SrcB;
			  end
	3'b001 : begin
			    ALUResult = SrcA | SrcB;
			  end
	3'b010 : begin
			    ALUResult = SrcA + SrcB;
			  end
	3'b011 : begin
				ALUResult = 32'b0;
			  end
	3'b100 : begin
			    ALUResult = SrcA - SrcB;
			  end
	3'b101 : begin
			    ALUResult = SrcA * SrcB;
			  end
	3'b110 : begin
			   if (SrcA < SrcB) begin
				ALUResult = 32'b1  ;
			   end else begin
				ALUResult = 32'b0  ;
			   end
			  end
	3'b111 :  begin
				ALUResult = 32'b0;
			  end
	default : begin
			   ALUResult = 32'b0;
			  end
   endcase
 end

 assign Zero = (~| ALUResult ) ? 1'b1 : 1'b0 ;
 
 endmodule

