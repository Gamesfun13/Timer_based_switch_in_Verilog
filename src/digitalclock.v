`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:05:03 08/17/2020 
// Design Name: 
// Module Name:    digitalclock 
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
module digitalclock(
   clk,reset,outblock1,outblock2,outblock3,seg_sec,seg_min,seg_hr );
//this is full digital clock, 6 sevensegment are required for it, 2 for second, 2 for minutes and 2 for second
//ALSO : outblock1 is for seconds , outblock2 is for minutes and outblock 3 for hours	
	
input clk,reset;//clock,reset
output [7:0]outblock1,outblock2,outblock3;//first 4 bits for unit place and next 4 for tens place
output [15:0]seg_sec,seg_min,seg_hr;//first 7 bits for unit place 7segment code and the rest 7 for ten place 7segment code

//these are the those pulse created at 10 and 6, we use them to reset the current flipflop and give it as clock
//to next one and so that next flipflop changes its value. e.g 1001->1010->0000
//																					0000->0000->0001
wire outclk10,outclk11,outclk20,outclk21,outclk30,outclk31;

wire reset_12;//this special is for when the tens place in hours is 1 and the unit place becomes 3 so it make both the hours tens and unit place to zero, looking like restart 12:59:59->00:00:00
//Note: this clock is only upto 12 as the project is for upto 12 hours, if one tries to put greater than 12 hours he cannot,
wire [5:0]resetopt;
nor resetopt1(resetopt[0],reset,outclk10);//for reseting of seconds units place
nor resetopt2(resetopt[1],reset,outclk11);//for reseting of seconds tens place
nor resetopt3(resetopt[2],reset,outclk20);//for reseting of minute unit place
nor resetopt4(resetopt[3],reset,outclk21);//for reseting of minute tens place
nor resetopt5(resetopt[4],reset,outclk30,reset_12);//for reseting of hours unit place
nor resetopt6(resetopt[5],reset,outclk31,reset_12);//for reseting of hours tens place


counter1to9 block10(clk,resetopt[0],outblock1[3:0],outclk10);//seconds unit digit place
counter1to5 block11(outclk10,resetopt[1],outblock1[7:4],outclk11);//seconds tens digit place 


counter1to9 block20(outclk11,resetopt[2],outblock2[3:0],outclk20);//minute unit digit place
counter1to5 block21(outclk20,resetopt[3],outblock2[7:4],outclk21);//minute ten digit place

assign z=~outblock3[5];
and block33(reset_12,z,outblock3[4],outblock3[1],outblock3[0]);//that reset when 12:59:59-> 00:00:00

counter1to9 block30(outclk21,resetopt[4],outblock3[3:0],outclk30);//hours unit digit place
counter1to5 block31(outclk30,resetopt[5],outblock3[7:4],outclk31);//hours tens digit place

bcdto7segment seg_sec0(outblock1[3:0],seg_sec[7:0]);//second unit digit place 7segment code
bcdto7segment seg_sec1(outblock1[7:4],seg_sec[15:8]);//second ten digit place 7segment code

bcdto7segment seg_min0(outblock2[3:0],seg_min[7:0]);//minute unit digit place 7segment code
bcdto7segment seg_min1(outblock2[7:4],seg_min[15:8]);//minute ten digit place 7segment code

bcdto7segment seg_hr0(outblock3[3:0],seg_hr[7:0]);//hours unit digit place 7segment code
bcdto7segment seg_hr1(outblock3[7:4],seg_hr[15:8]);//hour tens digit place 7segment code


endmodule
