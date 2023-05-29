module bit_alu
(input logic [1:0] sel,
 input logic a, b,
 output logic y);
logic a_neg;
logic b_neg;
	always_comb
	begin
	a_neg = ~a;
	b_neg = ~b;
		case(sel)
			2'b00: y = ~(a_neg & b_neg);
			2'b01: y =  a_neg & b_neg;
			2'b10: y = ~(a_neg | b_neg);
			2'b11: y = a_neg | b_neg;
		endcase
	end
	
endmodule
