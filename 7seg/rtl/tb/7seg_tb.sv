`timescale 1ns/1ps

module sevseg_4mul_tb;

    logic i_clk = 0;
    logic [15:0] i_number;

    logic [3:0] o_anode;
    logic [7:0] o_seg;

    sevseg_4mul dut (
        .i_clk(i_clk),
        .i_number(i_number),
        .o_anode(o_anode),
        .o_seg(o_seg)
    );

    always #5 i_clk = ~i_clk;

    initial begin
        $dumpfile("sevseg_4mul.vcd");
        $dumpvars(0, sevseg_4mul_tb);

        i_number = 16'h0000;

        for (int i = 0; i < 16; i++) begin
            i_number = {12'h000, i[3:0]};
            #10000000;
        end

        $finish;
    end

endmodule
