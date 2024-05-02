`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/25 14:23:16
// Design Name: 
// Module Name: SubBytes_tb
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


module SubBytes_tb;

    // Inputs
    reg [7:0] state;

    // Outputs
    wire [7:0] n_state;

    // Instantiate the Unit Under Test (UUT)
    SubBytes uut (
        .state(state), 
        .n_state(n_state)
    );

    initial begin
        // Initialize Inputs
        state = 0;

        // Display results in a readable format
        $monitor("At time %t, input state = %h, output n_state = %h", $time, state, n_state);

        // Wait 100 ns for global reset to finish
        #100;

        // Test Case 1
        // Input: 0x0e, Expected Output: 0xab
        state = 8'h0e; #10;
        if (n_state !== 8'hab) $display("Error: input 0x0e, expected 0xab, got %h", n_state);
        
        // Input: 0xce, Expected Output: 0x8b
        state = 8'hce; #10;
        if (n_state !== 8'h8b) $display("Error: input 0xce, expected 0x8b, got %h", n_state);
        
        // Input: 0xf2, Expected Output: 0x89
        state = 8'hf2; #10;
        if (n_state !== 8'h89) $display("Error: input 0xf2, expected 0x89, got %h", n_state);
        
        // Input: 0xd9, Expected Output: 0x35
        state = 8'hd9; #10;
        if (n_state !== 8'h35) $display("Error: input 0xd9, expected 0x35, got %h", n_state);

        // Test Case 2
        // Input: 0x65, Expected Output: 0x4d
        state = 8'h65; #10;
        if (n_state !== 8'h4d) $display("Error: input 0x65, expected 0x4d, got %h", n_state);
        
        // Input: 0x0f, Expected Output: 0x76
        state = 8'h0f; #10;
        if (n_state !== 8'h76) $display("Error: input 0x0f, expected 0x76, got %h", n_state);
        
        // Input: 0xc0, Expected Output: 0xba
        state = 8'hc0; #10;
        if (n_state !== 8'hba) $display("Error: input 0xc0, expected 0xba, got %h", n_state);
        
        // Input: 0x4d, Expected Output: 0xe3
        state = 8'h4d; #10;
        if (n_state !== 8'he3) $display("Error: input 0x4d, expected 0xe3, got %h", n_state);
        
        // End simulation
        $finish;
    end
endmodule
