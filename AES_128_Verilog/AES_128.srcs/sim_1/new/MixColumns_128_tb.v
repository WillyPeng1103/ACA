`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/27 16:38:21
// Design Name: 
// Module Name: MixColumns_128_tb
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


module MixColumns_128_tb(

    );

    // Inputs
    reg [127:0] MixColumns_state;

    // Outputs
    wire [127:0] MixColumns_nstate;

    // Instantiate the Unit Under Test (UUT)
    MixColumns_128 uut (
        .MixColumns_state(MixColumns_state), 
        .MixColumns_nstate(MixColumns_nstate)
    );

    // Test vectors and expected results
    initial begin
        // Initialize Inputs
        MixColumns_state = 0;

        // Monitor changes
        $monitor("At time %t, state = %h, nstate = %h", $time, MixColumns_state, MixColumns_nstate);

        // Wait 100 ns for global reset
        #100;
        
        // Case 1
        MixColumns_state = 128'hab40f0c4_8b7ffce4_89f1184e_35053f2f;
        #10; // wait 10 ns
        if (MixColumns_nstate !== 128'hb9e447c5_948e20d6_57169af5_75513f3b) begin
            $display("Test Case 1 Failed");
        end else begin
            $display("Test Case 1 Passed");
        end

        // Case 2
        MixColumns_state = 128'h4dc69bde_769be59d_ba705175_e3921674;
        #10; // wait 10 ns
        if (MixColumns_nstate !== 128'h8eb2df2d_22f280c5_dbdcf71e_1292c152) begin
            $display("Test Case 2 Failed");
        end else begin
            $display("Test Case 2 Passed");
        end

        // Finish the simulation
        #10;
        $finish;
    end
endmodule
