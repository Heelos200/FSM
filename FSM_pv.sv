module FSM_pv(input KEY0, SW0, SW1, SW2, SW3, SW4, 
	output reg [6:0] HEX0, HEX1, HEX2, HEX3, 
	output reg LEDR0, LEDR1, LEDR2, LEDR3, LEDR4, LEDR5, LEDR6);

FSM hm (
.KEY0(KEY0),
.SW0(SW0), 
.SW1(SW1), 
.SW2(SW2), 
.SW3(SW3), 
.SW4(SW4),
.Z(LEDR5),
.HEX0(HEX0), 
.HEX1(HEX1), 
.HEX2(HEX2), 
.HEX3(HEX3));
assign LEDR0 = SW0; 
assign LEDR1 = SW1;
assign LEDR2 = SW2;
assign LEDR3 = SW3;
assign LEDR4 = SW4;     
assign LEDR6 = LEDR5;

endmodule



