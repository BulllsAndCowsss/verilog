module top_level(
  input wire one,
  input wire two,
  input wire three,
  input wire four,
  input wire five,
  input wire six,
  input wire seven,
  input wire eight,
  input wire nine,
  input wire zero,
  input wire clk,
  input wire rst,
  
  output wire Green1,
  output wire Green2,
  output wire Green3,
  output wire Green4,
  output wire Red1,
  output wire Red2,
  output wire Red3,
  output wire Red4,

  // input wire [15:0] answer, 
  output wire lcd_e, lcd_rs, lcd_rw,
  output wire [7:0] lcd_data
//   output wire	[3:0] Output1,
// output wire	[3:0] Output2
);

  parameter  [15:0] answer = 16'h1234;
  wire [3:0] strike;  // strike
  wire [3:0] ball;    // ball

wire zero_to_nine;

assign zero_to_nine = zero | one | two | three | four | five | six | seven | eight | nine;

wire	[3:0] reg1;
wire	[3:0] reg2;
wire	[3:0] reg3;
wire	[3:0] reg4;

wire	[3:0] Din;
d2b	b2v_inst6(
	.d0(zero),
	.d1(one),
	.d2(two),
	.d3(three),
	.d4(four),
	.d5(five),
	.d6(six),
	.d7(seven),
	.d8(eight),
	.d9(nine),
	.b0(Din[0]),
	.b1(Din[1]),
	.b2(Din[2]),
	.b3(Din[3]));

// trigger
wire trigger_signal;
trigger	b2v_inst2(
	.Din(zero_to_nine),
	.CLK(clk),
	.rst_n(~rst),
	.Dout(trigger_signal));

four_bit_register	b2v_inst(
	.Ce(trigger_signal),
	.CLK(clk),
	.RST_N(~rst),
	.Din(Din),
	.Dout(reg1));

four_bit_register	b2v_inst4123(
	.Ce(trigger_signal),
	.CLK(clk),
	.RST_N(~rst),
	.Din(reg1),
	.Dout(reg2));

four_bit_register	b2v_inst424(
	.Ce(trigger_signal),
	.CLK(clk),
	.RST_N(~rst),
	.Din(reg2),
	.Dout(reg3));

four_bit_register	b2v_inst554(
	.Ce(trigger_signal),
	.CLK(clk),
	.RST_N(~rst),
	.Din(reg3),
	.Dout(reg4));

  wire [15:0] guess = {reg4, reg3, reg2, reg1};
  
  wire [7:0] lcd_data_internal;

  textlcd_submodule lcd_inst (
  .rst(rst),
  .clk(clk),
  .strike(strike),
  .ball(ball),
  .lcd_e(lcd_e),
  .lcd_rs(lcd_rs),
  .lcd_rw(lcd_rw),
  .lcd_data_external(lcd_data_internal)
);

  BullsAndCows game_logic(
    .guess(guess),   
    .answer(answer), 
    .strike(strike), 
    .ball(ball),      
    .lcd_data_external(lcd_data_internal)
  );
//  assign lcd_data = {strike, ball};

assign lcd_data = lcd_data_internal;

LED led_instance (
    .Strike(strike), 
    .Green1(Green1), 
    .Green2(Green2),
    .Green3(Green3),
    .Green4(Green4),
    .Red1(Red1),
    .Red2(Red2),
    .Red3(Red3),
    .Red4(Red4)
  );

endmodule