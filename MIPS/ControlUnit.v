module ControlUnit (
input wire [5:0] opcode,func ,
output reg jump ,
output reg memtoreg ,memwrite ,branch ,alusrc ,regdest ,regwrite,
output reg [2:0] alucontrol
);
reg [1:0] aluop;

always @(*)
    begin 
        case(opcode)
        6'b100011:begin jump=0 ;aluop=00 ;memwrite=0 ;regwrite=1 ; regdest=0 ;alusrc=1 ;memtoreg=1 ;branch=0 ; end
        6'b101011:begin jump=0 ;aluop=00 ;memwrite=1 ;regwrite=0 ; regdest=0 ;alusrc=1 ;memtoreg=1 ;branch=0 ; end
        6'b000000:begin jump=0 ;aluop=10 ;memwrite=0 ;regwrite=1 ; regdest=1 ;alusrc=0 ;memtoreg=0 ;branch=0 ; end
        6'b001000:begin jump=0 ;aluop=00 ;memwrite=0 ;regwrite=1 ; regdest=0 ;alusrc=1 ;memtoreg=0 ;branch=0 ; end
        6'b000100:begin jump=0 ;aluop=01 ;memwrite=0 ;regwrite=0 ; regdest=0 ;alusrc=0 ;memtoreg=0 ;branch=1 ; end
        6'b000100:begin jump=1 ;aluop=00 ;memwrite=0 ;regwrite=0 ; regdest=0 ;alusrc=0 ;memtoreg=0 ;branch=0 ; end
        default:  begin jump=0 ;aluop=00 ;memwrite=0 ;regwrite=0 ; regdest=0 ;alusrc=0 ;memtoreg=0 ;branch=0 ; end
        
        endcase


        case(aluop)
        2'b00:alucontrol=3'b010;
        2'b01:alucontrol=3'b110;
        2'b10:case(func)
              6'b100000:alucontrol=3'b010;
              6'b100010:alucontrol=3'b100;
              6'b101010:alucontrol=3'b110;
              6'b011100:alucontrol=3'b101; endcase

        default:alucontrol=3'b010;
        
        endcase
    end
endmodule 
