`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:08 08/15/2020 
// Design Name: 
// Module Name:    inputmodule2 
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
module inputmodule2(
  m_s,outm_s,bcdto7seg  );
//as the input of hours is different from minutes and second that is why this module is created, the hours
//are inputted through 5 bits, 4 bits for unit place and 1 bit for ten place as it can be only 1 or 0.
//also it take cares of invalid inputs like hr inputted greater than 12, disscussed below
//Note:this device is only for 12 hours, time greater than 12 hours can not be inputted 
 
  
input [4:0]m_s;   //for hours we need only five bits, 4 for unit digit place and 1 for ten digit place which can be 1 or 0
output [7:0]outm_s;//output is in 8 bits, 4bit for unit digit place, the other 4(we take four for passing it to 7segemnt) for ten digit place
output [15:0]bcdto7seg;//the first seven for unit digit place as 7segement code and the other 7 for ten digits place
wire [4:0]s;//intermediate wires


not not0(s[0],m_s[0]);// bit no. 0 dash or inverse
not not1(s[1],m_s[1]);// bit no. 1 dash or inverse
not not2(s[2],m_s[2]);// bit no. 2 dash or inverse
not not3(s[3],m_s[3]);// bit no. 3 dash or inverse
not not4(s[4],m_s[4]);// bit no. 4 dash or inverse

wire [3:0]help;
wire c,d;
and s00(c,s[2],s[1],m_s[0]);
and s01(d,s[3],m_s[0]);
or  s02(help[0],c,d);//for bit no.0

and s1(help[1],s[3],m_s[1]);//for bit no.1
and s2(help[2],s[3],m_s[2]);//for bit no.2
and s3(help[3],m_s[3],s[2],s[1]);//for bit no.3

//when the ten digit place value is 1 and the unit digit place value gets grater than 2 then it becomes invalid,
//this code give multilexer which value to choose between zero and incoming input, when the value in tens place 
//is zero it select input and when the value at tens place is 1 and the units place is greater than zero then it
//0 to make the invalid input valid
wire x,y,z,sel;
and sel1(x,m_s[4],m_s[2]);
and sel2(y,m_s[4],m_s[3]);
and sel3(z,m_s[4],m_s[1],m_s[0]);
or  sel4(sel,x,y,z);

//here are the 2x1 4 muxes that chooses from zero and the input by the sel choice
multiplexer mux1(help[3:0],{1'b0,1'b0,1'b0,1'b0},sel,outm_s[3:0]);
assign outm_s[4]=m_s[4];
assign outm_s[5]=1'b0;
assign outm_s[6]=1'b0;
assign outm_s[7]=1'b0;

bcdto7segment bcd1(outm_s[3:0],bcdto7seg[7:0]);//7segment code for unit place
bcdto7segment bcd2(outm_s[7:4],bcdto7seg[15:8]);//7segment code for digit place

endmodule
