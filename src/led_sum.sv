// Author: Troy Kaufman
// Email: tkaufman@hmc.edu  
// Date: 9/7/24

/*
    This module sums the two DIP switch inputs.
*/

module led_sum(input logic [3:0] s1, s2,
               output logic [4:0] sum);

    assign sum = s1 + s2;
    
endmodule