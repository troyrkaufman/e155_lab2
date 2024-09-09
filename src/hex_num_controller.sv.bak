// Author: Troy Kaufman
// Email: tkaufman@hmc.edu  
// Date: 9/6/24

/*
    This module creates a time multiplexing FSM. It will toggle set and reset to two wires respectively to turn on one hexadecimal
    number at a time on the dual 7-segment display
*/

// current_hex encoding: 0 = 1st hex number; 1 = 2nd hex number


module hex_num_controller(input logic clk, reset,
                          output logic current_hex,
                          output logic hex1_num, hex2_num);
						  
	typedef enum logic [1:0] {S0 = 0, S1 = 1, S2 = 2} statetype;
	statetype state, nextstate;

    logic [24:0] counter;

    parameter counter_limit = 'd200000;

    // Build State Registers
    always_ff@(posedge clk)
		begin
        if (~reset)
            begin
                state <= S0;
                counter <= 'b0;
            end
		else if (counter == counter_limit)
			begin
				state <= nextstate;
				counter <= 'b0;
			end
        else 
            begin
                state <= nextstate;
                counter <= counter + 'b1;
            end 
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
				//default: nextstate = S2; 
            endcase
        end 

    //Output Logic
    always_comb
        begin
            case(state)
                S0: 
                    begin
                        current_hex = 'b0;
                        hex1_num = 'b1;
                        hex2_num = 'b1;
                    end
                S1:
                    begin
                        current_hex = 'b0;
                        hex1_num = 'b0;
                        hex2_num = 'b1;
                    end
                S2:
                    begin
                        current_hex = 'b1;
                        hex1_num = 'b1;
                        hex2_num = 'b0;
                    end
				default: // default to state 0 output logic
					begin
                        current_hex = 'b0;
                        hex1_num = 'b0;
                        hex2_num = 'b1;
                    end 
					
            endcase
        end


endmodule