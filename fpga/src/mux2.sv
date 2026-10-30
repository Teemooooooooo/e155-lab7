// Ellen Yu ellyu@g.hmc.edu
// Oct. 30, 2026
// a 2 input mux

module mux2(input  logic [127:0] a0, a1,
            input  logic         s,
            output logic [127:0] y);
    assign y = s ? a1 : a0;
endmodule