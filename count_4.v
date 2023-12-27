module count_4(
	clk,
	rst_n,
	Q0,
	Q1
);

input wire	clk;
input wire	rst_n;
output wire	Q0;
output wire	Q1;

reg	[0:0] result;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
reg	DFF_inst;

assign	Q1 = DFF_inst;

always@(posedge clk or negedge rst_n)
begin
if (!rst_n)
	begin
	DFF_inst <= 0;
	end
else
	begin
	DFF_inst <= SYNTHESIZED_WIRE_0;
	end
end

always@(posedge clk or negedge rst_n)
begin
if (!rst_n)
	begin
	result[0] <= 0;
	end
else
	begin
	result[0] <= SYNTHESIZED_WIRE_1;
	end
end

assign	SYNTHESIZED_WIRE_1 =  ~result;

assign	SYNTHESIZED_WIRE_0 = result ^ DFF_inst;

assign	Q0 = result;

endmodule
