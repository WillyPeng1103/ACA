`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/27 16:27:03
// Design Name: 
// Module Name: SubBytes_128
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

//done
module SubBytes_128(
        input [127:0]subBytes_state,
        output [127:0]subBytes_nstate
    );

genvar i;
generate
    for (i = 0;i < 16;i = i + 1)begin:SubBytes
        SubBytes SubBytes0 (  // Substitute one byte
            .state(subBytes_state[i*8+7 : i*8]),
            .n_state(subBytes_nstate[i*8+7 : i*8])
        );
    end
endgenerate
endmodule
