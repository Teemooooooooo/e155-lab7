// Ellen Yu ellyu@g.hmc.edu
// Oct. 30, 2026
// Takes in the round key and encrypt the input message using the key

module AddRoundKey(input  logic [127:0] a,
                   input  logic [127:0] key, 
                   output logic [127:0] y);
    assign y = a ^ key;

endmodule