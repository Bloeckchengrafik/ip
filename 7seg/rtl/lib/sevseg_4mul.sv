module sevseg_4mul (
    input logic i_clk,
    input logic [15:0] i_number,
    output logic [3:0] o_anode,
    output logic [7:0] o_seg
);

logic [17:0] nibble_sel_and_ctr;
logic [1:0] nibble_sel;
assign nibble_sel = nibble_sel_and_ctr[17:16];

always_ff @(posedge i_clk) begin
    nibble_sel_and_ctr <= nibble_sel_and_ctr + 18'd1; // wrap-around
end

logic [7:0] o_seg_all [3:0];

sevseg_one m_sevseg_0 (
		.i_nibble (i_number[3:0]),
		.o_sevseg (o_seg_all[0])
);

sevseg_one m_sevseg_1 (
		.i_nibble (i_number[7:4]),
		.o_sevseg (o_seg_all[1])
);

sevseg_one m_sevseg_2 (
		.i_nibble (i_number[11:8]),
		.o_sevseg (o_seg_all[2])
);

sevseg_one m_sevseg_3 (
		.i_nibble (i_number[15:12]),
		.o_sevseg (o_seg_all[3])
);

assign o_seg = o_seg_all[nibble_sel];
assign o_anode = ~(1 << nibble_sel);

endmodule
