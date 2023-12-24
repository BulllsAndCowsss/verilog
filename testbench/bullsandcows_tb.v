module BullsAndCows_tb;

    // Inputs
    reg [15:0] guess;
    reg [15:0] answer;

    // Outputs
    wire [3:0] strike;
    wire [3:0] ball;

    // Instantiate the module
    BullsAndCows dut (
        .guess(guess),
        .answer(answer),
        .strike(strike),
        .ball(ball)
    );

    // Clock generation
    reg clk = 0;
    always #5 clk = ~clk;

    // Testbench behavior
    initial begin
        // Test case 1: All correct guess and answer
        guess = 16'h1234;
        answer = 16'h1234;
        #10; // Wait for a few cycles for computation
        $display("Test Case 1 - Guess: %h, Answer: %h, Strike: %d, Ball: %d", guess, answer, strike, ball);

        // Test case 2: All numbers correct but in different positions
        guess = 16'h5678;
        answer = 16'h7856;
        #10;
        $display("Test Case 2 - Guess: %h, Answer: %h, Strike: %d, Ball: %d", guess, answer, strike, ball);

        // Test case 3: No correct number
        guess = 16'h1234;
        answer = 16'h5678;
        #10;
        $display("Test Case 3 - Guess: %h, Answer: %h, Strike: %d, Ball: %d", guess, answer, strike, ball);

        // Add more test cases as needed

        // End simulation
        $finish;
    end

endmodule