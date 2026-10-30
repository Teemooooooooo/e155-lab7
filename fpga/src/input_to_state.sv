// Ellen Yu ellyu@g.hmc.edu
// Oct. 30, 2026
// packing the 128 bits into words (states)

module input_to_state(input  logic [127:0] a,
                      output logic [0:3][0:3][7:0] y);
    assign y[0][0] = a[127:120];
    assign y[0][1] = a[95:88];
    assign y[0][2] = a[63:56];
    assign y[0][3] = a[31:24];
    
    assign y[1][0] = a[119:112];
    assign y[1][1] = a[87:80];
    assign y[1][2] = a[55:48];
    assign y[1][3] = a[23:16];
    
    assign y[2][0] = a[111:104];
    assign y[2][1] = a[79:72];
    assign y[2][2] = a[47:40];
    assign y[2][3] = a[15:8];

    assign y[3][0] = a[103:96];
    assign y[3][1] = a[71:64];
    assign y[3][2] = a[39:32];
    assign y[3][3] = a[7:0];
    
    // assign w0 = a[127:96];
    // assign w1 = a[95:64];
    // assign w2 = a[63:32];
    // assign w3 = a[31:0];

endmodule