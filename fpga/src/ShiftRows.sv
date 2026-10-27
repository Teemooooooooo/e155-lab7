
module ShiftRows(input  logic [127:0] a,
                 output logic [127:0] y);
    logic [0:3][0:3][7:0] state, shifted_state;
    
    input_to_state input_to_state_shift(.a,.y(state));
    assign shifted_state[0] = state[0];
    assign shifted_state[1] = {state[1][1], state[1][2], state[1][3], state[1][0]};
    assign shifted_state[2] = {state[2][2], state[2][3], state[2][0], state[2][1]};
    assign shifted_state[3] = {state[3][3], state[3][0], state[3][1], state[3][2]};
    state_to_output state_to_output_shift(.a(shifted_state), .y);


endmodule