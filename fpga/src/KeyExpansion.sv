
module KeyExpansion(input  logic [127:0] key,
                    output logic [0:10][127:0] key_schedule);
    logic [31:0] w0, w1, w2, w3, 
                 w4, w5, w6, w7, 
                 w8, w9, w10, w11,
                 w12, w13, w14, w15,
                 w16, w17, w18, w19,
                 w20, w21, w22, w23,
                 w24, w25, w26, w27,
                 w28, w29, w30, w31,
                 w32, w33, w34, w35, 
                 w36, w37, w38, w39,
                 w40, w41, w42, w43,
                 w3rot, w3sub, 
                 w7rot, w7sub,
                 w11rot, w11sub,
                 w15rot, w15sub,
                 w19rot, w19sub,
                 w23rot, w23sub,
                 w27rot, w27sub,
                 w31rot, w31sub,
                 w35rot, w35sub,
                 w39rot, w39sub;
    assign key_schedule[0] = key;

    assign w0 = key[127:96];
    assign w1 = key[95:64];
    assign w2 = key[63:32];
    assign w3 = key[31:0];
    // this is a when i is multiple of 4
    // i = 4
    RotWord RotWord4(.a(w3), .y(w3rot));
    SubWord SubWord4(.a(w3rot), .y(w3sub));
    assign w4 = w0 ^ w3sub ^ 32'h01000000;

    assign w5 = w1 ^ w4;
    assign w6 = w2 ^ w5;
    assign w7 = w3 ^ w6; 

    // i = 8
    RotWord RotWord8(.a(w7), .y(w7rot));
    SubWord SubWord8(.a(w7rot), .y(w7sub));
    assign w8 = w4 ^ w7sub ^ 32'h02000000;

    assign w9 = w5 ^ w8;
    assign w10 = w6 ^ w9;
    assign w11 = w7 ^ w10; 

    // i = 12
    RotWord RotWord12(.a(w11), .y(w11rot));
    SubWord SubWord12(.a(w11rot), .y(w11sub));
    assign w12 = w8 ^ w11sub ^ 32'h04000000;

    assign w13 = w9 ^ w12;
    assign w14 = w10 ^ w13;
    assign w15 = w11 ^ w14; 
    
    // i = 16
    RotWord RotWord16(.a(w15), .y(w15rot));
    SubWord SubWord16(.a(w15rot), .y(w15sub));
    assign w16 = w12 ^ w15sub ^ 32'h08000000;

    assign w17 = w13 ^ w16;
    assign w18 = w14 ^ w17;
    assign w19 = w15 ^ w18; 

    // i = 20
    RotWord RotWord20(.a(w19), .y(w19rot));
    SubWord SubWord20(.a(w19rot), .y(w19sub));
    assign w20 = w16 ^ w19sub ^ 32'h10000000;

    assign w21 = w17 ^ w20;
    assign w22 = w18 ^ w21;
    assign w23 = w19 ^ w22; 
    // i = 24
    RotWord RotWord24(.a(w23), .y(w23rot));
    SubWord SubWord24(.a(w23rot), .y(w23sub));
    assign w24 = w20 ^ w23sub ^ 32'h20000000;

    assign w25 = w21 ^ w24;
    assign w26 = w22 ^ w25;
    assign w27 = w23 ^ w26; 
    // i = 28
    RotWord RotWord28(.a(w27), .y(w27rot));
    SubWord SubWord28(.a(w27rot), .y(w27sub));
    assign w28 = w24 ^ w27sub ^ 32'h40000000;

    assign w29 = w25 ^ w28;
    assign w30 = w26 ^ w29;
    assign w31 = w27 ^ w30; 
    // i = 32
    RotWord RotWord32(.a(w31), .y(w31rot));
    SubWord SubWord32(.a(w31rot), .y(w31sub));
    assign w32 = w28 ^ w31sub ^ 32'h80000000;

    assign w33 = w29 ^ w32;
    assign w34 = w30 ^ w33;
    assign w35 = w31 ^ w34; 
    // i = 36
    RotWord RotWord36(.a(w35), .y(w35rot));
    SubWord SubWord36(.a(w35rot), .y(w35sub));
    assign w36 = w32 ^ w35sub ^ 32'h1b000000;

    assign w37 = w33 ^ w36;
    assign w38 = w34 ^ w37;
    assign w39 = w35 ^ w38; 
    // i = 40
    RotWord RotWord40(.a(w39), .y(w39rot));
    SubWord SubWord40(.a(w39rot), .y(w39sub));
    assign w40 = w36 ^ w39sub ^ 32'h36000000;

    assign w41 = w37 ^ w40;
    assign w42 = w38 ^ w41;
    assign w43 = w39 ^ w42;   

    assign key_schedule[1] = [w4, w5, w6, w7];
    assign key_schedule[2] = [w8, w9, w10, w11];
    assign key_schedule[3] = [w12, w13, w14, w15];
    assign key_schedule[4] = [w16, w17, w18, w19];
    assign key_schedule[5] = [w20, w21, w22, w23];
    assign key_schedule[6] = [w24, w25, w26, w27];
    assign key_schedule[7] = [w28, w29, w30, w31];
    assign key_schedule[8] = [w32, w33, w34, w35];
    assign key_schedule[9] = [w36, w37, w38, w39];
    assign key_schedule[10] = [w40, w41, w42, w43];


endmodule