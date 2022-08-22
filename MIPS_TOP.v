module MIPS_TOP (
input  wire             CLK,RST ,
output wire [15:0]      test_value
);

// internal signals
wire [31:0]         PC , PC_In;
wire [31:0]         Instr;
wire [2:0]          ALUControl;
wire                jump      ,
                    memtoReg  ,
                    memWrite  ,
                    Branch    ,
                    aluSrc    ,
                    regDest   ,
                    regWrite  ;

wire [4:0]          write_reg;
wire [31:0]         Result;
wire                WE;
wire [31:0]         srcA , 
                    RD2 ;

wire                sel;
wire [31:0]         SignImm;
wire [27:0]         shift_out;

wire [31:0]         mux2_in,
                    pcbranch;

wire [31:0]         PCplus4;
wire                zero ;
wire [31:0]         shift_out2;

wire [31:0]         srcB;

wire [31:0]         AluResult ;
wire[31:0]          read_data;


//instantiation

ProgramCounter U0_ProgramCounter (
.clk(CLK),
.rst(RST),
.PC_In(PC_In),
.PC(PC)
);


InstructionMemory U0_InstructionMemory (
.PC(PC),
.Instr(Instr)
);

ControlUnit U0_ControlUnit (
.Opcode(Instr[31:26]),
.Func(Instr[5:0]),
.jump(jump),
.memtoReg(memtoReg) ,
.memWrite(memWrite) ,
.Branch(Branch) ,
.aluSrc(aluSrc) ,
.regDest(regDest) ,
.regWrite(regWrite),
.ALUControl(ALUControl)
);


RegisterFile U0_RegisterFile (
.clk(CLK),
.rst(RST) ,
.A1(Instr[25:21]),
.A2(Instr[20:16]),
.A3(write_reg),
.WD3(Result),
.WE3(regWrite),
.RD1(srcA),
.RD2(RD2)
);


MUX2x1 #(.length(5)) U0_MUX2x1 (
.in1(Instr[20:16]), 
.in2(Instr[15:11]),
.sel(regDest),
.out(write_reg) 
);

SignExtend U0_SignExtend (
.Instr(Instr[15:0]),
.SignImm(SignImm)
);

ShiftLeftTwice #(.length(28)) U0_ShiftLeftTwice (
.in({2'b00,Instr[25:0]}),
.out(shift_out)
);

ShiftLeftTwice #(.length(32))U1_ShiftLeftTwice (
.in(SignImm),
.out(shift_out2)
);

MUX2x1 #(.length(32)) U1_MUX2x1(
.in1(PCplus4),
.in2(pcbranch),
.sel(pcscr),
.out(mux2_in)
);

MUX2x1 #(.length(32)) U2_MUX2x1(
.in2({PCplus4[31:28],shift_out}),
.in1(mux2_in),
.sel(jump),
.out(PC_In)
);

And_G U0_And_G (
.and_in1(Branch),
.and_in2(zero),
.and_out(pcscr)
);

Adder U0_Adder (
.A(shift_out2),
.B(PCplus4),
.C(pcbranch)
);

Adder U1_Adder (
.A(PC),
.B(32'b100),
.C(PCplus4)
);


MUX2x1 #(.length(32)) U3_MUX2x1(
.in1(RD2),
.in2(SignImm),
.sel(aluSrc),
.out(srcB)
);

ALU_32bit U0_ALU_32bit (
.SrcA(srcA),
.SrcB(srcB),
.ALUResult(AluResult) ,
.ALUControl(ALUControl),
.Zero(zero)
);

DataMemory U0_DataMemory (
.A(AluResult) ,
.WD(RD2),
.clk(CLK) ,
.WE(memWrite),
.rst(RST),
.RD(read_data) ,
.test_value(test_value) 
);

MUX2x1 #(.length(32)) U4_MUX2x1(
.in1(AluResult),
.in2(read_data),
.sel(memtoReg),
.out(Result)
);

endmodule 