`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:27:09 08/20/2020 
// Design Name: 
// Module Name:    comparator 
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
module comparator(
  i,j,y  );
//this module could be done in one xor gate but it would correpond to proteus and would be tideous to control and
//manipulate.  
//this module is the comparator module which compare the correponding bits
//Note: it return 0 when matched and 1 when not matched  
input [23:0]i,j;//the two inputs to be compared
output y;//the the ouput after comparison
wire [23:0]z;//intermediate wire

xor xor0(z[0],i[0],j[0]);
xor xor1(z[1],i[1],j[1]);
xor xor2(z[2],i[2],j[2]);
xor xor3(z[3],i[3],j[3]);
xor xor4(z[4],i[4],j[4]);
xor xor5(z[5],i[5],j[5]);
xor xor6(z[6],i[6],j[6]);
xor xor7(z[7],i[7],j[7]);
xor xor8(z[8],i[8],j[8]);
xor xor9(z[9],i[9],j[9]);
xor xor10(z[10],i[10],j[10]);
xor xor11(z[11],i[11],j[11]);
xor xor12(z[12],i[12],j[12]);
xor xor13(z[13],i[13],j[13]);
xor xor14(z[14],i[14],j[14]);
xor xor15(z[15],i[15],j[15]);
xor xor16(z[16],i[16],j[16]);
xor xor17(z[17],i[17],j[17]);
xor xor18(z[18],i[18],j[18]);
xor xor19(z[19],i[19],j[19]);
xor xor20(z[20],i[20],j[20]);
xor xor21(z[21],i[21],j[21]);
xor xor22(z[22],i[22],j[22]);
xor xor23(z[23],i[23],j[23]);

//this code is possible in one but could cause confusion
wire y_1,y_2,y_3;
or comp_1(y_1,z[0],z[1],z[2],z[3],z[4],z[5],z[6],z[7]);
or comp_2(y_2,z[8],z[9],z[10],z[11],z[12],z[13],z[14],z[15]);
or comp_3(y_3,z[16],z[17],z[18],z[19],z[20],z[21],z[22],z[23]);

//at last the ouptput of comparison
or comp_4 (y,y_1,y_2,y_3);


endmodule
