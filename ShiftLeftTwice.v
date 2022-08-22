module ShiftLeftTwice #(parameter length=32 )(
input    [length-1:0]   in,
output   [length-1:0]   out
);

assign out = in<<2 ;

endmodule