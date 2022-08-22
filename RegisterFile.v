module RegisterFile (

input wire		    	clk,
input wire		    	rst,
input wire	[4:0] 	A1,
input wire	[4:0]	  A2,
input wire	[4:0]   A3,
input wire		    	WE3,
input wire	[31:0]	WD3,
output wire	[31:0]	RD1,RD2 	) ;

//2D array declaration
reg [31:0]	RegFile	[0:99]  ;
integer i ;

//writing WD3 sequentially in A3 
always @(posedge clk , negedge rst)
begin
 if (!rst)
  begin
   for (i = 0 ; i <= 32'd99 ; i=i+1)
    RegFile [i] <= 32'b0 ;
  end
 else if (WE3)//assume writing has priorty 
    begin
	 RegFile [A3] <= WD3 ;
	end
end

// reading asyncrounsly
 assign RD1 =  RegFile [A1] ;
 assign RD2 =  RegFile [A2] ;

endmodule
