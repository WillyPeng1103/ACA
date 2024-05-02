`timescale 1ns / 1ps
//done
module GFMul(
    input [7:0] state, // one byte
    input [1:0] idx,
    output reg [7:0] n_state // one byte
);
wire msb;
wire [7:0]state_shift1;

assign msb = state[7];
assign state_shift1 = state << 1;

always @(*) begin
    if (idx == 2)
        n_state = state_shift1;
    else 
        n_state = state_shift1 ^ state;

    if (msb == 1)
        n_state = n_state ^ 8'h1b; 
    else
        n_state = n_state;
end
endmodule