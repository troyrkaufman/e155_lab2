// Author: Troy Kaufman
// Email: tkaufman@hmc.edu  
// Date: 9/6/24

/*
    This module creates a time multiplexing FSM. It will toggle set and reset to two wires respectively to turn on one hexadecimal
    number at a time on the dual 7-segment display
*/

// current_hex encoding: 0 = 1st hex number; 1 = 2nd hex number
typedef enum logic [1:0] {S0 = 0; S1 = 1; S2 = 2;} statetype;
statetype state, nextstate;

module hex_num_controller(input logic clk, reset,
                          output logic current_hex,
                          output logic hex1_num, hex2_num);

    logic [20:0] counter;

    parameter counter_limit = 'd100_000;

    // Build State Registers
    always_ff@(posedge clk)
        if (~reset)
            begin
                state <= S0;
                counter <= 0;
            end
        else
            begin
                state <= nextstate;
                counter <= counter + 1;
            end
    // Next State Logic
    always_comb
        begin
            case(state)
                S0: nextstate = S1;
                S1: if (counter == counter_limit) nextstate = S2;
                   else nextstate = S1;
                S2: if (counter == counter_limit) nextstate = S1;
                   else nextstate = S2;
            endcase
        end 

    //Output Logic
    always_comb
        begin
            case(state)
                S0: 
                    begin
                        current_hex = 0;
                        hex1_num = 1;
                        hex2_num = 2;
                    end
                S1:
                    begin
                        current_hex = 0;
                        hex1_num = 0;
                        hex2_num = 1;
                    end
                S2:
                    begin
                        current_hex = 1;
                        hex1_num = 1;
                        hex2_num = 0;
                    end
            endcase
        end


endmodule