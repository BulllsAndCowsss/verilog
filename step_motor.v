module step_moter(
	clk,
	rst,
	correct,
	stepMoterA,
	stepMoterB,
	stepMoterAAA,
	stepMoterBBB
);


input wire	clk;
input wire	rst;
input wire	correct;
output wire	stepMoterA;
output wire	stepMoterB;
output wire	stepMoterAAA;
output wire	stepMoterBBB;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_21;

assign	SYNTHESIZED_WIRE_0 = 1;


PNU_CLK_DIV	b2v_inst(
	.clk(clk),
	.rst_n(rst),
	.en(SYNTHESIZED_WIRE_0),
	.div_clk(SYNTHESIZED_WIRE_21));
	defparam	b2v_inst.cnt_num = 10000;


mx_2x1	b2v_inst18(
	.s_1(SYNTHESIZED_WIRE_22),
	.sel(correct),
	.s_0(SYNTHESIZED_WIRE_23),
	.m_out(stepMoterA));

assign	SYNTHESIZED_WIRE_7 =  ~SYNTHESIZED_WIRE_24;

assign	SYNTHESIZED_WIRE_8 =  ~SYNTHESIZED_WIRE_25;

assign	SYNTHESIZED_WIRE_10 =  ~SYNTHESIZED_WIRE_25;

assign	SYNTHESIZED_WIRE_12 =  ~SYNTHESIZED_WIRE_24;

assign	SYNTHESIZED_WIRE_23 = SYNTHESIZED_WIRE_7 & SYNTHESIZED_WIRE_8;

assign	SYNTHESIZED_WIRE_27 = SYNTHESIZED_WIRE_24 & SYNTHESIZED_WIRE_10;

assign	SYNTHESIZED_WIRE_26 = SYNTHESIZED_WIRE_25 & SYNTHESIZED_WIRE_12;

assign	SYNTHESIZED_WIRE_22 = SYNTHESIZED_WIRE_25 & SYNTHESIZED_WIRE_24;



mx_2x1	b2v_inst40(
	.s_1(SYNTHESIZED_WIRE_26),
	.sel(correct),
	.s_0(SYNTHESIZED_WIRE_27),
	.m_out(stepMoterB));


mx_2x1	b2v_inst45(
	.s_1(SYNTHESIZED_WIRE_27),
	.sel(correct),
	.s_0(SYNTHESIZED_WIRE_26),
	.m_out(stepMoterAAA));


mx_2x1	b2v_inst46(
	.s_1(SYNTHESIZED_WIRE_23),
	.sel(correct),
	.s_0(SYNTHESIZED_WIRE_22),
	.m_out(stepMoterBBB));


count_4	b2v_inst9(
	.clk(SYNTHESIZED_WIRE_21),
	.rst_n(rst),
	.Q0(SYNTHESIZED_WIRE_24),
	.Q1(SYNTHESIZED_WIRE_25));


endmodule
