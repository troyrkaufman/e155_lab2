// Author: Troy Kaufman
// Email: tkaufman@g.hmc.edu
// Date 9/7/24

/*
    This module tests the entire system design including time multiplexing and addition
*/
`timescale 1ns/1ns


module lab2_tk_tb();
    logic reset;
    logic [3:0] s1, s2;
    logic [6:0] seg;
    logic hex1_num, hex2_num;
    logic [4:0] sum;

    lab2_tk dut(reset, s1, s2, seg, hex1_num, hex2_num, sum);

    // No need to generate clock. The top file instantiates a clock IP

    initial begin
        reset = 0; #22; reset = 1;

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