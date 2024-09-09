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

    //hex_num_controller dut(clk, reset, current_hex, hex1_num, hex2_num);
    hex_num_controller dut(clk, reset, current_hex);

    always begin
        clk = 1; #1; clk = 0; #1;
    end

    initial begin
        reset = 0; #5; reset = 1; #1;
        //#50; reset = 0; #10; reset = 1;
    end
endmodule

