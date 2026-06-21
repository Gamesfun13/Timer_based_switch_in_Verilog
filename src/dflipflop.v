`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:36:00 08/05/2020 
// Design Name: 
// Module Name:    dflipflop 
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
module dflipflop(Q,D,clk,rst
    );
output reg Q;
input D,clk,rst;
always@(posedge clk or negedge rst)
begin
if(rst==0)begin  Q<=1'b0;  end
else begin   Q<=D;   end
end
endmodule
