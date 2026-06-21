`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:11:53 08/19/2020 
// Design Name: 
// Module Name:    mainmodule 
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
module mainmodule(
  start,clk,reset,y,sec,min,hr,out_sec,out_min,out_hr,clkout_sec,clkout_min,clkout_hr,seg_sec,seg_min,seg_hr,clkseg_sec,clkseg_min,clkseg_hr );
input reset,clk,start;//reset,clock,start
input [6:0] sec;//seconds input
input [6:0] min;//minute input
input [4:0] hr;//hours input
output y;//the output of whole device, when the clock value matches user values it gets zero
output [15:0]seg_sec,seg_min,seg_hr;//output for 7segment code of sec,min,hour respectively of user input
output [7:0] out_sec,out_min,out_hr;//output of sec,min,hour respectively of user input
output [15:0]clkseg_sec,clkseg_min,clkseg_hr;//output for 7segment code of sec,min,hour respectively of clock output
output [7:0] clkout_sec,clkout_min,clkout_hr;//output for sec,min,hour respectively of clock output
wire yout;
//this for starting and stoping the clock midway, or when the output of clock and user input matches 
//the digital clock stops at that time.
wire fclock,optclk;
and start0(fclock,start,yout);
and start1(optclk,fclock,clk);

fullinput input0(sec,min,hr,out_sec,out_min,out_hr,seg_sec,seg_min,seg_hr);//the full input by user corrected
digitalclock clock(optclk,reset,clkout_sec,clkout_min,clkout_hr,clkseg_sec,clkseg_min,clkseg_hr);//the clock starts from 00:00:00
comparator comp({out_sec,out_min,out_hr},{clkout_sec,clkout_min,clkout_hr},yout);//the comparator 
assign y=yout;//the output switch which is on when clock and inout not match and zero when matches

endmodule




