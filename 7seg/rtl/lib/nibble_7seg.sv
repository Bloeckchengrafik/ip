module nibble_7seg (
    input  logic [3:0] addr,
    output logic [6:0] data
);

always_comb begin
    case (addr)
        4'h0: data = 7'b0111111;
        4'h1: data = 7'b0000110;
        4'h2: data = 7'b1011011;
        4'h3: data = 7'b1001111;
        4'h4: data = 7'b1100110;
        4'h5: data = 7'b1101101;
        4'h6: data = 7'b1111101;
        4'h7: data = 7'b0000111;
        4'h8: data = 7'b1111111;
        4'h9: data = 7'b1101111;
        4'hA: data = 7'b1110111;
        4'hB: data = 7'b1111100;
        4'hC: data = 7'b0111001;
        4'hD: data = 7'b1011110;
        4'hE: data = 7'b1111001;
        4'hF: data = 7'b1110001;
        default: data = 7'b0000000;
    endcase
end

endmodule
