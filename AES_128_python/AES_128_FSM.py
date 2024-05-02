Nr = 10  # Rounds of AES-128 needed

# S-box
Sbox = [0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76, 
        0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0, 
        0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,
        0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75, 
        0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84, 
        0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf, 
        0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8,
        0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2, 
        0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73, 
        0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb, 
        0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,
        0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08, 
        0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a, 
        0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e, 
        0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf, 
        0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16]


# Round constant
Rcon = [0x8d, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36]


def SubBytes(state):
    for i in range(16):
        state[i] = Sbox[state[i]]
    return state


def ShiftRows(state):
    state[4], state[5], state[6], state[7] = state[5], state[6], state[7], state[4]
    state[8], state[9], state[10], state[11] = state[10], state[11], state[8], state[9]
    state[12], state[13], state[14], state[15] = state[15], state[12], state[13], state[14]
    return state


def GFMul(state, idx):
    msb = state >> 7  # get the msb
    if (idx == 2):  # mul by 2
        state = state << 1
    else:  # mul by 3
        state = (state << 1) ^ state

    if (msb == 1):  # if before shift, the msb equal 1, then followed by XOR with 0x1b
        state = state ^ 0x1b

    return state % 0x100  # extract low 8 bits


def MixColumns(state):
    nstate = [0 for i in range(16)]
    for i in range(4):
        # Column i
        s0 = state[i]
        s1 = state[4 + i]
        s2 = state[8 + i]
        s3 = state[12 + i]

        nstate[i] = GFMul(s0, 2) ^ GFMul(s1, 3) ^ s2 ^ s3
        nstate[4 + i] = s0 ^ GFMul(s1, 2) ^ GFMul(s2, 3) ^ s3
        nstate[8 + i] = s0 ^ s1 ^ GFMul(s2, 2) ^ GFMul(s3, 3)
        nstate[12 + i] = GFMul(s0, 3) ^ s1 ^ s2 ^ GFMul(s3, 2)
    return nstate


def AddRoundKey(state, roundKey):
    for i in range(16):
        state[i] ^= roundKey[i]
    return state


def Gfunc(word, Nr):
    # RotWord
    word = [word[1], word[2], word[3], word[0]]
    # S-Box
    for i in range(4):
        word[i] = Sbox[word[i]]
    # AddRoundConstant
    word[0] ^= Rcon[Nr]
    return word


def KeyExpansion(key, Nr):
    w0 = [key[0], key[4], key[8], key[12]]
    w1 = [key[1], key[5], key[9], key[13]]
    w2 = [key[2], key[6], key[10], key[14]]
    w3 = [key[3], key[7], key[11], key[15]]

    gfunc_w3 = Gfunc(w3, Nr)
    w4 = [w0[i] ^ gfunc_w3[i] for i in range(4)]
    w5 = [w1[i] ^ w4[i] for i in range(4)]
    w6 = [w2[i] ^ w5[i] for i in range(4)]
    w7 = [w3[i] ^ w6[i] for i in range(4)]

    new_key = [
        w4[0], w5[0], w6[0], w7[0],
        w4[1], w5[1], w6[1], w7[1],
        w4[2], w5[2], w6[2], w7[2],
        w4[3], w5[3], w6[3], w7[3]
    ]
    return new_key


def encrypt(state, key):
    state = AddRoundKey(state, key)  # initial round
    # Rounds
    for round_number in range(1, 11, 1):
        state = SubBytes(state)      # SubBytes step
        state = ShiftRows(state)     # ShiftRows step
        if round_number != Nr:     # MixColumns is not performed in the last round
            state = MixColumns(state)  # MixColumns step
        key = KeyExpansion(key, round_number)  # Generate the next round key
        state = AddRoundKey(state, key)  # AddRoundKey step
    return state

##########################################################################


def print_state(state, label):
    print(label)
    for i in range(16):
        if i % 4 == 0 and i != 0:
            print()
        print(f"{state[i]:02x}", end=" ")
    print("\n")  # New line at the end for better readability


###########################################################################
# Test Cases
plaintext = [0x01, 0x89, 0xfe, 0x76,
             0x23, 0xab, 0xdc, 0x54,
             0x45, 0xcd, 0xba, 0x32,
             0x67, 0xef, 0x98, 0x10]

key = [0x0f, 0x47, 0x0c, 0xaf,
       0x15, 0xd9, 0xb7, 0x7f,
       0x71, 0xe8, 0xad, 0x67,
       0xc9, 0x59, 0xd6, 0x98]

# ---------------------------------------------------------------------
print("-----------------------------------------------")
print_state(plaintext, "Initial Text:")
print_state(key, "Initial Key:")

# # Initial round
# text = AddRoundKey(plaintext, key)

# # Rounds
# for round_number in range(1, 11, 1):
#     print("-----------------------------------------------")
#     print(f"Round {round_number}:")
#     print_state(text, f"Start of Round {round_number} Text:")

#     text = SubBytes(text)      # SubBytes step
#     print_state(text, f"After SubBytes:")

#     text = ShiftRows(text)     # ShiftRows step
#     print_state(text, f"After ShiftRows:")

#     if round_number != Nr:     # MixColumns is not performed in the last round
#         text = MixColumns(text)  # MixColumns step
#         print_state(text, f"After MixColumns:")

#     key = KeyExpansion(key, round_number)  # Generate the next round key
#     text = AddRoundKey(text, key)  # AddRoundKey step

#     print_state(key, f"Round {round_number} Key:")
# -------------------------------------------------------------
text = encrypt(plaintext, key)
print("-----------------------------------------------")
print_state(text, "Final Text:")
############################################################################
