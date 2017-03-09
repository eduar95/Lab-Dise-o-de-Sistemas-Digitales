`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2017 01:01:39
// Design Name: 
// Module Name: Divisor_F
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Divisor_F(
       clk,
	 reset,
	 SCLKclk
    );
input wire clk, reset;
	output reg SCLKclk;///,pclk
reg cuenta_sclk;  /////El numero de bits se determina: logbase2(redondeado((clknexys/clkdeseado))-1)
always @(posedge clk)   
	begin
	if(reset)
		begin
		cuenta_sclk<=1'd0;   /////El numero de bits se determina: logbase2(redondeado((clknexys/clkdeseado))-1)
		SCLKclk <=1'd0;  //El numero de bits se determina: logbase2(redondeado((clknexys/clkdeseado))-1)
		end
	else
				begin	
			if(cuenta_sclk == 1'd0)// numero lo determina dividiendo el clock dela nexys y el clock que usted quiere, -1, dividido entre 2
						     		 ///Tiene qoue ser un numero entero por lo que lo redondea hacia arriba
					begin 
						cuenta_sclk<= 2'd00;  /////El numero de bits se determina: logbase2(redondeado((clknexys/clkdeseado))-1)+1
						SCLKclk <= ~SCLKclk;
					end
	 		else
				cuenta_sclk <= cuenta_sclk + 1'b1;
		end
	end

endmodule