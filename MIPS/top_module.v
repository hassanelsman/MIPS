module top_module (
input clk,reset ,
output wire [15:0] test_value
);

wire [31:0] pc,pc_in;
pc prog_coun (
.clk(clk),
.reset(reset),
.pc(pc),
.pc_in(pc_in)
);

wire [31:0] instr;
instr_mem instr_memory (
.pc(pc),
.instr(instr)
);

wire [2:0] alucontrol;
wire jump,memtoreg ,memwrite ,branch ,alusrc ,regdest ,regwrite;
ControlUnit control_unit (
.opcode(instr[31:26]),
.func(instr[5:0]),
.jump(jump),
.memtoreg(memtoreg) ,
.memwrite(memwrite) ,
.branch(branch) ,
.alusrc(alusrc) ,
.regdest(regdest) ,
.regwrite(regwrite),
.alucontrol(alucontrol)
);

wire [4:0] write_reg;
wire [31:0] result;
wire write_enable;
wire [31:0] srcA,read_data2;
reg_file regster_file (
.a1(instr[25:21]),
.a2(instr[20:16]),
.a3(write_reg),
.write_data(result),
.clk(clk),
.reset(reset) ,
.write_enable(write_enable),
.read_data1(srcA),
.read_data2(read_data2)
);


wire sel;
mux #(.length(5)) mux1 (

.in1(instr[20:16]),
.in2(instr[15:11]),
.sel(regdest),
.out(write_reg) 
);

wire [31:0] signlmm;
signextend sign_ex (
.instr(instr[15:0]),
.signlmm(signlmm)
);

wire [27:0] shift_out;
shift2 #(.length(26))shifter1 (
.in(instr[25:0]),
.out(shift_out)
);

wire [31:0] mux3_in,mux2_in,pcbranch;
mux #(.length(32)) mux3(
.in1(mux3_in),
.in2(pcbranch),
.sel(pcscr),
.out(mux2_in)
);

mux #(.length(32)) mux2(
.in2({mux3_in[31:28],shift_out}),
.in1(mux2_in),
.sel(jump),
.out(pc_in)
);

wire zero ;
and_gate and_g (
.and_in1(branch),
.and_in2(zero),
.and_out(pcscr)
);

wire [31:0] shift_out2;
shift #(.length(32))shifter2 (
.in(signlmm),
.out(shift_out2)
);


adder adder1 (
.a(shift_out2),
.b(mux3_in),
.c(pcbranch)
);

adder adder2 (
.a(mux3_in),
.b(3'b100),
.c(pcbranch)
);


wire [31:0] srcB;
mux #(.length(32)) mux4(
.in1(read_data2),
.in2(signlmm),
.sel(alusrc),
.out(srcB)
);

wire [31:0] AluResult ;
alu alu_ (
.srcA(srcA),
.srcB(srcB),
.AluResult(AluResult) ,
.sel(alucontrol),
.reset(reset), 
.zero(zero)
);

wire[31:0] read_data;
data_mem data_memory (
.add(AluResult) ,
.write_data(read_data2),
.clk(clk) ,
.write_enable(memwrite),
.reset(reset),
.read_data(read_data) ,
.test_value(test_value) 
);

mux #(.length(32)) mux5(
.in1(AluResult),
.in2(read_data),
.sel(memtoreg),
.out(result)
);
endmodule 