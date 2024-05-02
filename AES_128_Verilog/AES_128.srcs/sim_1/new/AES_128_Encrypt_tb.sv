`timescale 1ns / 1ps
`define CYCLE 20.0
`define SDFFILE    "./AES_128_Encrypt.sdf"
`define MAX_CYCLE 50000

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
    AES_128_Encrypt u_AES_128_Encrypt (
        .plaintext(plaintext),
        .key(key),
        .reset_n(reset_n),
        .clk(clk),
        .done(done),
        .ciphertext(ciphertext)
    );

    `ifdef SDF
        initial $sdf_annotate(`SDFFILE, u_AES_128_Encrypt);
    `endif

    //initial begin
    //    $fsdbDumpfile("AES_128_Encrypt.fsdb");
    //    $fsdbDumpvars();
    //    $fsdbDumpMDA;
    //end

    //initial begin
    //    $dumpvars();
    //    $dumpfile("AES_128_Encrypt.vcd");
    //end

    // Clock generation
    initial begin
        clk = 0;
        forever #(`CYCLE/2) clk = ~clk; // 100ns clock cycle
    end

    initial begin
        $display ("****************************");
        $display ("**   Simulation Start     **");
        $display ("****************************");
    end

    parameter RESET = 0,
              PATTERN = 1,
              RUN = 2,
              OVER = 3;

    parameter PT1 = 0,
              PT2 = 1,
              PT3 = 2,
              PT4 = 3,
              PT5 = 4;

    reg [1:0] state;
    reg [1:0] rst_count;
    reg [30:0] cycle_total = 0;
    integer wait_done;
    integer pattern_select = 0;
    integer total_passed = 0;

    initial begin
        state <= RESET;
        rst_count <= 0;
        pattern_select <= 0;
    end

    always @(posedge clk) begin
        cycle_total = cycle_total + 1;
        if (cycle_total > `MAX_CYCLE) begin
            $display("********************************************************************");
            $display("**  Failed waiting done signal, Simulation STOP at cycle %d **",cycle_total);
            $display("**  If needed, You can increase MAX_CYCLE value in tp.v           **");
            $display("********************************************************************");
            $finish;
        end
    end

    always @(posedge clk) begin
        case (state)
            RESET:begin
                if (rst_count == 2) begin
                    #1 reset_n <= 1'b1;
                    rst_count <= 0;
                    state <= PATTERN;
                    case (pattern_select)
                        PT1:begin
                            key <= 128'h0f1571c947d9e8590cb7add6af7f6798;
                            plaintext <= 128'h0123456789abcdeffedcba9876543210;
                        end
                        PT2:begin
                            key <= 128'h4d66efea77d5ce6eaaed3606f471f27e;
                            plaintext <= 128'h67c79c0fc69591e3d1a10871b7820035;
                        end
                        PT3:begin
                            key <= 128'h64e0a0dd4a18316b608df66422317648;
                            plaintext <= 128'h1f103ac63b1d52c08e84da2f07093363;
                        end
                        PT4:begin
                            key <= 128'ha8fe0984148805c1f7bb670f2e363acb;
                            plaintext <= 128'h0a8f80b573d9c3589d6c9a3f4f7abb59;
                        end
                        PT5:begin
                            key <= 128'h824376b10a6055db1c41338d79283c33;
                            plaintext <= 128'hb9ca8255379fbee55b51e6264b8f345a;
                        end
                        default:begin
                        end
                    endcase
                end 
                else begin
                    #1 reset_n <= 1'b0;
                    rst_count <= rst_count+1;
                    wait_done <= 0;
                end
                end
            PATTERN:begin
                if (done == 0)begin
                    state <= RUN;
                end
                else begin
                    if(done === 1'bx) begin
                        $display("\n%10t , ERROR, DONE is in unknown state. Simlation terminated\n",$time);
                        $finish;
                    end
                    else begin
                        #1;
                        $display("%10t , please pull down signal DONE",$time);
                        wait_done <= wait_done + 1;
                        if(wait_done >10) begin
                            $display("\n%t , ERROR, please pull down signal DONE. Simlation terminated\n",$time);
                            $finish;
                        end
                    end
                end
            end
            RUN:begin
                if (done == 1)begin
                    $display("----------------------------------------------------------------------");
                    $display("Get done at cycle:%d",cycle_total);
                    $display("Final ciphertext: %h", ciphertext);
                    case (pattern_select)
                        PT1:begin
                            if (ciphertext == 128'hff0b844a0853bf7c6934ab4364148fb9) begin
                                $display("Test Case 1 Passed.");
                                total_passed <= total_passed + 1;
                            end else begin
                                $display("Test Case 1 Failed.");
                            end
                        end
                        PT2:begin
                            if (ciphertext == 128'hcdffb080bcc0950f2bb1e321a6172a8c) begin
                                $display("Test Case 2 Passed.");
                                total_passed <= total_passed + 1;
                            end else begin
                                $display("Test Case 2 Failed.");
                            end
                        end
                        PT3:begin
                            if (ciphertext == 128'h28021b7f7e953f14690b212093ab10cc) begin
                                $display("Test Case 3 Passed.");
                                total_passed <= total_passed + 1;
                            end else begin
                                $display("Test Case 3 Failed.");
                            end
                        end
                        PT4:begin
                            if (ciphertext == 128'had24c65048895e7aae6b04157c3dca02) begin
                                $display("Test Case 4 Passed.");
                                total_passed <= total_passed + 1;
                            end else begin
                                $display("Test Case 4 Failed.");
                            end
                        end
                        PT5:begin
                            if (ciphertext == 128'h40e4604d8a98c85d62a919136e5f76f9) begin
                                $display("Test Case 5 Passed.");
                                total_passed <= total_passed + 1;
                            end else begin
                                $display("Test Case 5 Failed.");
                            end
                        end
                        default:begin
                        end
                    endcase
                    $display("----------------------------------------------------------------------");
                    if (pattern_select < 5)begin
                        pattern_select <= pattern_select + 1;
                        state <= PATTERN;
                    end
                    else begin
                        state <= OVER;
                    end

                    case (pattern_select + 1)
                        PT1:begin
                            key <= 128'h0f1571c947d9e8590cb7add6af7f6798;
                            plaintext <= 128'h0123456789abcdeffedcba9876543210;
                        end
                        PT2:begin
                            key <= 128'h4d66efea77d5ce6eaaed3606f471f27e;
                            plaintext <= 128'h67c79c0fc69591e3d1a10871b7820035;
                        end
                        PT3:begin
                            key <= 128'h64e0a0dd4a18316b608df66422317648;
                            plaintext <= 128'h1f103ac63b1d52c08e84da2f07093363;
                        end
                        PT4:begin
                            key <= 128'ha8fe0984148805c1f7bb670f2e363acb;
                            plaintext <= 128'h0a8f80b573d9c3589d6c9a3f4f7abb59;
                        end
                        PT5:begin
                            key <= 128'h824376b10a6055db1c41338d79283c33;
                            plaintext <= 128'hb9ca8255379fbee55b51e6264b8f345a;
                        end
                        default:begin
                        end
                    endcase
                end
            end
            OVER: begin
                $display ("*******************************");
                $display ("**   Finish Simulation       **");
                $display ("**   RUN CYCLE = %10d  **",cycle_total);
                $display ("**   Passed total = %3d/5   **", total_passed);
                $display ("*******************************");
                $finish;
            end
            default:begin
            end
        endcase
    end

endmodule
