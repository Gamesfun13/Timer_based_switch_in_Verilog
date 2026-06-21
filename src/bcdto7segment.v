`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:14:05 07/03/2020 
// Design Name: 
// Module Name:    bcdto7segment 
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
module bcdto7segment(
  bcd, segments );
input [3:0] bcd;//input to be converted to bcd
output reg [7:0]segments;//output
always@(bcd)begin
case(bcd)
   0:   segments=8'b10000000;//Dp is MSb and A is LSb
   1:   segments=8'b11111001;
   2:   segments=8'b10100100; 
   3:   segments=8'b10110000; 
   4:   segments=8'b10011001; 
   5:   segments=8'b10010010; 
   6:   segments=8'b10000010; 
   7:   segments=8'b11111000; 
   8:   segments=8'b10000000;
   9:   segments=8'b10010000;  
	default:  segments=8'b11111111;//in default all the LED are off
endcase
end
endmodule
