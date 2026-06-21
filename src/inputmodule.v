`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:46 08/15/2020 
// Design Name: 
// Module Name:    inputmodule 
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
module inputmodule(
  m_s,outm_s,bcdto7seg  );
// a user can input any number from 0 to 16 with the 4 bit and from 0 to 7 with 3 bits, 
//while in clock we cannot have a value greater than 9 at unit digit place and we also cannot have value 
//greater than 6 at ten digit place, so this module is for when a person input such a code which is not valid
//for a digit it turns it to zero(default). thus making it a valid input for the project(device).
//
 
  
input [6:0]m_s;//the first 4bit are for unit digitplace and the rest 3 for ten digit place of counter
output [7:0]outm_s;//output is in 8 bits, 4bit for unit digit place, the other 4(we take four for passing it to 7segemnt) for ten digit place
output [15:0]bcdto7seg;//the first seven for unit digit place as 7segement code and the other 7 for ten digits place
wire [6:0]s;//intermediate wire


not not0(s[0],m_s[0]); // bit no. 0 dash or inverse
not not1(s[1],m_s[1]); // bit no. 1 dash or inverse
not not2(s[2],m_s[2]); // bit no. 2 dash or inverse
not not3(s[3],m_s[3]); // bit no. 3 dash or inverse
not not4(s[4],m_s[4]); // bit no. 4 dash or inverse
not not5(s[5],m_s[5]); // bit no. 5 dash or inverse
not not6(s[6],m_s[6]); // bit no. 6 dash or inverse

wire c,d;     
and s00(c,s[2],s[1],m_s[0]);//for the 0th bit
and s01(d,s[3],m_s[0]);
or  s02(outm_s[0],c,d);//

and s1(outm_s[1],s[3],m_s[1]);//for 1st bit
and s2(outm_s[2],s[3],m_s[2]);//for 2nd bit
and s3(outm_s[3],m_s[3],s[2],s[1]);//for 3rd bit

wire f,g;
and s40(f,s[6],m_s[4]);
and s41(g,s[5],m_s[4]);
or  s42(outm_s[4],f,g);//for 4th bit

and s5(outm_s[5],s[6],m_s[5]);//for 5th bit
and s6(outm_s[6],m_s[6],s[5]);//for 6th bit
assign outm_s[7]=1'b0;//for 7th bit

bcdto7segment bcd1(outm_s[3:0],bcdto7seg[7:0]);//for 0 to 3 bits(the unit digit place ones)
bcdto7segment bcd2(outm_s[7:4],bcdto7seg[15:8]);//for 4 to 7 bits(the ten digit place ones)
endmodule
