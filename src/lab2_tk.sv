// Author: Troy Kaufman
// Email: tkaufman@hmc.edu  
// Date: 9/6/24

/*
    This top module instantiates four other modules including a Lattice Radiant clock module. Essentially, this top file time 
    multiplexes a dual seven segment display while outputting the current sum of the two 4 bit inputs on LEDs
*/

//vsim work.lab2_tk -L iCE40UP 

module lab2_tk(input logic nreset,
               input logic [3:0] s1, s2,
               output logic [6:0] seg,
               output logic hex1_num, hex2_num,
               output logic [4:0] sum);

    logic int_osc;
    logic display_num; 
	 
    // High-speed oscillator
    HSOSC #(.CLKHF_DIV(2'b01)) hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

    hex_num_controller fsm(.clk(int_osc), .nreset(nreset), .current_hex(display_num), .hex1_num(hex1_num), .hex2_num(hex2_num));
    segment_decoder    dec(.current_hex(display_num), .s1(s1), .s2(s2), .seg(seg));
    led_sum            led(.s1(s1), .s2(s2), .sum(sum));

endmodule 