`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/27 15:49:45
// Design Name: 
// Module Name: AES_128_Encrypt_tb
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


module AES_128_Encrypt_tb;

    // Inputs
    reg [127:0] plaintext;
    reg [127:0] key;
    reg reset_n;
    reg clk;

    // Outputs
    wire done;
    wire [127:0] ciphertext;

    // Instantiate the Unit Under Test (UUT)
    AES_128_Encrypt uut (
        .plaintext(plaintext),
        .key(key),
        .reset_n(reset_n),
        .clk(clk),
        .done(done),
        .ciphertext(ciphertext)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #50 clk = ~clk; // 100ns clock cycle
    end

    // Stimulus and monitoring
    initial begin
        // Initialize Inputs
        reset_n = 0;
        key =       128'h0f470caf15d9b77f71e8ad67c959d698;
        plaintext = 128'h0189fe7623abdc5445cdba3267ef9810;

        // Reset sequence
        #50; // Wait for 50ns
        reset_n = 1; // Release reset

        // Monitor state and roundkey
        $monitor("At time %t, round_cnt=%d, state=%h, roundkey=%h, ciphertext=%h", $time, uut.round_cnt, uut.state, uut.roundkey, ciphertext);

        // Wait until done
        wait (done == 1);
        $display("Final ciphertext: %h", ciphertext);
        #100; // Wait for additional cycles to observe final output

        // Check if the final ciphertext matches expected
        if (ciphertext == 128'hff0869640b53341484bfab8f4a7c43b9) begin
            $display("Test Passed.");
        end else begin
            $display("Test Failed.");
        end

        // Finish simulation
        $finish;
    end
endmodule
