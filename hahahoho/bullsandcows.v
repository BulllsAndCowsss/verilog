module BullsAndCows(
    input wire [39:0] guess,
    input wire [15:0] answer,
    input wire [7:0] lcd_data_external,
    output wire [3:0] strike,
    output wire [3:0] ball
);

    assign strike = count_strike(guess, answer);
    assign ball = count_ball(guess, answer);

    function [3:0] count_strike;
        input [39:0] guess; 
        input [15:0] answer; 

        integer i, j;
        reg [3:0] count;

        begin
            count = 3'd0;
            for (i = 0; i < 10; i = i + 1) begin  // 10���� guess ����
                for (j = 0; j < 4; j = j + 1) begin  // 4���� answer ����
                    if ((i == j) && (guess[i*4 +: 4] == answer[j*4 +: 4])) begin  // ��ġ�� ���� ��� ������
                    count = count + 1;
                end
            end
        end
        count_strike = count;
        end
    endfunction

    function [3:0] count_ball;
        input [39:0] guess; 
        input [15:0] answer;
        integer i, j;
        reg [3:0] count;

        begin
            count = 3'd0;
            for (i = 0; i < 10; i = i + 1) begin
                for (j = 0; j < 4; j = j + 1) begin
                    if ((i != j) && (guess[i*4 +: 4] == answer[j*4 +: 4])) begin
                        count = count + 1;
                end
            end
        end
        count_ball = count;
        end
    endfunction

endmodule