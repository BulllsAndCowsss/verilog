module LED(
	Strike,
	Green1,
	Green2,
	Green3,
	Green4,
	Red1,
	Red2,
	Red3,
	Red4
);

input wire [3:0]	Strike;
output wire	Green1;
output wire	Green2;
output wire	Green3;
output wire	Green4;
output wire	Red1;
output wire	Red2;
output wire	Red3;
output wire	Red4;

wire	SYNTHESIZED_WIRE_3;

assign	Green1 = (Strike == 4) ? 1'b1 : 1'b0;
assign	Green2 = (Strike == 4) ? 1'b1 : 1'b0;
assign	Green3 = (Strike == 4) ? 1'b1 : 1'b0;
assign	Green4 = (Strike == 4) ? 1'b1 : 1'b0;
assign	Red1 = SYNTHESIZED_WIRE_3;
assign	Red2 = SYNTHESIZED_WIRE_3;
assign	Red3 = SYNTHESIZED_WIRE_3;
assign	Red4 = SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_3 =  ~(Strike == 4);


endmodule