`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:30:44 08/17/2020 
// Design Name: 
// Module Name:    counter1to9 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module counter1to9(
    clk,reset,outp,outclk);
//Note: the counter is useful till 10.
//this module is a counter from 0000 till 1111, with 0 to 10 correct values and after that a mix of greater than 9
//due to dontcares ,when the values gets 10 it creates a pulse which is used in the clock module(discussed there).
//	 
	 
input clk,reset;//clock,reset
output [3:0]outp;//4 bit output	 
output outclk;//the pulse created when 4'b1010 or 10 arrives
	 
wire [3:0]f;//intermediate wires
wire [3:0]s;

not not0(s[0],f[0]);//bit no.0 dash or inverse
not not1(s[1],f[1]);//bit no.1 dash or inverse
not not2(s[2],f[2]);//bit no.2 dash or inverse
not not3(s[3],f[3]);//bit no.3 dash or inverse

wire z;
xor flop1(z,f[1],f[0]);//for fliflop no.1 , 1st bit

wire x,y;
and flop20(x,f[0],f[1]);
xor flop21(y,f[2],x);//for fliflop no.2 , 2nd bit

wire p,q;
and flop30(p,f[2],f[1],f[0]);//for fliflop no.3 ,3rd bit
or  flop31(q,f[3],p);

dflipflop flip0(f[0],s[0],clk,reset);//flipflop for  0th bit
dflipflop flip1(f[1],z,clk,reset);//flipflop for 1st bit
dflipflop flip2(f[2],y,clk,reset);//flipflop for 2nd bit
dflipflop flip3(f[3],q,clk,reset);//flipflop for 3rd bit

wire sec_clk;
and secclk0123(sec_clk,f[3],s[2],f[1],s[0]);//when the state is at 4'b1010 or 10 pulse is created

assign outp=f;//f iss assigned to output
assign outclk=sec_clk;//the pulse at 10 is also ouputted

endmodule
