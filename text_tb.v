`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2017 14:26:44
// Design Name: 
// Module Name: text_tb
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


module text_tb_1(

    );

    reg clk;
    reg video_on;
    reg [9:0] pixel_x;
    reg [9:0] pixel_y;
    reg sw1;
    reg sw2;
    reg sw3;
    wire [2:0] rgb_text;
    wire font_bit;

    Generador_texto text_tb(
            .clk(clk), 
            .video_on(video_on), 
            .pixel_x(pixel_x), 
            .pixel_y(pixel_y),
            .sw1(sw1),
            .sw2(sw2),
            .sw3(sw3),
            .rgb_text(rgb_text),
            .font_bit(font_bit)

            );
   initial
   
     begin
                clk=0;
                video_on=0;
                pixel_x=0;
                pixel_y=0;
                sw1=0;
                sw2=0;
                sw3=0;
                
                #20
                
                video_on=1;
                pixel_x=30;
                pixel_y=15;
                sw1=1;
                sw2=0;
                sw3=1;
                
                #20
                
                video_on=1;
                pixel_x=10;
                pixel_y=5;
                sw1=1;
                sw2=1;
                sw3=1;
                
     end           
    always
        begin
        #5 clk=~clk;
        end
            
endmodule