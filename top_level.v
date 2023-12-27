module top_level(
  input wire clk,
  input wire zero,
  input wire rst,
  input wire one,
  input wire two,
  input wire three,
  input wire four,
  input wire five,
  input wire six,
  input wire seven,
  input wire eight,
  input wire nine,
   input wire [15:0] answer, 
  
  output wire Green1,
  output wire Green2,
  output wire Green3,
  output wire Green4,
  output wire Red1,
  output wire Red2,
  output wire Red3,
  output wire Red4,
  
  output wire lcd_e, lcd_rs, lcd_rw,
  output wire [7:0] lcd_data,

  output reg checkEn,
  output wire piezo,
  output reg correct,

  output wire stepMoterA,
  output wire stepMoterB,
  output wire stepMoterAAA,
  output wire stepMoterBBB,
  
  output reg triggerState
);

//parameter  [15:0] answer = 16'h1234;
wire [3:0] strike;  // strike
wire [3:0] ball;    // ball
wire isFourStrike;

reg [15:0] out; // Change to 16-bit output
reg checkEnable;

wire button_pressed;
assign button_pressed = zero | one | two | three | four | five | six | seven | eight | nine;

wire [3:0] out_wire1, out_wire2, out_wire3, out_wire4;

wire [3:0] bin_out;
decimal_to_binary u11 (
        .CLK(clk), 
        .rst_n(rst), 
        .zero(zero), 
        .one(one), 
        .two(two), 
        .three(three), 
        .four(four), 
        .five(five), 
        .six(six), 
        .seven(seven), 
        .eight(eight), 
        .nine(nine), 
        .binary(bin_out)
    );

// trigger
wire trigger_out;
trigger T11 (
        .CLK(clk),
        .Din(button_pressed),
        .rst_n(rst),
        .Dout(trigger_out)
    );

FourInputConv u21 (
        .in(bin_out), 
        .clk(clk), 
        .rst_n(rst), 
        .ce(trigger_out), // Connect trigger_out signal
        .out1(out_wire1), 
        .out2(out_wire2), 
        .out3(out_wire3), 
        .out4(out_wire4)
    ); 

    always @(posedge clk or negedge rst) begin
        correct <= isFourStrike;
        if (~rst) begin
            out <= 16'd0;
            checkEnable <= 1'b0;
        end else begin
            out <= {out_wire1, out_wire2, out_wire3, out_wire4};
            // If any of the out_wire[i] signals is 1111, set checkEnable to 1.
            if (out_wire1 != 4'b1111 && out_wire2 != 4'b1111 && out_wire3 != 4'b1111 && out_wire4 != 4'b1111)
                checkEnable <= 1'b1;
            else
                checkEnable <= 1'b0;
        end
        checkEn <= checkEnable  ;
        triggerState <= trigger_out ;
    end

  
  wire [7:0] lcd_data_internal;

  textlcd_submodule lcd_inst (
  .rst(~rst),
  .clk(clk),
  .strike(strike),
  .ball(ball),
  .lcd_e(lcd_e),
  .lcd_rs(lcd_rs),
  .lcd_rw(lcd_rw),
  .lcd_data_external(lcd_data_internal)
);

  BullsAndCows game_logic(
    .guess(out),   
    .answer(answer),
    .isFourStrike(isFourStrike),
    .checkEnable(checkEnable),
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

// piezo
wire zero_div_clk, one_div_clk, two_div_clk, three_div_clk, four_div_clk, five_div_clk, six_div_clk, seven_div_clk, eight_div_clk, nine_div_clk;
assign   piezo = zero_div_clk | one_div_clk | two_div_clk | three_div_clk | four_div_clk | five_div_clk | six_div_clk | seven_div_clk | eight_div_clk | nine_div_clk;

PNU_CLK_DIV   b2v_inst4(
   .clk(clk),
   .rst_n(rst),
   .en(zero),
   .div_clk(zero_div_clk));
   defparam   b2v_inst4.cnt_num = 1516;

  PNU_CLK_DIV   b2v_inst5(
   .clk(clk),
   .rst_n(rst),
   .en(one),
   .div_clk(one_div_clk));
   defparam   b2v_inst5.cnt_num = 3822;

  PNU_CLK_DIV   b2v_inst6(
   .clk(clk),
   .rst_n(rst),
   .en(two),
   .div_clk(two_div_clk));
   defparam   b2v_inst6.cnt_num = 3405;

PNU_CLK_DIV   b2v_inst7(
   .clk(clk),
   .rst_n(rst),
   .en(three),
   .div_clk(three_div_clk));
   defparam   b2v_inst7.cnt_num = 3033;

PNU_CLK_DIV   b2v_inst8(
   .clk(clk),
   .rst_n(rst),
   .en(four),
   .div_clk(four_div_clk));
   defparam   b2v_inst8.cnt_num = 2863;

PNU_CLK_DIV   b2v_inst313(
   .clk(clk),
   .rst_n(rst),
   .en(five),
   .div_clk(five_div_clk));
   defparam   b2v_inst313.cnt_num = 2552;

  PNU_CLK_DIV   b2v_inst10(
   .clk(clk),
   .rst_n(rst),
   .en(six),
   .div_clk(six_div_clk));
   defparam   b2v_inst10.cnt_num = 2272;

PNU_CLK_DIV   b2v_inst11(
   .clk(clk),
   .rst_n(rst),
   .en(seven),
   .div_clk(seven_div_clk));
   defparam   b2v_inst11.cnt_num = 2024;

PNU_CLK_DIV   b2v_inst12(
   .clk(clk),
   .rst_n(rst),
   .en(eight),
   .div_clk(eight_div_clk));
   defparam   b2v_inst12.cnt_num = 1911;

PNU_CLK_DIV   b2v_inst13(
   .clk(clk),
   .rst_n(rst),
   .en(nine),
   .div_clk(nine_div_clk));
   defparam   b2v_inst13.cnt_num = 1702;

// stepmotor
step_moter	b2v_inst40(
	.clk(clk),
	.rst(rst),
	.correct(correct),
	.stepMoterA(stepMoterA),
	.stepMoterB(stepMoterB),
	.stepMoterAAA(stepMoterAAA),
	.stepMoterBBB(stepMoterBBB));

endmodule
