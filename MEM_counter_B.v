module MEM_counter_B(WEB,clock,DataInB,IncB,Reset,AddrB);
input [7:0]DataInB;
input IncB,clock,Reset,WEB;
output [1:0]AddrB;
wire clock,IncB,ResetB,WEB;
wire [7:0]DataInB;
reg [1:0]AddrB;
reg [7:0] MemB[0:3]; 

always @(posedge clock)
begin
	if(!Reset)
	begin
		if((IncB == 1'b0 && WEB == 1'b1)||(IncB == 1'b1 && WEB == 1'b0))
		begin
			if(WEB)
			begin
				MemB[AddrB] <= DataInB;
			end
			if(IncB == 1'b0 && WEB == 1'b1)
			begin
				AddrB = AddrB + 1;
			end
		end
		else
		begin
         		AddrB <= 2'b00;
        	end
	end
	else
	begin
		AddrB <= 2'b00;
	end
end
endmodule
