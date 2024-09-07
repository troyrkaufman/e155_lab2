// Author: Troy Kaufman
// Email: tkaufman@g.hmc.edu
// Date: 9/7/24

/*
    This module tests the led_sum src code file. Reader needs to manually check outputs
*/

module led_sum_tb();
    logic [3:0] s1, s2;
    logic [4:0] sum;

    led_sum dut(s1, s2, sum);

    initial begin
        #5; s1 = 'd4; s2 = 'd5;
        #5; s1 = 'd8; s2 = 'd13;
        #5; s1 = 'd1; s2 = 'd1;
        #5; s1 = 'd0; s2 = 'd5;
        #5; s1 = 'd12; s2 = 'd5;
        #5; s1 = 'd3; s2 = 'd59;
        #5; s1 = 'd0; s2 = 'd0;
        #5; s1 = 'd15; s2 = 'd15;
    end
endmodule