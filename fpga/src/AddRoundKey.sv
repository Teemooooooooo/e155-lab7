

module AddRoundKey(input  logic [127:0] a,
                   input  logic [127:0] key, 
                   output logic [127:0] y);
    assign y = a ^ key;

endmodule