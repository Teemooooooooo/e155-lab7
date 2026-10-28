
module AES_fsm(
    input  logic  clk, load, last,
    output logic [2:0] op,
    output logic done);
    typedef enum logic [1:0] {FIRST_R, MIDDLE_R, LAST_R, END_R} statetype;
    statetype state, nextstate;

    always_ff @(posedge clk)
        if (load) state <= FIRST_R;
        else state <= nextstate;

    always_comb
        case (state)
            FIRST_R:                      begin nextstate = MIDDLE_R; op = 3'b000; end
            MIDDLE_R:  if (last)          begin nextstate = LAST_R;   op = 3'b111; end
                       else               begin nextstate = MIDDLE_R; op = 3'b111; end
            LAST_R:                       begin nextstate = END_R;    op = 3'b110; end
            END_R:                        begin nextstate = END_R;    op = 3'b000; end
			default:                      begin nextstate = FIRST_R;  op = 3'b000; end
        endcase
    assign done = (state == END_R);


endmodule