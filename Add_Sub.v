module Add_Sub(Dout1,Dout2,clock,DataInB, ADDOut, SUBOut);
input clock;
input [7:0]Dout1;
output [7:0]Dout2;
output [7:0]DataInB;
output [7:0]ADDOut, SUBOut;
wire clock;
wire [7:0]Dout1;
reg [7:0]DataInB,Dout2, ADDOut, SUBOut;
always @(negedge clock)
begin
	Dout2 <= Dout1;
end

always @(*)
begin
    ADDOut <= Dout1 + Dout2;
    SUBOut <= Dout2 - Dout1;
	if (Dout2 < Dout1)
	begin
		DataInB <= ADDOut;
	end
	else
	begin
		DataInB <= SUBOut;
	end
end
endmodule

	
