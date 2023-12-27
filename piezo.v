module Piezo(
	input wire clk,
  input wire rst,
	input wire zero,
	input wire one,
	input wire two,
	input wire three,
	input wire four,
	input wire five,
	input wire six,
	input wire seven,
	input wire eight,
	input wire nine,
	output wire piezo
);


wire zero_div_clk, one_div_clk, two_div_clk, three_div_clk, four_div_clk, five_div_clk, six_div_clk, seven_div_clk, eight_div_clk, nine_div_clk;
assign	piezo = zero_div_clk | one_div_clk | two_div_clk | three_div_clk | four_div_clk | five_div_clk | six_div_clk | seven_div_clk | eight_div_clk | nine_div_clk;

PNU_CLK_DIV	b2v_inst4(
	.clk(clk),
	.rst_n(rst),
	.en(zero),
	.div_clk(zero_div_clk));
	defparam	b2v_inst4.cnt_num = 1516;

  PNU_CLK_DIV	b2v_inst5(
	.clk(clk),
	.rst_n(rst),
	.en(one),
	.div_clk(one_div_clk));
	defparam	b2v_inst5.cnt_num = 3822;

  PNU_CLK_DIV	b2v_inst6(
	.clk(clk),
	.rst_n(rst),
	.en(two),
	.div_clk(two_div_clk));
	defparam	b2v_inst6.cnt_num = 3405;

PNU_CLK_DIV	b2v_inst7(
	.clk(clk),
	.rst_n(rst),
	.en(three),
	.div_clk(three_div_clk));
	defparam	b2v_inst7.cnt_num = 3033;

PNU_CLK_DIV	b2v_inst8(
	.clk(clk),
	.rst_n(rst),
	.en(four),
	.div_clk(four_div_clk));
	defparam	b2v_inst8.cnt_num = 2863;

PNU_CLK_DIV	b2v_inst313(
	.clk(clk),
	.rst_n(rst),
	.en(five),
	.div_clk(five_div_clk));
	defparam	b2v_inst313.cnt_num = 2552;

  PNU_CLK_DIV	b2v_inst10(
	.clk(clk),
	.rst_n(rst),
	.en(six),
	.div_clk(six_div_clk));
	defparam	b2v_inst10.cnt_num = 2272;

PNU_CLK_DIV	b2v_inst11(
	.clk(clk),
	.rst_n(rst),
	.en(seven),
	.div_clk(seven_div_clk));
	defparam	b2v_inst11.cnt_num = 2024;

PNU_CLK_DIV	b2v_inst12(
	.clk(clk),
	.rst_n(rst),
	.en(eight),
	.div_clk(eight_div_clk));
	defparam	b2v_inst12.cnt_num = 1911;

PNU_CLK_DIV	b2v_inst13(
	.clk(clk),
	.rst_n(rst),
	.en(nine),
	.div_clk(nine_div_clk));
	defparam	b2v_inst13.cnt_num = 1702;

endmodule