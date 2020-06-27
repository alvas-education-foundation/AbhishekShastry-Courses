`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:  Anonymous
// Engineering Student Name:  ABHISHEK M SHASTRY K
//
// Create Date:   23:28:42 06/12/2020
// Design Name:   coftea_venmachine
// Module Name:   C:/Xilinx92i/code_ch4/coftea_venmachine_testb.v
// Project Name:  code_ch4
// Target Device:  
// Tool versions:  
// Description: 
   //Test Bench Code for Coffee - Tea vending machine.
// Verilog Test Fixture created by ISE for module: coftea_venmachine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module coftea_venmachine_testb_v;

	// Inputs
	reg clk;
	reg coin;
	reg [1:0] user_in;

	// Outputs
	wire tea;
	wire coffee;
	wire coin_ret;

	// Instantiate the Unit Under Test (UUT)
	coftea_venmachine uut (
		.clk(clk), 
		.coin(coin), 
		.user_in(user_in), 
		.tea(tea), 
		.coffee(coffee), 
		.coin_ret(coin_ret)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		coin = 0;
		user_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		#200 coin = 1;
		#200 user_in = 2'b11;

	end
	always #200 clk = ~clk;  //Toggle clock for 200ns.
      
endmodule

