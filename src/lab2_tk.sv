module lab2_tk(input logic reset,
               input logic [3:0] s1, s2,
               output logic [6:0] seg,
               output logic hex1_num, hex2_num);

    logic int_osc;
	
    // High-speed oscillator
	HSOSC #(.CLKHF_DIV(2'b01)) hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

    hex_num_controller fsm(.int_osc(clk), .reset(reset), .display_num(current_hex), .hex1_wire(hex1_num), .hex2_wire(hex2_num));
    


endmodule