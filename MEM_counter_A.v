module MEM_counter_A (IncA,Reset,clock,WEA,DataInA,Dout1,AddrA);
input IncA,WEA,Reset,clock;
input [7:0]DataInA;
output [7:0]Dout1;
output [2:0]AddrA;
wire IncA,Reset,clock,WEA;
reg [2:0]AddrA;
reg [7:0]Dout1;
reg [7:0]MemA[0:7];
always @(negedge clock)
begin

if(!Reset)
begin
	if(IncA && WEA && !(DataInA === 8'bz))
	begin
        MemA[AddrA] = DataInA;
        AddrA = AddrA + 1;
    end
    else if(IncA && !WEA)
    begin
        Dout1 = MemA[AddrA];
        AddrA = AddrA + 1;
    end
    else if(!IncA && WEA && !(DataInA === 8'bz))
    begin
        MemA[AddrA] = DataInA;
    end
    else if(!IncA && !WEA)
    begin
        Dout1 = MemA[AddrA];
    end

end
else
begin
	AddrA = 3'b000;
	Dout1 = 8'bz;
end

end

endmodule
