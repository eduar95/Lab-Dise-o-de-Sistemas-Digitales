`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2017 14:17:41
// Design Name: 
// Module Name: Generador_texto
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


module Generador_texto(
   input wire clk,
   input wire video_on,
   input wire [9:0] pixel_x, pixel_y,
   input wire sw1, sw2, sw3,
   output reg [2:0] rgb_text,
   output wire font_bit
   );

   // signal declaration
   wire [10:0] rom_addr;
   reg [6:0] char_addr;
   wire [3:0] row_addr;
   wire [2:0] bit_addr;
   wire [7:0] font_word;
   wire [2:0] rgb_graph;

   // body
   // instantiate font ROM
   Font_rom font_unit
      (.clk(clk), .addr(rom_addr), .data(font_word));

   // font ROM interface
   assign row_addr = pixel_y[3:0];
   assign rom_addr = {char_addr, row_addr};
   assign bit_addr = pixel_x[2:0];
   assign font_bit = font_word[~bit_addr];

		
   // region delimitada para el texto
   assign text_bit_on = (pixel_y[9:4]==12);
	always @*

      case(pixel_x[8:3])
         6'h25: char_addr = 7'h47; // G
					
         6'h27: char_addr = 7'h45; // E
					
		 6'h29: char_addr = 7'h4b; // K
					
         default: char_addr = 7'h00; //espacio en blanco
      endcase

	assign rgb_graph[2] = sw1;   // red
	assign rgb_graph[1] = sw2;
	assign rgb_graph[0] = sw3; 
	

   // rgb multiplexing circuit
   always @*
      if (~video_on) //se cambia a rojo
         rgb_text = 3'b000; // zona prohibida
      else
			begin
			if (~text_bit_on)
				begin
				rgb_text=3'b000;
				end
			else
				if (font_bit) //hay que pintar pixel letra
					begin
					rgb_text = rgb_graph;
					end
				else
					begin
					rgb_text=3'b000; //mismo color del fondo de pantalla
					end
			end

endmodule