`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:05:30 08/15/2020 
// Design Name: 
// Module Name:    counter 
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
module counter(
    clk,reset,outp,outclk);
input clk,reset;
output [7:0]outp;
output outclk;
wire [6:0]f;
wire [6:0]s;



wire sec_clk;
wire reset0123;
nor resetopt0123(reset0123,reset,sec_clk);

wire sec_clk2;
wire reset456;
nor resetopt456(reset456,reset,sec_clk2);


not not0(s[0],f[0]);
not not1(s[1],f[1]);
not not2(s[2],f[2]);
not not3(s[3],f[3]);
not not4(s[4],f[4]);
not not5(s[5],f[5]);
not not6(s[6],f[6]);

wire z;
xor flop1(z,f[1],f[0]);

wire x,y;
and flop20(x,f[0],f[1]);
xor flop21(y,f[2],x);

wire p,q;
and flop30(p,f[2],f[1],f[0]);
or  flop31(q,f[3],p);

wire t;
xor flop5(t,f[5],f[4]);

wire j,k;
and flop60(j,f[5],f[4]);
or flop61(k,j,f[6]);

dflipflop flip0(f[0],s[0],clk,reset0123);
dflipflop flip1(f[1],z,clk,reset0123);
dflipflop flip2(f[2],y,clk,reset0123);
dflipflop flip3(f[3],q,clk,reset0123);

and secclk0123(sec_clk,f[3],s[2],f[1],s[0]);
and secclk456(sec_clk2,f[6],f[5],s[4]);
and secclk4567(outclk,f[6],s[5],f[4],f[3],s[2],s[1],f[0]);

dflipflop flip4(f[4],s[4],sec_clk,reset456);
dflipflop flip5(f[5],t,sec_clk,reset456);
dflipflop flip6(f[6],k,sec_clk,reset456);

assign outp= {1'b0,f};

endmodule
