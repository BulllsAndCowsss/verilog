module mainmodule(input wire CLK,
                  input wire rst_n,           // Active low reset
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
                  input wire modeSelect,      // Mode select input
                  output wire Green1,
                  output wire Green2,
                  output wire Green3,
                  output wire Green4,
                  output wire Red1,
                  output wire Red2,
                  output wire Red3,
                  output wire Red4,
                  output wire lcd_e,
                  lcd_rs,
                  lcd_rw,
                  output wire [7:0] lcd_data,
                  output wire piezoPin,
                  output reg [7:0] led_data,
                  output wire stepMoterA,
                  output wire stepMoterB,
                  output wire stepMoterAAA,
                  output wire stepMoterBBB);
    reg [15:0] input_answer;
    wire [15:0] out_combined, out_setAnswer ;
    wire checkEnable_combined, checkEnable_setAnswer, triggerState,rst_for_top;
    reg [7:0] trycount; // 8-bit trycount definition
    //    reg [15:0] out;
    wire correct;
    reg rst_top;
    
    top_level u13 (
    .clk(CLK),
    .rst(rst_top),
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
    .answer(input_answer), // added line
    
    
    .Green1(Green1),
    .Green2(Green2),
    .Green3(Green3),
    .Green4(Green4),
    .Red1(Red1),
    .Red2(Red2),
    .Red3(Red3),
    .Red4(Red4),
    .lcd_e(lcd_e),
    .lcd_rs(lcd_rs),
    .lcd_rw(lcd_rw),
    .lcd_data(lcd_data),
    
    .checkEn(checkEnable_combined),
    .piezo(piezoPin),
    .correct(corret),
    
    .stepMoterA(stepMoterA),
    .stepMoterB(stepMoterB),
    .stepMoterAAA(stepMoterAAA),
    .stepMoterBBB(stepMoterBBB),
    
    .triggerState(triggerState)
    );
    
    setAnswerModule u23 (
    .CLK(CLK),
    .rst_n(rst_n),
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
    .answer(out_setAnswer),
    .legalAnswer(checkEnable_setAnswer)
    );
    
    always @(posedge CLK or negedge rst_n) begin
        rst_top <= 1'b1 ;
        if (~rst_n) begin
            //            out <= 16'd0;
            rst_top           <= 1'b0 ;
            trycount          <= 8'b11111111;
            // Initialize trycount
            end else begin
            if (modeSelect) begin
                //                out <= out_setAnswer;
                rst_top               <= 1'b0 ;
                trycount              <= 8'b11111111;
                input_answer          <= out_setAnswer;
                end else begin
                if (trycount == 00000000) begin
                ////////////////////////////////////////////// 수정 요망
                    // LCD NO more TRY!!! 띄우고 빨간불
                    rst_top <= 1'b0 ;
                end
                    if (triggerState && checkEnable_combined && !correct && checkEnable_setAnswer) begin
                        trycount <= trycount >> 1; // Right shift if checkEnable_combined is 1
                        rst_top  <= 1'b0 ;
                    end
            end
            led_data <= trycount;
        end
        
    end
endmodule
