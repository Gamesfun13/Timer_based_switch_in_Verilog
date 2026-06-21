`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:01:50 08/20/2020
// Design Name:   mainmodule
// Module Name:   C:/Users/Arno/Desktop/New folder/labs/projectfinal/xilink/timelyOnswitch/finaltestbench.v
// Project Name:  timelyOnswitch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mainmodule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module finaltestbench;

	// Inputs
	reg start;
	reg clk;
	reg reset;
	reg [6:0] sec;
	reg [6:0] min;
	reg [4:0] hr;

	// Outputs
	wire y;
	wire [7:0] out_sec;
	wire [7:0] out_min;
	wire [7:0] out_hr;
	wire [7:0] clkout_sec;
	wire [7:0] clkout_min;
	wire [7:0] clkout_hr;
	wire [15:0] seg_sec;
	wire [15:0] seg_min;
	wire [15:0] seg_hr;
	wire [15:0] clkseg_sec;
	wire [15:0] clkseg_min;
	wire [15:0] clkseg_hr;

	//iverilog -o sim inputmodule.v multiplexerrrr.v  inputmodule2.v  fullinput.v dflipflop.v counter1to9.v counter1to5.v  bcdto7segment.v  digitalclock.v comparator.v   mainmodule.v finaltestbench.v
	// Instantiate the Unit Under Test (UUT)
	mainmodule uut (
		.start(start), 
		.clk(clk), 
		.reset(reset), 
		.y(y), 
		.sec(sec), 
		.min(min), 
		.hr(hr), 
		.out_sec(out_sec), 
		.out_min(out_min), 
		.out_hr(out_hr), 
		.clkout_sec(clkout_sec), 
		.clkout_min(clkout_min), 
		.clkout_hr(clkout_hr), 
		.seg_sec(seg_sec), 
		.seg_min(seg_min), 
		.seg_hr(seg_hr), 
		.clkseg_sec(clkseg_sec), 
		.clkseg_min(clkseg_min), 
		.clkseg_hr(clkseg_hr)
	);
	initial begin
		// Initialize Inputs
		start = 0;//clock is off
		clk = 0;
		reset = 1;//all flipflop are resetted
		sec = 0;
		min = 0;
		hr = 0;#1;
      start=1;//clock is on
      reset =0;//reset button is off
      sec = 7'b0000000;//00 in digits
		min = 7'b0100000;//20 in digits
		hr = 5'b00000;//00 in digits
		#3600;//the testbench runs for an hour
		reset=1;#1;//resetted again for another input
		reset=0;//reset button is off
		sec = 7'b0010000;//10 in digits in hex
		min = 7'b0100000;//20 in digits in hex
		hr = 5'b10000;//10 in digits in hex   total= 10:40:10
		#50000;//runs for long times
$finish;
	end

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, finaltestbench);
end
//consider clock is 1 at first
//now after 0.5ns it gets 0 and after another 0.5ns it becomes 1
//it takes total of 1 ns for one cycle and becomes a 1nhz frequency clock
//i have consider 1ns as 1s and 1nhz as 1hz here to correspond to the proteus implementation 
//where clock is 1 hz	
      always #0.5 clk=~clk;
endmodule

