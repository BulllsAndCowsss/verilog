module BullsAndCows(
    input wire [15:0] guess,
    input wire [15:0] answer,
    input wire checkEnable,
    input wire [7:0] lcd_data_external,
    output wire [3:0] strike,
    output wire [3:0] ball
);

    assign strike = checkEnable ? count_strike(guess, answer) : 4'd0;
    assign ball = checkEnable ? count_ball(guess, answer) : 4'd0;

    function [3:0] count_strike;
        input [15:0] guess; 
        input [15:0] answer; 

        integer i;
        reg [3:0] count;

        begin
            count = 3'd0;
            for (i = 0; i < 4; i = i + 1) begin
                // $display("%d %h %b", guess[i*4 +: 4], guess[i*4 +: 4], guess[i*4 +: 4]);
                // $display("%d %h %b", answer[i*4 +: 4], answer[i*4 +: 4], answer[i*4 +: 4]);
                if (guess[i*4 +: 4] == answer[i*4 +: 4]) begin
                    count = count + 1;
                end
            end
            count_strike = count;
        end
    endfunction

    function [3:0] count_ball;
        input [15:0] guess; 
        input [15:0] answer;
        integer i, j;
        reg [3:0] count;

        begin
            count = 3'd0;
            for (i = 0; i < 4; i = i + 1) begin
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