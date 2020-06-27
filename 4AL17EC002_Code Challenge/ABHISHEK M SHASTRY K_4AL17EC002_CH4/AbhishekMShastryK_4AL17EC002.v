`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Anonymous
// Engineering Student Name:  ABHISHEK M SHASTRY K
// 
// Create Date:    17:21:02 06/11/2020 
// Design Name: 
// Module Name:    coftea_venmachine 
// Project Name:   coffee - tea vending machine
// Target Devices: 
// Tool versions: 
// Description (Problem Statement): 
   //Design an automatic tea/coffee vending machine based on FSM model shown below and implement using Verilog code. 
   //Also, test the module writing the testbench code.
   //The tea/coffee vending is initiated by user inserting a 5 rupee coin. 
	//After inserting the coin the user can either select coffee or tea or press cancel the order and take back the coin.
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module coftea_venmachine(clk, coin, user_in, tea, coffee, coin_ret);
input clk;
input coin;
input [1:0] user_in;
output reg tea, coffee, coin_ret;

parameter [1:0] s1 = 2'b01;  //To dispense Tea.
parameter [1:0] s2 = 2'b10;  //To dispense Coffee.
parameter [1:0] s3 = 2'b11;  //To dispense Rs.5 Coin.

always @ (posedge clk, coin)
begin
	tea = 1'b0;
	coffee = 1'b0;
	coin_ret = 1'b0;
		if(coin == 1'b1)  //Check whether user inserted Rs.5 Coin or not.
		begin
			if(user_in == s1)  //Check whether user wants Tea.
			begin
				tea = 1'b1;  //Dispense Tea.
				coffee = 1'b0;
				coin_ret = 1'b0;
			end
			else if(user_in == s2)  //Check whether user wants Coffee.
			begin
				tea = 1'b0;
				coffee = 1'b1;  //Dispense coffee.
				coin_ret = 1'b0;
			end
			else if(user_in == s3)  //Check whether user wants to cancel the order.
			begin
			   tea = 1'b0;
				coffee = 1'b0;
				coin_ret = 1'b1;  //Dispense Rs.5 Coin.
			end
			else
			begin
				tea = 1'b0;
				coffee = 1'b0;
				coin_ret = 1'b0;
			end
		end
							
end

endmodule
