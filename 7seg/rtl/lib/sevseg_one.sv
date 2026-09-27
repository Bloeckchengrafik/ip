module sevseg_one(
    input  logic [3:0] i_nibble,
    output logic [7:0] o_sevseg
);
logic [6:0] o_seg_no_dot;
sevseg_nibble_conv m_nibble_conv(
    .i_nibble(i_nibble),
    .o_seg(o_seg_no_dot)
);
assign o_sevseg = ~{1'b0, o_seg_no_dot};
endmodule
