

module SubWord(input  logic[31:0] a,
				input logic clk,
               output logic[31:0] y);

    sbox sboxW0(.a(a[31:24]), .y(y[31:24]));
    sbox sboxW1(.a(a[23:16]), .y(y[23:16]));
    sbox sboxW2(.a(a[15:8]), .y(y[15:8]));
    sbox sboxW3(.a(a[7:0]), .y(y[7:0]));
endmodule