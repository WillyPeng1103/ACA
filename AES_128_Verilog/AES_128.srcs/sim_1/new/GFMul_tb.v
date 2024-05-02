`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/23 15:37:28
// Design Name: 
// Module Name: GFMul_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module GFMul_tb;

reg [7:0] state;
reg [1:0] idx;
wire [7:0] n_state;

GFMul uut (
    .state(state),
    .idx(idx),
    .n_state(n_state)
);

initial begin
    // 1: state = 0x87, idx = 2
    state = 8'h87; idx = 2'b10;
    #10; 
    
    $display("Test 1: state = %h, idx = %b, n_state = %h", state, idx, n_state);
    
    // 2: state = 0x6e, idx = 3
    state = 8'h6e; idx = 2'b11;
    #10; 
    
    $display("Test 2: state = %h, idx = %b, n_state = %h", state, idx, n_state);
    
    $finish;
end

endmodule

