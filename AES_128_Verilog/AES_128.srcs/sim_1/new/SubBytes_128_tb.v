`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/27 16:28:59
// Design Name: 
// Module Name: SubBytes_128_tb
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


module SubBytes_128_tb;

    // Inputs
    reg [127:0] subBytes_state;

    // Outputs
    wire [127:0] subBytes_nstate;

    // Instantiate the Unit Under Test (UUT)
    SubBytes_128 uut (
        .subBytes_state(subBytes_state), 
        .subBytes_nstate(subBytes_nstate)
    );

    // Initialize Inputs and monitor changes
    initial begin
        // Initialize Inputs
        subBytes_state = 0;

        // Monitor changes
        $monitor("At time %t, state = %h, nstate = %h", $time, subBytes_state, subBytes_nstate);

        // Wait 100 ns for global reset
        #100;
        
        // Case 1
        subBytes_state = 128'h0ece_f2d9_3672_6b2b_3425_1755_aeb6_4e88;
        #10; // wait 10 ns
        if (subBytes_nstate !== 128'hab8b_8935_0540_7ff1_183f_f0fc_e44e_2fc4) begin
            $display("Test Case 1 Failed");
        end else begin
            $display("Test Case 1 Passed");
        end

        // Case 2
        subBytes_state = 128'h650f_c04d_74c7_e8d0_70ff_e82a_753f_ca9c;
        #10; // wait 10 ns
        if (subBytes_nstate !== 128'h4d76_bae3_92c6_9b70_5116_9be5_9d75_74de) begin
            $display("Test Case 2 Failed");
        end else begin
            $display("Test Case 2 Passed");
        end

        // Finish the simulation
        #10;
        $finish;
    end
      
endmodule
