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
);

  parameter  [15:0] answer = 16'h1234;
  wire [3:0] strike;  // strike
  wire [3:0] ball;    // ball

  wire [3:0] one_bin, two_bin, three_bin, four_bin, five_bin, six_bin, seven_bin, eight_bin, nine_bin, zero_bin;

  decimal_to_binary decimal_to_binary_inst(
  .zero(zero), .one(one), .two(two), .three(three), .four(four),
  .five(five), .six(six), .seven(seven), .eight(eight), .nine(nine),
  .zero_bin(zero_bin), .one_bin(one_bin), .two_bin(two_bin), .three_bin(three_bin),
  .four_bin(four_bin), .five_bin(five_bin), .six_bin(six_bin), .seven_bin(seven_bin), 
  .eight_bin(eight_bin), .nine_bin(nine_bin)
);

  wire [39:0] guess = {one_bin, two_bin, three_bin, four_bin, five_bin, six_bin, seven_bin, eight_bin, nine_bin, zero_bin};
  
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