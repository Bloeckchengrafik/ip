module boolean_top (
    input  logic       clk,
    output logic [3:0] D0_AN,
    output logic [7:0] D0_SEG,
    output logic [3:0] D1_AN,
    output logic [7:0] D1_SEG
);

logic [31:0] number;
logic [31:0] next_count_timer;

sevseg_4mul m_d0 (
		.i_clk (clk),
		.i_number (number[31:16]),
		.o_anode (D0_AN),
		.o_seg (D0_SEG)
);

sevseg_4mul m_d1 (
		.i_clk (clk),
		.i_number (number[15:0]),
		.o_anode (D1_AN),
		.o_seg (D1_SEG)
);

always_ff @(posedge clk) begin
    next_count_timer <= next_count_timer - 32'd1;
    if (next_count_timer == 32'd0) begin
        number <= number + 32'd1;
        next_count_timer <= 32'd100000;
    end
end
endmodule
