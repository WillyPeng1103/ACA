`timescale 1ns / 1ps
//done
module MixColumns ( // mix one columns
    input [7:0]r0,
    input [7:0]r1,
    input [7:0]r2,
    input [7:0]r3,
    output reg [7:0]n_r0,
    output reg [7:0]n_r1,
    output reg [7:0]n_r2,
    output reg [7:0]n_r3
);
wire [7:0]r0GF2;
wire [7:0]r0GF3;
wire [7:0]r1GF2;
wire [7:0]r1GF3;
wire [7:0]r2GF2;
wire [7:0]r2GF3;
wire [7:0]r3GF2;
wire [7:0]r3GF3;

GFMul2 row0_GF2 (
    .state(r0), // one byte
    .n_state(r0GF2) // one byte
);
GFMul3 row0_GF3 (
    .state(r1), // one byte
    .n_state(r0GF3) // one byte
);
GFMul2 row1_GF2 (
    .state(r1), // one byte
    .n_state(r1GF2) // one byte
);
GFMul3 row1_GF3 (
    .state(r2), // one byte
    .n_state(r1GF3) // one byte
);
GFMul2 row2_GF2 (
    .state(r2), // one byte
    .n_state(r2GF2) // one byte
);
GFMul3 row2_GF3 (
    .state(r3), // one byte
    .n_state(r2GF3) // one byte
);
GFMul2 row3_GF2 (
    .state(r3), // one byte
    .n_state(r3GF2) // one byte
);
GFMul3 row3_GF3 (
    .state(r0), // one byte
    .n_state(r3GF3) // one byte
);


always @(*) begin
    n_r0 = r0GF2 ^ r0GF3 ^ r2 ^ r3;
    n_r1 = r0 ^ r1GF2 ^ r1GF3 ^ r3;
    n_r2 = r0 ^ r1 ^ r2GF2 ^ r2GF3;
    n_r3 = r3GF3 ^ r1 ^ r2 ^ r3GF2;
end
endmodule