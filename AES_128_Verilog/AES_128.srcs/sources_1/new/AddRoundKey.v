`timescale 1ns / 1ps
//done
module AddRoundKey (
    input [127:0]state,
    input [127:0]roundkey,
    output [127:0]n_state
);

assign n_state = state ^ roundkey;

endmodule