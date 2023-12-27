module setAnswerModule(input wire CLK,
                       input wire rst_n,         // Active low reset
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
                       output reg [15:0] answer, // Change to 16-bit output
                       output reg legalAnswer);  // Add legalAnswer output
    
    wire [3:0] bin_out;
    wire [3:0] out_wire1, out_wire2, out_wire3, out_wire4;
    wire button_pressed; // Button pressed signal
    wire trigger_out; // Output from trigger module
    
    assign button_pressed = zero | one | two | three | four | five | six | seven | eight | nine; // Combine all the digits inputs to generate button_pressed signal
    
    decimal_to_binary u12 (
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
    .binary(bin_out)
    );
    
    trigger T12 (
    .CLK(CLK),
    .Din(button_pressed),
    .rst_n(rst_n),
    .Dout(trigger_out)
    );
    
    FourInputConv u22 (
    .in(bin_out),
    .clk(CLK),
    .rst_n(rst_n),
    .ce(trigger_out), // Connect trigger_out signal
    .out1(out_wire1),
    .out2(out_wire2),
    .out3(out_wire3),
    .out4(out_wire4)
    );
    
    always @(posedge CLK or negedge rst_n) begin
        legalAnswer <= 1'b0;
        if (~rst_n) begin
            answer      <= 16'd0;
            legalAnswer <= 1'b0;
            end else begin
            answer <= {out_wire1, out_wire2, out_wire3, out_wire4};
            // If any of the out_wire[i] signals is 1111, set legalAnswer to 1.
            if (out_wire1 ! = 4'b1111 && out_wire2 ! = 4'b1111 && out_wire3 ! = 4'b1111 && out_wire4 ! = 4'b1111)
                legalAnswer <= 1'b1;
            else
                legalAnswer <= 1'b0;
        end
    end
endmodule
