
`timescale 1ns / 1ps
//done
module SubBytes(  // Substitute one byte
        input [7:0]state,
        output reg [7:0]n_state
    );

    // Always block to handle state substitution using a case statement
always @(*) begin
    case (state)
        // 0 row
        8'h00: n_state = 8'h63;
        8'h01: n_state = 8'h7c;
        8'h02: n_state = 8'h77;
        8'h03: n_state = 8'h7b;
        8'h04: n_state = 8'hf2;
        8'h05: n_state = 8'h6b;
        8'h06: n_state = 8'h6f;
        8'h07: n_state = 8'hc5;
        8'h08: n_state = 8'h30;
        8'h09: n_state = 8'h01;
        8'h0a: n_state = 8'h67;
        8'h0b: n_state = 8'h2b;
        8'h0c: n_state = 8'hfe;
        8'h0d: n_state = 8'hd7;
        8'h0e: n_state = 8'hab;
        8'h0f: n_state = 8'h76;
        // 1 row
        8'h10: n_state = 8'hca;
        8'h11: n_state = 8'h82;
        8'h12: n_state = 8'hc9;
        8'h13: n_state = 8'h7d;
        8'h14: n_state = 8'hfa;
        8'h15: n_state = 8'h59;
        8'h16: n_state = 8'h47;
        8'h17: n_state = 8'hf0;
        8'h18: n_state = 8'had;
        8'h19: n_state = 8'hd4;
        8'h1a: n_state = 8'ha2;
        8'h1b: n_state = 8'haf;
        8'h1c: n_state = 8'h9c;
        8'h1d: n_state = 8'ha4;
        8'h1e: n_state = 8'h72;
        8'h1f: n_state = 8'hc0;
        // 2 row
        8'h20: n_state = 8'hb7;
        8'h21: n_state = 8'hfd;
        8'h22: n_state = 8'h93;
        8'h23: n_state = 8'h26;
        8'h24: n_state = 8'h36;
        8'h25: n_state = 8'h3f;
        8'h26: n_state = 8'hf7;
        8'h27: n_state = 8'hcc;
        8'h28: n_state = 8'h34;
        8'h29: n_state = 8'ha5;
        8'h2a: n_state = 8'he5;
        8'h2b: n_state = 8'hf1;
        8'h2c: n_state = 8'h71;
        8'h2d: n_state = 8'hd8;
        8'h2e: n_state = 8'h31;
        8'h2f: n_state = 8'h15;
        // 3 row
        8'h30: n_state = 8'h04;
        8'h31: n_state = 8'hc7;
        8'h32: n_state = 8'h23;
        8'h33: n_state = 8'hc3;
        8'h34: n_state = 8'h18;
        8'h35: n_state = 8'h96;
        8'h36: n_state = 8'h05;
        8'h37: n_state = 8'h9a;
        8'h38: n_state = 8'h07;
        8'h39: n_state = 8'h12;
        8'h3a: n_state = 8'h80;
        8'h3b: n_state = 8'he2;
        8'h3c: n_state = 8'heb;
        8'h3d: n_state = 8'h27;
        8'h3e: n_state = 8'hb2;
        8'h3f: n_state = 8'h75;
        // 4 row
        8'h40: n_state = 8'h09;
        8'h41: n_state = 8'h83;
        8'h42: n_state = 8'h2c;
        8'h43: n_state = 8'h1a;
        8'h44: n_state = 8'h1b;
        8'h45: n_state = 8'h6e;
        8'h46: n_state = 8'h5a;
        8'h47: n_state = 8'ha0;
        8'h48: n_state = 8'h52;
        8'h49: n_state = 8'h3b;
        8'h4a: n_state = 8'hd6;
        8'h4b: n_state = 8'hb3;
        8'h4c: n_state = 8'h29;
        8'h4d: n_state = 8'he3;
        8'h4e: n_state = 8'h2f;
        8'h4f: n_state = 8'h84;
        // 5 row
        8'h50: n_state = 8'h53;
        8'h51: n_state = 8'hd1;
        8'h52: n_state = 8'h00;
        8'h53: n_state = 8'hed;
        8'h54: n_state = 8'h20;
        8'h55: n_state = 8'hfc;
        8'h56: n_state = 8'hb1;
        8'h57: n_state = 8'h5b;
        8'h58: n_state = 8'h6a;
        8'h59: n_state = 8'hcb;
        8'h5a: n_state = 8'hbe;
        8'h5b: n_state = 8'h39;
        8'h5c: n_state = 8'h4a;
        8'h5d: n_state = 8'h4c;
        8'h5e: n_state = 8'h58;
        8'h5f: n_state = 8'hcf;
        // 6 row
        8'h60: n_state = 8'hd0;
        8'h61: n_state = 8'hef;
        8'h62: n_state = 8'haa;
        8'h63: n_state = 8'hfb;
        8'h64: n_state = 8'h43;
        8'h65: n_state = 8'h4d;
        8'h66: n_state = 8'h33;
        8'h67: n_state = 8'h85;
        8'h68: n_state = 8'h45;
        8'h69: n_state = 8'hf9;
        8'h6a: n_state = 8'h02;
        8'h6b: n_state = 8'h7f;
        8'h6c: n_state = 8'h50;
        8'h6d: n_state = 8'h3c;
        8'h6e: n_state = 8'h9f;
        8'h6f: n_state = 8'ha8;
        // 7 row
        8'h70: n_state = 8'h51;
        8'h71: n_state = 8'ha3;
        8'h72: n_state = 8'h40;
        8'h73: n_state = 8'h8f;
        8'h74: n_state = 8'h92;
        8'h75: n_state = 8'h9d;
        8'h76: n_state = 8'h38;
        8'h77: n_state = 8'hf5;
        8'h78: n_state = 8'hbc;
        8'h79: n_state = 8'hb6;
        8'h7a: n_state = 8'hda;
        8'h7b: n_state = 8'h21;
        8'h7c: n_state = 8'h10;
        8'h7d: n_state = 8'hff;
        8'h7e: n_state = 8'hf3;
        8'h7f: n_state = 8'hd2;
        // 8 row
        8'h80: n_state = 8'hcd;
        8'h81: n_state = 8'h0c;
        8'h82: n_state = 8'h13;
        8'h83: n_state = 8'hec;
        8'h84: n_state = 8'h5f;
        8'h85: n_state = 8'h97;
        8'h86: n_state = 8'h44;
        8'h87: n_state = 8'h17;
        8'h88: n_state = 8'hc4;
        8'h89: n_state = 8'ha7;
        8'h8a: n_state = 8'h7e;
        8'h8b: n_state = 8'h3d;
        8'h8c: n_state = 8'h64;
        8'h8d: n_state = 8'h5d;
        8'h8e: n_state = 8'h19;
        8'h8f: n_state = 8'h73;
        // 9 row
        8'h90: n_state = 8'h60;
        8'h91: n_state = 8'h81;
        8'h92: n_state = 8'h4f;
        8'h93: n_state = 8'hdc;
        8'h94: n_state = 8'h22;
        8'h95: n_state = 8'h2a;
        8'h96: n_state = 8'h90;
        8'h97: n_state = 8'h88;
        8'h98: n_state = 8'h46;
        8'h99: n_state = 8'hee;
        8'h9a: n_state = 8'hb8;
        8'h9b: n_state = 8'h14;
        8'h9c: n_state = 8'hde;
        8'h9d: n_state = 8'h5e;
        8'h9e: n_state = 8'h0b;
        8'h9f: n_state = 8'hdb;
        // a row
        8'ha0: n_state = 8'he0;
        8'ha1: n_state = 8'h32;
        8'ha2: n_state = 8'h3a;
        8'ha3: n_state = 8'h0a;
        8'ha4: n_state = 8'h49;
        8'ha5: n_state = 8'h06;
        8'ha6: n_state = 8'h24;
        8'ha7: n_state = 8'h5c;
        8'ha8: n_state = 8'hc2;
        8'ha9: n_state = 8'hd3;
        8'haa: n_state = 8'hac;
        8'hab: n_state = 8'h62;
        8'hac: n_state = 8'h91;
        8'had: n_state = 8'h95;
        8'hae: n_state = 8'he4;
        8'haf: n_state = 8'h79;
        // b row
        8'hb0: n_state = 8'he7;
        8'hb1: n_state = 8'hc8;
        8'hb2: n_state = 8'h37;
        8'hb3: n_state = 8'h6d;
        8'hb4: n_state = 8'h8d;
        8'hb5: n_state = 8'hd5;
        8'hb6: n_state = 8'h4e;
        8'hb7: n_state = 8'ha9;
        8'hb8: n_state = 8'h6c;
        8'hb9: n_state = 8'h56;
        8'hba: n_state = 8'hf4;
        8'hbb: n_state = 8'hea;
        8'hbc: n_state = 8'h65;
        8'hbd: n_state = 8'h7a;
        8'hbe: n_state = 8'hae;
        8'hbf: n_state = 8'h08;
        // c row
        8'hc0: n_state = 8'hba;
        8'hc1: n_state = 8'h78;
        8'hc2: n_state = 8'h25;
        8'hc3: n_state = 8'h2e;
        8'hc4: n_state = 8'h1c;
        8'hc5: n_state = 8'ha6;
        8'hc6: n_state = 8'hb4;
        8'hc7: n_state = 8'hc6;
        8'hc8: n_state = 8'he8;
        8'hc9: n_state = 8'hdd;
        8'hca: n_state = 8'h74;
        8'hcb: n_state = 8'h1f;
        8'hcc: n_state = 8'h4b;
        8'hcd: n_state = 8'hbd;
        8'hce: n_state = 8'h8b;
        8'hcf: n_state = 8'h8a;
        // d row
        8'hd0: n_state = 8'h70;
        8'hd1: n_state = 8'h3e;
        8'hd2: n_state = 8'hb5;
        8'hd3: n_state = 8'h66;
        8'hd4: n_state = 8'h48;
        8'hd5: n_state = 8'h03;
        8'hd6: n_state = 8'hf6;
        8'hd7: n_state = 8'h0e;
        8'hd8: n_state = 8'h61;
        8'hd9: n_state = 8'h35;
        8'hda: n_state = 8'h57;
        8'hdb: n_state = 8'hb9;
        8'hdc: n_state = 8'h86;
        8'hdd: n_state = 8'hc1;
        8'hde: n_state = 8'h1d;
        8'hdf: n_state = 8'h9e;
        // e row
        8'he0: n_state = 8'he1;
        8'he1: n_state = 8'hf8;
        8'he2: n_state = 8'h98;
        8'he3: n_state = 8'h11;
        8'he4: n_state = 8'h69;
        8'he5: n_state = 8'hd9;
        8'he6: n_state = 8'h8e;
        8'he7: n_state = 8'h94;
        8'he8: n_state = 8'h9b;
        8'he9: n_state = 8'h1e;
        8'hea: n_state = 8'h87;
        8'heb: n_state = 8'he9;
        8'hec: n_state = 8'hce;
        8'hed: n_state = 8'h55;
        8'hee: n_state = 8'h28;
        8'hef: n_state = 8'hdf;
        // f row
        8'hf0: n_state = 8'h8c;
        8'hf1: n_state = 8'ha1;
        8'hf2: n_state = 8'h89;
        8'hf3: n_state = 8'h0d;
        8'hf4: n_state = 8'hbf;
        8'hf5: n_state = 8'he6;
        8'hf6: n_state = 8'h42;
        8'hf7: n_state = 8'h68;
        8'hf8: n_state = 8'h41;
        8'hf9: n_state = 8'h99;
        8'hfa: n_state = 8'h2d;
        8'hfb: n_state = 8'h0f;
        8'hfc: n_state = 8'hb0;
        8'hfd: n_state = 8'h54;
        8'hfe: n_state = 8'hbb;
        8'hff: n_state = 8'h16;
        default: n_state = 8'h00; // Default case if none match
    endcase
end
endmodule
