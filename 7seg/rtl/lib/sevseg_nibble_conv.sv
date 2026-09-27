module sevseg_nibble_conv (
    input  logic [3:0] i_nibble,
    output logic [6:0] o_seg
);

always_comb begin
    case (i_nibble)
        4'h0: o_seg = 7'b0111111;
        4'h1: o_seg = 7'b0000110;
        4'h2: o_seg = 7'b1011011;
        4'h3: o_seg = 7'b1001111;
        4'h4: o_seg = 7'b1100110;
        4'h5: o_seg = 7'b1101101;
        4'h6: o_seg = 7'b1111101;
        4'h7: o_seg = 7'b0000111;
        4'h8: o_seg = 7'b1111111;
        4'h9: o_seg = 7'b1101111;
        4'hA: o_seg = 7'b1110111;
        4'hB: o_seg = 7'b1111100;
        4'hC: o_seg = 7'b0111001;
        4'hD: o_seg = 7'b1011110;
        4'hE: o_seg = 7'b1111001;
        4'hF: o_seg = 7'b1110001;
        default: o_seg = 7'b0000000;
    endcase
end

endmodule
