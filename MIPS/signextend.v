module signextend (

input wire [15:0] instr ,
output reg [31:0] signlmm

);

always @(*)
    begin 
        if (instr[15]==0)
            begin 
                signlmm={16'h0000,instr};
            end
        else 
            begin 
                signlmm={16'hffff,instr};
            end

    end

endmodule 
