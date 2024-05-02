`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/23 15:54:46
// Design Name: 
// Module Name: AddRoundKey_tb
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
module AddRoundKey_tb;

// Define test inputs as registers
reg [127:0] state;
reg [127:0] roundkey;

// Define the output as a wire
wire [127:0] n_state;

// Instantiate the AddRoundKey module
AddRoundKey uut (
    .state(state),
    .roundkey(roundkey),
    .n_state(n_state)
);

// Initialize inputs and monitor changes
initial begin
    // Initialize state and roundkey
    state = 128'h01234567_89abcdef_fedcba98_76543210;
    roundkey = 128'h0f1571c9_47d9e859_0cb7add6_af7f6798;

    // Monitor changes in n_state and print them
    $monitor("Time = %t, state = %h, roundkey = %h, n_state = %h",
             $time, state, roundkey, n_state);

    // Wait for 10 ns to observe outputs
    #10; 
    
    // Check if the output is correct
    if (n_state == 128'h0e3634ae_ce7225b6_f26b174e_d92b5588) begin
        $display("Test passed: n_state matches the expected output.");
    end else begin
        $display("Test failed: n_state does not match the expected output.");
    end

    // Finish the test
    $finish;
end

endmodule

