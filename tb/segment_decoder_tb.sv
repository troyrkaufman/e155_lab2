


module segment_decoder_tb();
    logic current_hex;
    logic [3:0] s1, s2;
    logic [6:0] seg;

    segment_decoder dut(current_hex, s1, s2, seg);

    initial begin
        current_hex = 0;
        #5; s1 = 'd4; s2 = 'd5;
        #5; s1 = 'd8; s2 = 'd13;
        current_hex = 1;
        #5; s1 = 'd1; s2 = 'd1;
        #5; s1 = 'd0; s2 = 'd5;
        current_hex = 0;
        #5; s1 = 'd12; s2 = 'd5;
        #5; s1 = 'd3; s2 = 'd59;
        current_hex = 1;
        #5; s1 = 'd0; s2 = 'd0;
        #5; s1 = 'd15; s2 = 'd15;
        current_hex = 0;
    end
endmodule