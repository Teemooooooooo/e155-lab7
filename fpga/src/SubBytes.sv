//

module SubBytes(input  logic [127:0] a,
				input  logic clk,
                output logic [127:0] y);

    logic [0:3][0:3][7:0] state, sub_state;
    
    input_to_state input_to_state_sub(.a,.y(state));

    sbox_sync sbox00(.a(state[0][0]), .y(sub_state[0][0]), .clk); 
    sbox_sync sbox01(.a(state[0][1]), .y(sub_state[0][1]), .clk); 
    sbox_sync sbox02(.a(state[0][2]), .y(sub_state[0][2]), .clk); 
    sbox_sync sbox03(.a(state[0][3]), .y(sub_state[0][3]), .clk); 

    sbox_sync sbox10(.a(state[1][0]), .y(sub_state[1][0]), .clk); 
    sbox_sync sbox11(.a(state[1][1]), .y(sub_state[1][1]), .clk); 
    sbox_sync sbox12(.a(state[1][2]), .y(sub_state[1][2]), .clk); 
    sbox_sync sbox13(.a(state[1][3]), .y(sub_state[1][3]), .clk);  

    sbox_sync sbox20(.a(state[2][0]), .y(sub_state[2][0]), .clk); 
    sbox_sync sbox21(.a(state[2][1]), .y(sub_state[2][1]), .clk); 
    sbox_sync sbox22(.a(state[2][2]), .y(sub_state[2][2]), .clk); 
    sbox_sync sbox23(.a(state[2][3]), .y(sub_state[2][3]), .clk); 

    sbox_sync sbox30(.a(state[3][0]), .y(sub_state[3][0]), .clk); 
    sbox_sync sbox31(.a(state[3][1]), .y(sub_state[3][1]), .clk); 
    sbox_sync sbox32(.a(state[3][2]), .y(sub_state[3][2]), .clk); 
    sbox_sync sbox33(.a(state[3][3]), .y(sub_state[3][3]), .clk); 
    
    
    state_to_output state_to_output_sub(.a(sub_state), .y);


endmodule
