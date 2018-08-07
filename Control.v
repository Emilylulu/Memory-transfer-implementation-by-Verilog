module Control(clock,Reset,WEA,WEB,IncA,IncB,counter);
input clock,Reset;
output WEA,WEB,IncA,IncB;
output [4:0] counter;
wire clock, Reset;
reg WEA,WEB,IncA,IncB;
reg [4:0] counter = 5'b00000;

always @(posedge clock)
begin
	if(Reset == 1'b1 || counter == 5'b10010)
	begin
		assign counter = 5'b0;
	end
	else
	begin
		assign counter = counter + 1;
	end
	//WEA = 1
	if (counter == 5'b00001 || counter == 5'b00010 || counter == 5'b00011 || counter == 5'b00100 || counter == 5'b00101 || counter == 5'b00110 || counter == 5'b00111 || counter == 5'b01000)
	//if (counter >= 5'd1 && counter <= 5'd8) 
	begin
		assign  WEA = 1'b1;
	end
	else//WEA = 0
	begin
        assign WEA = 1'b0;
    end
    
    //IncA = 1
	if(counter != 5'b10001 && counter != 5'b10010 && counter != 5'b10011)
 	begin
		assign IncA = 1;
	end
	else // IncA = 0
	begin
        assign IncA = 0;
	end
	
	//WEB = 1
	if(counter == 5'b01011 || counter == 5'b01101 || counter == 5'b01111 || counter == 5'b10001)
	begin
		assign WEB = 1;
	end
	else//WEB = 0
	begin
        assign WEB = 0;
	end
	//IncB = 1
	if(counter == 5'b01100 || counter == 5'b01110 || counter == 5'b10000 || counter == 5'b10010)
	begin
		assign IncB = 1;
	end
	else //IncB = 0
	begin
        assign IncB = 0;
	end
end
endmodule
