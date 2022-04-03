module FSM(input KEY0, SW0, SW1, SW2, SW3, SW4, output [6:0] HEX3, HEX2, HEX1, HEX0, output reg [2:0] state, output reg[1:0] Z);
reg [7:0] Message [4:0];

initial begin

   state <= 3'b000;

end

always @(posedge KEY0)
begin

if(SW0)     //synchronous reset
state <= 3'b000;
else
  
case(state)

//S0
3'b000 : begin   
if(SW4)
state <= 3'b001;
else if(SW3)
state <= 3'b011;
end

//S1
3'b001 : begin
if(SW2)
    state <= 3'b010;
end

//S2
3'b010 : begin
if(SW2)
    state <= 3'b011;
else if (SW3)
    state <= 3'b001;
end

//S3
3'b011 : begin
if(SW1)
    state <= 3'b100;
else if(SW3)
    state <= 3'b001;
end

//S4
3'b100 : begin
if(SW1)
    state <= 3'b000;
else if(SW4)
    state <= 3'b001;
end

default : state <= 3'b000;


endcase
end

always@(state)
begin
case(state)
3'b000 : begin
Z = 2'b00;
end
3'b001 : begin
Z = 2'b11;
end
3'b010 : begin
Z = 2'b00;
end
3'b011 : begin
Z = 2'b10;
end
3'b100 : begin
Z = 2'b01;
end
default: Z = 2'bZZ;
endcase
end

always@(*) begin
Message[3] = "A";
Message[2] = "l";
Message[1] = "m";
Message[0] = "o";
case (state)
//S0
3'b000 : begin
	Message[3] = "A";
	Message[2] = "l";
	Message[1] = "m";
	Message[0] = "o";
    	end
//S1
3'b001 : begin
	Message[3] = "S";
	Message[2] = "_";
	Message[1] = "0";
	Message[0] = "1";
	end
//S2
3'b010 : begin
	Message[3] = "S";
	Message[2] = "_";
	Message[1] = "0";
	Message[0] = "2";
	end
//S3
3'b011 : begin
	Message[3] = "S";
	Message[2] = "_";
	Message[1] = "0";
	Message[0] = "3";
	end
//S4
3'b100 : begin
	Message[3] = "S";
	Message[2] = "_";
	Message[1] = "0";
	Message[0] = "4";
	end
endcase
end

ASCII27Seg SevH3 (Message[3], HEX3);
ASCII27Seg SevH2 (Message[2], HEX2);
ASCII27Seg SevH1 (Message[1], HEX1);
ASCII27Seg SevH0 (Message[0], HEX0);

endmodule



