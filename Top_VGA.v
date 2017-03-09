`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2017 14:12:49
// Design Name: 
// Module Name: Top_VGA
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


module Top_VGA(
    input wire clk, reset,
    input sw1,sw2,sw3,
    output wire vsync, hsync,
    output wire[2:0] rgb
//	output wire font_bit //agregada para prueba
    );

// declaracion de registros de colores
wire [9:0] pixel_x; 
wire [9:0] pixel_y;
wire video_on; 
wire pixel_tick;
reg [2:0] rgb_reg;
wire [2:0] rgb_next;

Divisor_F divisor(
       .clk(clk),
       .reset(reset),
       .SCLKclk(SCLKclk)
       );
       
       wire SCLKclk;
       wire clk_in;
       assign clk_in = SCLKclk;
//Instanciacion de funciones principales
VGA_Sync Sincronizador(
		.clk_in(clk_in), 
		.reset(reset), 
		.hsync(hsync), 
		.vsync(vsync), 
		.video_on(video_on), 
        .p_tick(pixel_tick),		
		.pixel_x(pixel_x), 
		.pixel_y(pixel_y)
		);
	
// Instantiate the module
Generador_texto Generador_texto(
    .clk(clk), 
    .video_on(video_on), 
    .pixel_x(pixel_x), 
    .pixel_y(pixel_y), 
	.sw1(sw1), 
	.sw2(sw2), 
	.sw3(sw3),
	.rgb_text(rgb_next)
    );
	 
	 // rgb buffer
   always @(negedge clk)
      if (pixel_tick)
         rgb_reg <= rgb_next;
   // output
   assign rgb = rgb_reg;
	 
endmodule 