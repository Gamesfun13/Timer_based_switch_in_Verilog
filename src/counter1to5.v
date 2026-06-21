`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:49:48 08/17/2020 
// Design Name: 
// Module Name:    counter1to5 
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
module counter1to5(
  clk,reset,outp,outclk  );

//Note: the counter is useful till 6.
//this module is a counter from 000 till 111, with 0 to 6 correct values and after that a mix of greater than 6
//due to dontcares ,when the values gets 6 it creates a pulse which is used in the clock module(discussed there).
//	
input clk,reset;//clock,reset
output [3:0]outp;//output as 4bit(discussed in clock module) 
output outclk;//for pulse when 6 arrives as state
wire [6:4]f;//intemediate wires
wire [6:4]s;

//these both counters are combined in clock and are used as one, there were 4bits(0th,1st,2nd,3rd) used in
//counter1to9 module and the 3bits(4th,5th,6th) ares used here
not not4(s[4],f[4]);//bit no.4 dash or inverse
not not5(s[5],f[5]);//bit no.5 dash or inverse
not not6(s[6],f[6]);//bit no.6 dash or inverse


wire t;
xor flop5(t,f[5],f[4]);//for flipflop no.5, 5th bit

wire j,k;
and flop60(j,f[5],f[4]);
or flop61(k,j,f[6]);//for flipflop no.6, 6th bit


dflipflop flip4(f[4],s[4],clk,reset);//flipflop for 4th bit
dflipflop flip5(f[5],t,clk,reset);//flipflop for 5th bit
dflipflop flip6(f[6],k,clk,reset);//flipflop for 6th bit

wire sec_clk;
and secclk456(sec_clk,f[6],f[5],s[4]);//when 3'b110 or 6 states arrives a pulse is created


assign outp= {1'b0,f};//ouput
assign outclk=sec_clk;//the pulse

endmodule
