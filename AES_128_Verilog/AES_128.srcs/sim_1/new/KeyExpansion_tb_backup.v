`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/26 14:20:16
// Design Name: 
// Module Name: KeyExpansion_tb
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


module KeyExpansion_tb();
    // Inputs
    reg [127:0] key;
    reg [3:0] Nr;

    // Outputs
    wire [127:0] n_key;

    // Instantiate the Unit Under Test (UUT)
    KeyExpansion uut (
        .key(key),
        .Nr(Nr),
        .n_key(n_key)
    );

    initial begin
        // Initialize Inputs
        key = 0;
        Nr = 0;

        // Monitor changes on outputs
        $monitor("At time %t, key = %h, Nr = %d, n_key = %h", $time, key, Nr, n_key);

        // Test Case 1
        #10 key = 128'h0f1571c9_47d9e859_0cb7add6_af7f6798; Nr = 0;
        #10 if (n_key !== 128'hdc9037b0_9b49dfe9_97fe723f_388115a7)
            $display("Test Case 1 failed: expected dc9037b0_9b49dfe9_97fe723f_388115a7, got %h", n_key);

        // Test Case 2
        #10 key = 128'hdc9037b0_9b49dfe9_97fe723f_388115a7; Nr = 1;
        #10 if (n_key !== 128'hd2c96bb7_4980b45e_de7ec661_e6ffd3c6)
            $display("Test Case 2 failed: expected d2c96bb7_4980b45e_de7ec661_e6ffd3c6, got %h", n_key);

        // Test Case 3
        #10 key = 128'hd2c96bb7_4980b45e_de7ec661_e6ffd3c6; Nr = 2;
        #10 if (n_key !== 128'hc0afdf39_892f6b67_5751ad06_b1ae7ec0)
            $display("Test Case 3 failed: expected c0afdf39_892f6b67_5751ad06_b1ae7ec0, got %h", n_key);

        // Test Case 4
        #10 key = 128'hc0afdf39_892f6b67_5751ad06_b1ae7ec0; Nr = 3;
        #10 if (n_key !== 128'h2c5c65f1_a5730e96_f222a390_438cdd50)
            $display("Test Case 4 failed: expected 2c5c65f1_a5730e96_f222a390_438cdd50, got %h", n_key);

        // Test Case 5
        #10 key = 128'h2c5c65f1_a5730e96_f222a390_438cdd50; Nr = 4;
        #10 if (n_key !== 128'h589d36eb_fdee387d_0fcc9bed_4c4046bd)
            $display("Test Case 5 failed: expected 589d36eb_fdee387d_0fcc9bed_4c4046bd, got %h", n_key);

        // Test Case 6
        #10 key = 128'h589d36eb_fdee387d_0fcc9bed_4c4046bd; Nr = 5;
        #10 if (n_key !== 128'h71c74cc2_8c2974bf_83e5ef52_cfa5a9ef)
            $display("Test Case 6 failed: expected 71c74cc2_8c2974bf_83e5ef52_cfa5a9ef, got %h", n_key);

        // Test Case 7
        #10 key = 128'h71c74cc2_8c2974bf_83e5ef52_cfa5a9ef; Nr = 6;
        #10 if (n_key !== 128'h37149348_bb3de7f7_38d808a5_f77da14a)
            $display("Test Case 7 failed: expected 37149348_bb3de7f7_38d808a5_f77da14a, got %h", n_key);

        // Test Case 8
        #10 key = 128'h37149348_bb3de7f7_38d808a5_f77da14a; Nr = 7;
        #10 if (n_key !== 128'h48264520_f31ba2d7_cbc3aa72_3cbe0b38)
            $display("Test Case 8 failed: expected 48264520_f31ba2d7_cbc3aa72_3cbe0b38, got %h", n_key);

        // Test Case 9
        #10 key = 128'h48264520_f31ba2d7_cbc3aa72_3cbe0b38; Nr = 8;
        #10 if (n_key !== 128'hfd0d42cb_0e16e01c_c5d54a6e_f96b4156)
            $display("Test Case 9 failed: expected fd0d42cb_0e16e01c_c5d54a6e_f96b4156, got %h", n_key);

        // Test Case 10
        #10 key = 128'hfd0d42cb_0e16e01c_c5d54a6e_f96b4156; Nr = 9;
        #10 if (n_key !== 128'hb48ef352_ba98134e_7f4d5920_86261876)
            $display("Test Case 10 failed: expected b48ef352_ba98134e_7f4d5920_86261876, got %h", n_key);

        // row first, then column
        // Test Case 1
        #10 key = 128'h0f470caf_15d9b77f_71e8ad67_c959d698; Nr = 0;
        #10 if (n_key !== 128'hdc9b9738_9049fe81_37df7215_b0e93fa7)
            $display("Test Case 1 failed: expected dc9b9738_9049fe81_37df7215_b0e93fa7, got %h", n_key);

        // Test Case 2
        #10 key = 128'hdc9b9738_9049fe81_37df7215_b0e93fa7; Nr = 1;
        #10 if (n_key !== 128'hd249dee6_c9807eff_6bb4c6d3_b75e61c6)
            $display("Test Case 2 failed: expected d249dee6_c9807eff_6bb4c6d3_b75e61c6, got %h", n_key);

        // Test Case 3
        #10 key = 128'hd249dee6_c9807eff_6bb4c6d3_b75e61c6; Nr = 2;
        #10 if (n_key !== 128'hc08957b1_af2f51ae_df6bad7e_396706c0)
            $display("Test Case 3 failed: expected c08957b1_af2f51ae_df6bad7e_396706c0, got %h", n_key);

        // Test Case 4
        #10 key = 128'hc08957b1_af2f51ae_df6bad7e_396706c0; Nr = 3;
        #10 if (n_key !== 128'h2ca5f243_5c73228c_650ea3dd_f1969050)
            $display("Test Case 4 failed: expected 2ca5f243_5c73228c_650ea3dd_f1969050, got %h", n_key);

        // Test Case 5
        #10 key = 128'h2ca5f243_5c73228c_650ea3dd_f1969050; Nr = 4;
        #10 if (n_key !== 128'h58fd0f4c_9deecc40_36389b46_eb7dedbd)
            $display("Test Case 5 failed: expected 58fd0f4c_9deecc40_36389b46_eb7dedbd, got %h", n_key);

        // Test Case 6
        #10 key = 128'h58fd0f4c_9deecc40_36389b46_eb7dedbd; Nr = 5;
        #10 if (n_key !== 128'h718c83cf_c729e5a5_4c74efa9_c2bf52ef)
            $display("Test Case 6 failed: expected 718c83cf_c729e5a5_4c74efa9_c2bf52ef, got %h", n_key);

        // Test Case 7
        #10 key = 128'h718c83cf_c729e5a5_4c74efa9_c2bf52ef; Nr = 6;
        #10 if (n_key !== 128'h37bb38f7_143dd87d_93e708a1_48f7a54a)
            $display("Test Case 7 failed: expected 37bb38f7_143dd87d_93e708a1_48f7a54a, got %h", n_key);

        // Test Case 8
        #10 key = 128'h37bb38f7_143dd87d_93e708a1_48f7a54a; Nr = 7;
        #10 if (n_key !== 128'h48f3cb3c_261bc3be_45a2aa0b_20d77238)
            $display("Test Case 8 failed: expected 48f3cb3c_261bc3be_45a2aa0b_20d77238, got %h", n_key);

        // Test Case 9
        #10 key = 128'h48f3cb3c_261bc3be_45a2aa0b_20d77238; Nr = 8;
        #10 if (n_key !== 128'hfd0ec5f9_0d16d56b_42e04a41_cb1c6e56)
            $display("Test Case 9 failed: expected fd0ec5f9_0d16d56b_42e04a41_cb1c6e56, got %h", n_key);

        // Test Case 10
        #10 key = 128'hfd0ec5f9_0d16d56b_42e04a41_cb1c6e56; Nr = 9;
        #10 if (n_key !== 128'hb4ba7f86_8e984d26_f3135918_524e2076)
            $display("Test Case 10 failed: expected b4ba7f86_8e984d26_f3135918_524e2076, got %h", n_key);


        // Finish the simulation
        #100 $finish;
    end

endmodule

