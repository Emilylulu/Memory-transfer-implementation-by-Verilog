`timescale 10ps/1ps
module test;
reg Reset,clock;
reg[7:0] DataInA;
wire WEA,WEB,IncA,IncB;
wire [2:0]AddrA;
wire[7:0]Dout1,Dout2,DataInB, ADDOut, SUBOut;
wire [1:0]AddrB;
wire [4:0]counter;

Control control(
    .Reset(Reset),
    .clock(clock),
    .WEA(WEA),
    .WEB(WEB),
    .IncA(IncA),
    .IncB(IncB),
    .counter(counter)
);

MEM_counter_A mem_A(
    .IncA(IncA),
    .Reset(Reset),
    .WEA(WEA),
    .clock(clock),
    .DataInA(DataInA),
    .Dout1(Dout1),
    .AddrA(AddrA)
);

Add_Sub add(
    .Dout1(Dout1),
    .Dout2(Dout2),
    .clock(clock),
    .DataInB(DataInB),
    .ADDOut(ADDOut),
    .SUBOut(SUBOut)
);

MEM_counter_B mem_B(
    .WEB(WEB),
    .clock(clock),
    .DataInB(DataInB),
    .IncB(IncB),
    .Reset(Reset),
    .AddrB(AddrB)
);


initial
begin
	clock = 1'b0;
	Reset = 1'b1;
	DataInA = 8'b0;
	forever #10 clock = ~clock;

end

initial
begin
	#10
	DataInA = 8'b0;
	repeat(8) begin
	#20 DataInA = DataInA + 1;
	end
	DataInA = 8'bz;
end
initial
begin
    #8 Reset = ~Reset;
    #360 Reset = 1'b1;
end
endmodule
