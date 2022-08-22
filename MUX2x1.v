module MUX2x1 #(parameter length=32 )(
input wire [length-1:0]     in1,in2,
input wire                  sel,
output wire [length-1:0]    out 
);

assign out=(sel)? in2:in1;

endmodule 