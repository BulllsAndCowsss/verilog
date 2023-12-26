module FourInputConv(
    input wire [3:0] in,
    input wire clk,
    input wire rst_n, // Active low reset
    input wire ce, // Clock Enable
    output reg [3:0] out1,
    output reg [3:0] out2,
    output reg [3:0] out3,
    output reg [3:0] out4
);
    reg [1:0] count;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 2'b00;
            out1 <= 4'b1111; // 초기값을 15로 설정
            out2 <= 4'b1111; // 초기값을 15로 설정
            out3 <= 4'b1111; // 초기값을 15로 설정
            out4 <= 4'b1111; // 초기값을 15로 설정
        end else if (ce) begin // Check if ce is high
            case (count)
                2'b00: out1 <= in;
                2'b01: out2 <= in;
                2'b10: out3 <= in;
                2'b11: out4 <= in;
            endcase
            if (count == 2'b11) begin
                count <= 2'b00;
            end else begin
                count <= count + 1'b1;
            end
        end
    end

    
endmodule
