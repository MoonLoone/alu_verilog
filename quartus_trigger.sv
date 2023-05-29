module quartus_trigger(
	input logic clk, slrn, ena,
	output logic [2:0] q
);
always_ff @(posedge clk)
begin 
	if (slrn) q<=0;
	else begin
		q[0] <= ((q[0]&~ena) | (~q[1]&~q[2]&ena) | (q[1]&q[2]&ena));
 		q[1] <= ((q[1]&~q[2]) | (q[1]&~ena) | (~q[0]&q[1]) | (q[0]&~q[2]&ena));
		q[2] <= ((q[2]&q[0]) | (q[2]&~ena) | (q[1]&~q[0]&ena));
	end
end
endmodule