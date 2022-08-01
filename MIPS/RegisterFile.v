//module name and ports declarations
module RegisterFile (

input wire	[15:0]	WrData,
input wire	[2:0]	Address,
input wire			WrEn,
input wire			RdEn,
input wire			CLK,
input wire			RST,
output reg	[15:0]	RdData 	) ;

//2D array declaration

reg [15:0]	RegFile	[7:0]  ;


always @(posedge CLK , negedge RST)
begin
 if (!RST)
  begin
   for (i = 0 ; i <= 32'd31 ; i=i+1)
    RegFile [i] <= 32'b0 ;

  end
  
 else
 
  begin
   if (WrEn)//assume writing has priorty 
    begin
	 RegFile [Address] <= WrData ;
	 RdData <= 16'b0 ; //to avide latching 2 - 2x1 MUXs  NOTE important as it is a sequential block
	end
   else if (RdEn && WrEn == 1'b0)
    begin
     RdData <= RegFile [Address] ;
	end
  end


end


endmodule
