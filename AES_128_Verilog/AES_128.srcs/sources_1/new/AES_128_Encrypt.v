module AES_128_Encrypt (
    input [127:0] plaintext,
    input [127:0] key,
    input reset_n,
    input clk,
    output done,
    output [127:0] ciphertext
);

localparam [3:0]IDLE = 4'd0,
            OVER = 4'd3,
            RUN = 4'd2,
            PREROUND = 4'd1;

//variable definition str----------------------------
reg [3:0]curr_state;
reg [3:0]next_state;
reg [127:0]state;
reg [127:0]roundkey;
reg [3:0]round_cnt;

wire [127:0] addroundkey_state, addroundkey_key;
wire [127:0] addroundkey_nstate;

wire [127:0] subBytes_state;
wire [127:0] subBytes_nstate;

wire [127:0] ShiftRows_state;
wire [127:0] ShiftRows_nstate;

wire [127:0] MixColumns_state;
wire [127:0] MixColumns_nstate;

wire [3:0] KeyExpansion_Nr;
wire [127:0] KeyExpansion_key;
wire [127:0] KeyExpansion_nkey;

//variable definition end----------------------------

//ALU sharing str----------------------------------
AddRoundKey AddRoundKey0 (
    .state(addroundkey_state),
    .roundkey(addroundkey_key),
    .n_state(addroundkey_nstate)
);

SubBytes_128 SubBytes_128_inst0(
    .subBytes_state(subBytes_state),
    .subBytes_nstate(subBytes_nstate)
);

ShiftRows ShiftRows0(  
    .state(ShiftRows_state),
    .n_state(ShiftRows_nstate)
);

MixColumns_128 MixColumns_128_inst0(
    .MixColumns_state(MixColumns_state),
    .MixColumns_nstate(MixColumns_nstate)
);

KeyExpansion KeyExpansion0(
    .key(KeyExpansion_key),
    .Nr(KeyExpansion_Nr),
    .n_key(KeyExpansion_nkey)
);


assign done = (curr_state == OVER) ? 1'b1 : 1'b0;
assign ciphertext = state;
//ALU sharing end----------------------------------

//state control str----------------------------------
always @(posedge clk or negedge reset_n) begin
    if(!reset_n)curr_state <= IDLE;
    else curr_state <= next_state;
end

always @(*) begin
    case(curr_state)
        IDLE:begin
            next_state = PREROUND;
        end
        PREROUND:begin
            next_state = RUN;
        end
        RUN:begin
            if (round_cnt == 9) next_state = OVER;
            else next_state = RUN;
        end
        OVER:begin
            next_state = IDLE;
        end
        default: next_state = IDLE;
    endcase
end
//state control end----------------------------------

//RTL operation str----------------------------------
always @(posedge clk) begin
    case(curr_state)
        IDLE:begin
            round_cnt <= 4'd0;
            state <= 128'd0;
            roundkey <= 128'd0;
        end
        PREROUND:begin
            state <= addroundkey_nstate;
            roundkey <= key;
        end
        RUN:begin
            state <= addroundkey_nstate;
            roundkey <= KeyExpansion_nkey;
            
            if (round_cnt == 9) round_cnt <= 4'd0;
            else round_cnt <= round_cnt + 4'd1;
        end
        OVER:begin

        end
    endcase
end
//RTL operation end----------------------------------

//Combinational operation str------------------------
assign addroundkey_key = (curr_state == PREROUND) ? key :
                         (curr_state == RUN) ? KeyExpansion_nkey : 
                         128'd0;
assign addroundkey_state = (curr_state == PREROUND) ? plaintext : 
                           (curr_state == RUN && round_cnt < 9) ? MixColumns_nstate :
                           (curr_state == RUN && round_cnt >= 9) ? ShiftRows_nstate :
                           128'd0;
assign subBytes_state = (curr_state == RUN) ? state : 128'd0;
assign ShiftRows_state = (curr_state == RUN) ? subBytes_nstate : 128'd0;
assign MixColumns_state = (curr_state == RUN) ? ShiftRows_nstate : 128'd0;
assign KeyExpansion_key = (curr_state == RUN) ? roundkey : 128'd0;
assign KeyExpansion_Nr = (curr_state == RUN) ? round_cnt : 4'd0;
//Combinational operation end------------------------
endmodule