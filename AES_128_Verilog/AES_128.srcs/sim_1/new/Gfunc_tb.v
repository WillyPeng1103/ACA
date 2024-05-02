`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/26 13:58:53
// Design Name: 
// Module Name: Gfunc_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Gfunc_tb;
    // Inputs
    reg [31:0] word;
    reg [3:0] Nr;

    // Outputs
    wire [31:0] n_word;

    // Instantiate the Unit Under Test (UUT)
    Gfunc uut (
        .word(word),
        .Nr(Nr),
        .n_word(n_word)
    );

    initial begin
        // Initialize Inputs
        word = 0;
        Nr = 0;

        // Monitor changes on outputs
        $monitor("At time %t, word = %h, Nr = %d, n_word = %h", $time, word, Nr, n_word);

        // Apply Test Cases
        #10 word = 32'haf7f6798; Nr = 0; // Case 1
        #10 if (n_word !== 32'hd3854679)
                $display("Test Case 1 failed: expected d3854679, got %h", n_word);

        #10 word = 32'h388115a7; Nr = 1; // Case 2
        #10 if (n_word !== 32'h0e595c07)
                $display("Test Case 2 failed: expected 0e595c07, got %h", n_word);

        #10 word = 32'he6ffd3c6; Nr = 2; // Case 3
        #10 if (n_word !== 32'h1266b48e)
                $display("Test Case 3 failed: expected 1266b48e, got %h", n_word);

        // Finish simulation
        #20 $finish;
    end
endmodule
