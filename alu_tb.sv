`timescale 1ns/1ps
module alu_tb;

	logic [3:0] in;
	logic out, a, b;
	logic [1:0] sel;

	initial begin
		in = 0;
		repeat (2**4)
		begin
			$strobe("Input value: %b; output value: %d; testbench result: %d; equals: %d", in, out, tbResult, (out==tbResult));
			#10 in = in+1;
		end
	end
	assign a = in[3];
	assign b = in[2];
	assign sel = in[1:0];
	assign tbResult = sel[1]&(~a)&(~b) | (~sel[0])&(~sel[1])&a | sel[0]&sel[1]&(~b) | (~sel[0])&(~sel[1])&b | sel[0]&sel[1]&(~a) | (~sel[1])&a&b;

	bit_alu uut_inst(.sel(sel),.a(a),.b(b),.y(out));

endmodule
