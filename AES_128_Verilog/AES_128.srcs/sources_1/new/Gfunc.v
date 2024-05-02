`timescale 1ns / 1ps
//done
module Gfunc(
    input [31:0]word,
    input [3:0]Nr,
    output [31:0]n_word
);

wire [7:0]b0, b1, b2, b3;
wire [7:0]sb0, sb1, sb2, sb3;
wire [7:0]n_b0, n_b1, n_b2, n_b3;
reg [7:0]Rconsb1;

assign {b0, b1, b2, b3} = word;
assign n_word = {n_b0, n_b1, n_b2, n_b3};

// S-Box
SubBytes inst0 (  // Substitute one byte
    .state(b0),
    .n_state(sb0)
);
SubBytes inst1 (  // Substitute one byte
    .state(b1),
    .n_state(sb1)
);
SubBytes inst2 (  // Substitute one byte
    .state(b2),
    .n_state(sb2)
);
SubBytes inst3 (  // Substitute one byte
    .state(b3),
    .n_state(sb3)
);

assign n_b0 = Rconsb1;
assign n_b1 = sb2;
assign n_b2 = sb3;
assign n_b3 = sb0;


always @(*) begin
    case (Nr)
        4'd0: Rconsb1 = sb1 ^ 8'h01;
        4'd1: Rconsb1 = sb1 ^ 8'h02;
        4'd2: Rconsb1 = sb1 ^ 8'h04;
        4'd3: Rconsb1 = sb1 ^ 8'h08;
        4'd4: Rconsb1 = sb1 ^ 8'h10;
        4'd5: Rconsb1 = sb1 ^ 8'h20;
        4'd6: Rconsb1 = sb1 ^ 8'h40;
        4'd7: Rconsb1 = sb1 ^ 8'h80;
        4'd8: Rconsb1 = sb1 ^ 8'h1b;
        4'd9: Rconsb1 = sb1 ^ 8'h36;
        default: Rconsb1 = sb1;
    endcase
end

endmodule