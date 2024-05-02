`timescale 1ns / 1ps
`define CYCLE 20.0

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

    `ifdef SDF
        initial $sdf_annotate(`SDFFILE, u_LASER);
    `endif

    //initial begin
    //    $fsdbDumpfile("LASER.fsdb");
    //    $fsdbDumpvars();
    //    $fsdbDumpMDA;
    //end

    //initial begin
    //    $dumpvars();
    //    $dumpfile("LASER.vcd");
    //end

    // Clock generation
    initial begin
        clk = 0;
        forever #(`CYCLE/2) clk = ~clk; // 100ns clock cycle
    end

    // Stimulus and monitoring
    initial begin
        // Case 1
        // Initialize Inputs
        reset_n = 0;
        key =       128'h0f1571c947d9e8590cb7add6af7f6798;
        plaintext = 128'h0123456789abcdeffedcba9876543210;

        // Reset sequence
        #(`CYCLE/2); // Wait for half clock cycle
        reset_n = 1; // Release reset

        // Monitor state and roundkey
        $monitor("At time %t, round_cnt=%d, state=%h, roundkey=%h, ciphertext=%h", $time, uut.round_cnt, uut.state, uut.roundkey, ciphertext);

        // Wait until done
        wait (done == 1);
        $display("Final ciphertext: %h", ciphertext);
        #(`CYCLE); // Wait for additional cycles to observe final output

        // Check if the final ciphertext matches expected
        if (ciphertext == 128'hff0b844a0853bf7c6934ab4364148fb9) begin
            $display("Test Case 1 Passed.");
        end else begin
            $display("Test Case 1 Failed.");
        end

        // Case 2
        reset_n = 0; 
        key = 128'h4d66efea77d5ce6eaaed3606f471f27e;
        plaintext = 128'h67c79c0fc69591e3d1a10871b7820035;
        #(`CYCLE/2); 
        reset_n = 1;
        
        // Wait until done
        wait (done == 1);
        $display("Final ciphertext: %h", ciphertext);
        #(`CYCLE); // Wait for additional cycles to observe final output
        if (ciphertext !== 128'hcdffb080bcc0950f2bb1e321a6172a8c)
            $display("Test Case 2 Failed: expected %h, got %h", 128'hcdffb080bcc0950f2bb1e321a6172a8c, ciphertext);
        else
            $display("Test Case 2 Passed.");


        // Case 3
        reset_n = 0; 
        key = 128'h64e0a0dd4a18316b608df66422317648;
        plaintext = 128'h1f103ac63b1d52c08e84da2f07093363;
        #(`CYCLE/2); 
        reset_n = 1;
        
        // Wait until done
        wait (done == 1);
        $display("Final ciphertext: %h", ciphertext);
        #(`CYCLE); // Wait for additional cycles to observe final output
        if (ciphertext !== 128'h28021b7f7e953f14690b212093ab10cc)
            $display("Test Case 3 Failed: expected %h, got %h", 128'h28021b7f7e953f14690b212093ab10cc, ciphertext);
        else
            $display("Test Case 3 Passed.");

        // Case 4
        reset_n = 0; 
        key = 128'ha8fe0984148805c1f7bb670f2e363acb;
        plaintext = 128'h0a8f80b573d9c3589d6c9a3f4f7abb59;
        #(`CYCLE/2); 
        reset_n = 1;
        
        // Wait until done
        wait (done == 1);
        $display("Final ciphertext: %h", ciphertext);
        #(`CYCLE); // Wait for additional cycles to observe final output
        if (ciphertext !== 128'had24c65048895e7aae6b04157c3dca02)
            $display("Test Case 4 Failed: expected %h, got %h", 128'had24c65048895e7aae6b04157c3dca02, ciphertext);
        else
            $display("Test Case 4 Passed.");

        // Case 5
        reset_n = 0; 
        key = 128'h824376b10a6055db1c41338d79283c33;
        plaintext = 128'hb9ca8255379fbee55b51e6264b8f345a;
        #(`CYCLE/2); 
        reset_n = 1;
        
        // Wait until done
        wait (done == 1);
        $display("Final ciphertext: %h", ciphertext);
        #(`CYCLE); // Wait for additional cycles to observe final output
        if (ciphertext !== 128'h40e4604d8a98c85d62a919136e5f76f9)
            $display("Test Case 5 Failed: expected %h, got %h", 128'h40e4604d8a98c85d62a919136e5f76f9, ciphertext);
        else
            $display("Test Case 5 Passed.");

        // Finish simulation
        #100 $finish;
    end
endmodule
