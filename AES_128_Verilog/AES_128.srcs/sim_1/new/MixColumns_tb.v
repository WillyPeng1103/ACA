`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/25 14:56:34
// Design Name: 
// Module Name: MixColumns_tb
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


module MixColumns_tb;

    // Inputs
    reg [7:0] r0;
    reg [7:0] r1;
    reg [7:0] r2;
    reg [7:0] r3;

    // Outputs
    wire [7:0] n_r0;
    wire [7:0] n_r1;
    wire [7:0] n_r2;
    wire [7:0] n_r3;

    // Instantiate the Unit Under Test (UUT)
    MixColumns uut (
        .r0(r0),
        .r1(r1),
        .r2(r2),
        .r3(r3),
        .n_r0(n_r0),
        .n_r1(n_r1),
        .n_r2(n_r2),
        .n_r3(n_r3)
    );

    initial begin
        // Initialize Inputs
        r0 = 0; r1 = 0; r2 = 0; r3 = 0;

        // Monitor the output
        $monitor("At time %t, input (r0,r1,r2,r3) = (%h,%h,%h,%h) output (n_r0,n_r1,n_r2,n_r3) = (%h,%h,%h,%h)", $time, r0, r1, r2, r3, n_r0, n_r1, n_r2, n_r3);

        // Test Case 1
        #10 r0 = 8'hab; r1 = 8'h40; r2 = 8'hf0; r3 = 8'hc4;
        #10 if ({n_r0, n_r1, n_r2, n_r3} !== {8'hb9, 8'he4, 8'h47, 8'hc5})
                $display("Test Case 1 failed: expected b9e447c5, got %h%h%h%h", n_r0, n_r1, n_r2, n_r3);

        // Test Case 2
        #10 r0 = 8'h8b; r1 = 8'h7f; r2 = 8'hfc; r3 = 8'he4;
        #10 if ({n_r0, n_r1, n_r2, n_r3} !== {8'h94, 8'h8e, 8'h20, 8'hd6})
                $display("Test Case 2 failed: expected 948e20d6, got %h%h%h%h", n_r0, n_r1, n_r2, n_r3);

        // Test Case 3
        #10 r0 = 8'h89; r1 = 8'hf1; r2 = 8'h18; r3 = 8'h4e;
        #10 if ({n_r0, n_r1, n_r2, n_r3} !== {8'h57, 8'h16, 8'h9a, 8'hf5})
                $display("Test Case 3 failed: expected 57169af5, got %h%h%h%h", n_r0, n_r1, n_r2, n_r3);

        // Test Case 4
        #10 r0 = 8'h35; r1 = 8'h05; r2 = 8'h3f; r3 = 8'h2f;
        #10 if ({n_r0, n_r1, n_r2, n_r3} !== {8'h75, 8'h51, 8'h3f, 8'h3b})
                $display("Test Case 4 failed: expected 75513f3b, got %h%h%h%h", n_r0, n_r1, n_r2, n_r3);

        // Finish simulation
        #10 $finish;
    end
endmodule
