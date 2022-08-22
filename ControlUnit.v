module ControlUnit (
input wire [5:0]    Opcode,
input wire [5:0]    Func,

output reg          jump ,
output reg          memtoReg ,
output reg          memWrite ,
output reg          Branch ,
output reg          aluSrc ,
output reg          regDest ,
output reg          regWrite ,
output reg [2:0]    ALUControl
);

reg [1:0]           ALUOp ;

always @(*)
    begin 
        case(Opcode)
        6'b100011:begin
             jump=0 ;
             ALUOp=00 ;
             memWrite=0 ;
             regWrite=1 ; 
             regDest=0 ;
             aluSrc=1 ;
             memtoReg=1 ;
             Branch=0 ;
              end
        6'b101011:begin
             jump=0 ;
             ALUOp=00 ;
             memWrite=1 ;
             regWrite=0 ; 
             regDest=0 ;
             aluSrc=1 ;
             memtoReg=1 ;
             Branch=0 ;
              end
        6'b000000:begin
             jump=0 ;
             ALUOp=10 ;
             memWrite=0 ;
             regWrite=1 ; 
             regDest=1 ;
             aluSrc=0 ;
             memtoReg=0 ;
             Branch=0 ;
              end
        6'b001000:begin
             jump=0 ;
             ALUOp=00 ;
             memWrite=0 ;
             regWrite=1 ; 
             regDest=0 ;
             aluSrc=1 ;
             memtoReg=0 ;
             Branch=0 ;
              end
        6'b000100:begin
             jump=0 ;
             ALUOp=01 ;
             memWrite=0 ;
             regWrite=0 ; 
             regDest=0 ;
             aluSrc=0 ;
             memtoReg=0 ;
             Branch=1 ;
              end
        6'b000010:begin
             jump=1 ;
             ALUOp=00 ;
             memWrite=0 ;
             regWrite=0 ; 
             regDest=0 ;
             aluSrc=0 ;
             memtoReg=0 ;
             Branch=0 ;
              end
        default:begin
             jump=0 ;
             ALUOp=00 ;
             memWrite=0 ;
             regWrite=0 ; 
             regDest=0 ;
             aluSrc=0 ;
             memtoReg=0 ;
             Branch=0 ;
              end
        endcase


        case(ALUOp)
        2'b00:  ALUControl = 3'b010;
        2'b01:  ALUControl = 3'b100;
        2'b10:  case(Func)
                     6'b100000:ALUControl = 3'b010;
                     6'b100010:ALUControl = 3'b100;
                     6'b101010:ALUControl = 3'b110;
                     6'b011100:ALUControl = 3'b101;
                endcase
        default:ALUControl = 3'b010;
        
        endcase
    end
endmodule 
