module SignExtend (
input wire [15:0]    Instr ,
output reg [31:0]    SignImm
);

always @(*)
    begin 
        if (Instr[15]==0)
            begin 
                SignImm={16'h0000,Instr};
            end
        else 
            begin 
                SignImm={16'hffff,Instr};
            end
    end

endmodule 
