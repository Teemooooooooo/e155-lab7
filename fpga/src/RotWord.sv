// Ellen Yu ellyu@g.hmc.edu
// Oct. 30, 2026
// rotate the word (used in key expansion)
module RotWord(input  logic[31:0] a,
               output logic[31:0] y);

    assign y = {a[23:0], a[31:24]};
endmodule