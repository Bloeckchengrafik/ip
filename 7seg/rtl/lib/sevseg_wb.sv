`default_nettype none
module sevseg_wb (
    input  logic        i_rst,
    input  logic        i_clk,
    input  logic        i_wb_stb,
    input  logic        i_wb_we,
    input  logic [31:0] i_wb_adr,
    input  logic [31:0] i_wb_data,
    output logic        o_wb_ack,
    output logic [31:0] o_wb_data,
    output logic        o_wb_stall,

    output logic [3:0] o_d0_an,
    output logic [7:0] o_d0_seg,
    output logic [3:0] o_d1_an,
    output logic [7:0] o_d1_seg
);

assign o_wb_stall = 0; // no stalls here - we're fast as lightning!

logic [31:0] number_reg;

always_ff @(posedge i_clk) begin
    if (i_rst) begin
        number_reg <= 0;
    end
    else if (i_wb_stb && (!o_wb_stall)) begin
        if (i_wb_we)
            number_reg <= i_wb_data;
        else
            o_wb_data <= number_reg;
    end

    if (i_rst)
        o_wb_ack <= 0;
    else
        o_wb_ack <= (i_wb_stb && (!o_wb_stall));
end


sevseg_4mul m_d0 (
		.i_clk (i_clk),
		.i_number (number_reg[31:16]),
		.o_anode (o_d0_an),
		.o_seg (o_d0_seg)
);

sevseg_4mul m_d1 (
		.i_clk (i_clk),
		.i_number (number_reg[15:0]),
		.o_anode (o_d1_an),
		.o_seg (o_d1_seg)
);


endmodule
`default_nettype wire
