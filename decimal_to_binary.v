module decimal_to_binary(
input wire CLK,
input wire rst_n,
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
output reg [3:0] binary
);

always @(*) begin
    binary = 4'b0000;
    if (zero) binary = 4'b0000;
    else if (one) binary = 4'b0001;
    else if (two) binary = 4'b0010;
    else if (three) binary = 4'b0011;
    else if (four) binary = 4'b0100;
    else if (five) binary = 4'b0101;
    else if (six) binary = 4'b0110;
    else if (seven) binary = 4'b0111;
    else if (eight) binary = 4'b1000;
    else if (nine) binary = 4'b1001;
end

endmodule
