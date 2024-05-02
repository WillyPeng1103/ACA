`timescale 1ns / 1ps
//done
module ShiftRows(  
    input [127:0]state,
    output [127:0]n_state
);

// first row
assign n_state[127:120] = state[127:120];
assign n_state[95:88] = state[95:88];
assign n_state[63:56] = state[63:56];
assign n_state[31:24] = state[31:24];
// second row
assign n_state[119:112] = state[87:80];
assign n_state[87:80] = state[55:48];
assign n_state[55:48] = state[23:16];
assign n_state[23:16] = state[119:112];
// third row
assign n_state[111:104] = state[47:40];
assign n_state[79:72] = state[15:8];
assign n_state[47:40] = state[111:104];
assign n_state[15:8] = state[79:72];
// forth row 
assign n_state[103:96] = state[7:0];
assign n_state[71:64] = state[103:96];
assign n_state[39:32] = state[71:64];
assign n_state[7:0] = state[39:32];
endmodule