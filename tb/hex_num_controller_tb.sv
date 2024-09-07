// Author: Troy Kaufman
// Email: tkaufman@g.hmc.edu
// Date: 9/6/24

/*
    This module sends the current hexadecimal number to the dual 7-segment display. 
*/

module hex_num_controller_tb();
    logic clk, reset;
    logic current_hex;
    logic hex1_num, hex2_num;

    hex_num_controller dut(clk, reset, current_hex, hex1_num, hex2_num);

    always begin
        clk = 1; #5; clk = 0; #5;
    end

    initial begin
        reset = 0; #22; reset = 1; #5;
        #50; reset = 0; #10; reset = 1;
    end
endmodule

