// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Tue Nov 02 20:09:21 2021"

module four_bit_register(
	Ce,
	CLK,
	RST_N,
	Din,
	Dout
);


input wire	Ce;
input wire	CLK;
input wire	RST_N;
input wire	[3:0] Din;
output wire	[3:0] Dout;

reg	[3:0] data_out;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;





always@(posedge CLK or negedge RST_N)
begin
if (!RST_N)
	begin
	data_out[0] <= 0;
	end
else
	begin
	data_out[0] <= SYNTHESIZED_WIRE_0;
	end
end


always@(posedge CLK or negedge RST_N)
begin
if (!RST_N)
	begin
	data_out[1] <= 0;
	end
else
	begin
	data_out[1] <= SYNTHESIZED_WIRE_1;
	end
end


mux_0	b2v_inst10(
	.data1(data_out[1]),
	.data2(Din[1]),
	.sel(Ce),
	.out(SYNTHESIZED_WIRE_1));


mux_1	b2v_inst11(
	.data1(data_out[2]),
	.data2(Din[2]),
	.sel(Ce),
	.out(SYNTHESIZED_WIRE_2));


mux_2	b2v_inst12(
	.data1(data_out[3]),
	.data2(Din[3]),
	.sel(Ce),
	.out(SYNTHESIZED_WIRE_3));


always@(posedge CLK or negedge RST_N)
begin
if (!RST_N)
	begin
	data_out[2] <= 0;
	end
else
	begin
	data_out[2] <= SYNTHESIZED_WIRE_2;
	end
end


always@(posedge CLK or negedge RST_N)
begin
if (!RST_N)
	begin
	data_out[3] <= 0;
	end
else
	begin
	data_out[3] <= SYNTHESIZED_WIRE_3;
	end
end


mux_3	b2v_inst9(
	.data1(data_out[0]),
	.data2(Din[0]),
	.sel(Ce),
	.out(SYNTHESIZED_WIRE_0));

assign	Dout = data_out;

endmodule

module mux_0(data1,data2,sel,out);
/* synthesis black_box */

input data1;
input data2;
input sel;
output out;

endmodule

module mux_1(data1,data2,sel,out);
/* synthesis black_box */

input data1;
input data2;
input sel;
output out;

endmodule

module mux_2(data1,data2,sel,out);
/* synthesis black_box */

input data1;
input data2;
input sel;
output out;

endmodule

module mux_3(data1,data2,sel,out);
/* synthesis black_box */

input data1;
input data2;
input sel;
output out;

endmodule
