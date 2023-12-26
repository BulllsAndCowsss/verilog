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

  reg [15:0] out; // Change to 16-bit output
  reg checkEnable;

wire button_pressed;

assign button_pressed = zero | one | two | three | four | five | six | seven | eight | nine;

wire [3:0] out_wire1, out_wire2, out_wire3, out_wire4;

wire [3:0] bin_out;
decimal_to_binary u1 (
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
trigger T1 (
        .CLK(clk),
        .Din(button_pressed),
        .rst_n(rst),
        .Dout(trigger_out)
    );

FourInputConv u2 (
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
        checkEnable <= 1'b0;
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

endmodule