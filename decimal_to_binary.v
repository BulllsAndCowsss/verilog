module decimal_to_binary(
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
  output wire [3:0] zero_bin,
  output wire [3:0] one_bin,
  output wire [3:0] two_bin,
  output wire [3:0] three_bin,
  output wire [3:0] four_bin,
  output wire [3:0] five_bin,
  output wire [3:0] six_bin,
  output wire [3:0] seven_bin,
  output wire [3:0] eight_bin,
  output wire [3:0] nine_bin
);

  assign zero_bin = zero ? 4'b0000 : 4'bz;
  assign one_bin = one ? 4'b0001 : 4'bz;
  assign two_bin = two ? 4'b0010 : 4'bz;
  assign three_bin = three ? 4'b0011 : 4'bz;
  assign four_bin = four ? 4'b0100 : 4'bz;
  assign five_bin = five ? 4'b0101 : 4'bz;
  assign six_bin = six ? 4'b0110 : 4'bz;
  assign seven_bin = seven ? 4'b0111 : 4'bz;
  assign eight_bin = eight ? 4'b1000 : 4'bz;
  assign nine_bin = nine ? 4'b1001 : 4'bz;

endmodule