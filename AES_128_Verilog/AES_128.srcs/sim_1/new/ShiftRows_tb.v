`timescale 1ns / 1ps

module ShiftRows_tb;

reg [127:0] state;
wire [127:0] n_state;

ShiftRows uut (
    .state(state),
    .n_state(n_state)
);

initial begin
    $monitor("state = %h, n_state = %h",
              state, n_state);

    state = 128'hab0518e4_8b403f4e_897ff02f_35f1fcc4;

    #10; 
    if (n_state !== 128'hab40f0c4_8b7ffce4_89f1184e_35053f2f)
        $display("Test failed: expected ab40f0c4_8b7ffce4_89f1184e_35053f2f, got %h", n_state);

    $finish;
end

endmodule
