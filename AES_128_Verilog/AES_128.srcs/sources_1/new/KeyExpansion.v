`timescale 1ns / 1ps
//done
module KeyExpansion (
    input [127:0]key,
    input [3:0]Nr,
    output [127:0]n_key
);
    wire [31:0]w0, w1, w2, w3;
    wire [31:0]w3Gfunc;
    reg [31:0]w4, w5, w6, w7;

    assign w0 = key[127:96];
    assign w1 = key[95:64];
    assign w2 = key[63:32];
    assign w3 = key[31:0];

    assign n_key[127:96] = w4;
    assign n_key[95:64] = w5;
    assign n_key[63:32] = w6;
    assign n_key[31:0] = w7;

    Gfunc Gfunc_w3 (
        .word(w3),
        .Nr(Nr),
        .n_word(w3Gfunc)
    );
    
    always @(*) begin
        w4 = w0 ^ w3Gfunc;
        w5 = w1 ^ w4;
        w6 = w2 ^ w5;
        w7 = w3 ^ w6;
    end

endmodule