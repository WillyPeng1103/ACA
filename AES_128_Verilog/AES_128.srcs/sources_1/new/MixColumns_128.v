`timescale 1ns / 1ps
// done
module MixColumns_128(
        input [127:0]MixColumns_state,
        output [127:0]MixColumns_nstate
    );
    
genvar j;
generate
    for (j = 0; j < 128; j = j + 32)begin:MixColumns
        MixColumns MixColumns0( // mix one columns
            .r0(MixColumns_state[j + 31 : j + 24]),
            .r1(MixColumns_state[j + 23 : j + 16]),
            .r2(MixColumns_state[j + 15 : j + 8]),
            .r3(MixColumns_state[j + 7 : j]),
            .n_r0(MixColumns_nstate[j + 31 : j + 24]),
            .n_r1(MixColumns_nstate[j + 23 : j + 16]),
            .n_r2(MixColumns_nstate[j + 15 : j + 8]),
            .n_r3(MixColumns_nstate[j + 7 : j])
        );
    end
endgenerate
endmodule
