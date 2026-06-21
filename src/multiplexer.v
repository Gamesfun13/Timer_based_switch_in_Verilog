`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:02:31 08/08/2020 
// Design Name: 
// Module Name:    multiplexer
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
module multiplexer(
  i,j,select,out  );
	 
input [3:0]i,j;
output reg [3:0]out;

input select;

always @(i,j,select)
case (select)
2'b0:   out<=i;
2'b1:   out<=j;
default: out<=4'bxxxx;
endcase


endmodule
