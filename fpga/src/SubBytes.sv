//

module SubBytes(input  logic [127:0] a,
                output logic [127:0] y);

    logic [0:3][0:3][7:0] state, sub_state;
    
    input_to_state input_to_state_sub(.a,.y(state));

    sbox sbox00(.a(state[0][0]), .y(sub_state[0][0])); 
    sbox sbox01(.a(state[0][1]), .y(sub_state[0][1])); 
    sbox sbox02(.a(state[0][2]), .y(sub_state[0][2])); 
    sbox sbox03(.a(state[0][3]), .y(sub_state[0][3])); 

    sbox sbox10(.a(state[1][0]), .y(sub_state[1][0])); 
    sbox sbox11(.a(state[1][1]), .y(sub_state[1][1])); 
    sbox sbox12(.a(state[1][2]), .y(sub_state[1][2])); 
    sbox sbox13(.a(state[1][3]), .y(sub_state[1][3]));  

    sbox sbox20(.a(state[2][0]), .y(sub_state[2][0])); 
    sbox sbox21(.a(state[2][1]), .y(sub_state[2][1])); 
    sbox sbox22(.a(state[2][2]), .y(sub_state[2][2])); 
    sbox sbox23(.a(state[2][3]), .y(sub_state[2][3])); 

    sbox sbox30(.a(state[3][0]), .y(sub_state[3][0])); 
    sbox sbox31(.a(state[3][1]), .y(sub_state[3][1])); 
    sbox sbox32(.a(state[3][2]), .y(sub_state[3][2])); 
    sbox sbox33(.a(state[3][3]), .y(sub_state[3][3])); 
    
    
    state_to_output state_to_output_sub(.a(sub_state), .y);


endmodule
