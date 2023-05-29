module DzTest;
logic clk, slrn, ena;
logic [2:0] q;

initial begin
clk=0;
forever #20 clk = ~clk;
end

initial begin
slrn=0;
#75 slrn=1;
end

initial begin
ena = 1;
forever #25 ena=~ena;
end

initial begin
#300 $stop;
end

quartus_trigger uut_inst(clk, slrn, ena, q);
endmodule
