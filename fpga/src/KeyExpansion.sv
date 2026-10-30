// Ellen Yu ellyu@g.hmc.edu
// Oct. 30, 2026
// generate the new roundkey based on previous key

module KeyExpansion(input  logic [127:0] key,
				    input  logic [3:0]   round,
                    output logic [127:0] nextkey);
    logic [31:0] w0, w1, w2, w3, w4, w5, w6, w7, w3rot, w3sub, w7rot, w7sub;
	logic [31:0] cons;

    assign w0 = key[127:96];
    assign w1 = key[95:64];
    assign w2 = key[63:32];
    assign w3 = key[31:0];
    // this is a when i is multiple of 4
    // i = 4
    RotWord RotWord4(.a(w3), .y(w3rot));
    SubWord SubWord4(.a(w3rot), .y(w3sub));
    assign w4 = w0 ^ w3sub ^ cons;

    assign w5 = w1 ^ w4;
    assign w6 = w2 ^ w5;
    assign w7 = w3 ^ w6; 

   always_comb 
	case(round)
		4'h1: cons = 32'h01000000;
		4'h2: cons = 32'h02000000;
		4'h3: cons = 32'h04000000;
		4'h4: cons = 32'h08000000;
		4'h5: cons = 32'h10000000;
		4'h6: cons = 32'h20000000;
		4'h7: cons = 32'h40000000;
		4'h8: cons = 32'h80000000;
		4'h9: cons = 32'h1b000000;
		4'ha: cons = 32'h36000000;
		default: cons = 32'h00000000;
		
	endcase

    assign nextkey = {w4, w5, w6, w7};
    


endmodule

