`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:06 08/15/2020 
// Design Name: 
// Module Name:    fullinput 
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
module fullinput(
  sec,min,hr,out_sec,out_min,out_hr,seg_sec,seg_min,seg_hr  );
  //this is full input module in which the user input the seconds, minute and hours and those inputted are corrected 
  //and outputted from mthis module. and used in main module(discussed there)
input [6:0] sec;//the input for seconds
input [6:0] min;//input for min,
input [4:0] hr;//input for hours
output [15:0]seg_sec,seg_min,seg_hr;//7segment code output
output [7:0] out_sec,out_min,out_hr;//bit output

inputmodule secc(sec,out_sec,seg_sec);//seconds are corrected and outputted with 7segment code as well
inputmodule minn(min,out_min,seg_min);//min are corrected and outputted with 7segment code as well
inputmodule2 hrr(hr,out_hr,seg_hr);//hours are corrected and outputted with 7segment code as well


endmodule






