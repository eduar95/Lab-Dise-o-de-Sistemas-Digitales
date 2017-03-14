`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2017 14:24:56
// Design Name: 
// Module Name: VGA_tb
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


module VGA_tb_1(

    );
    reg clk;
    reg reset;
    wire SCLKclk;
    wire hsync;
    wire vsync;
    wire video_on;
    wire p_tick;
    wire [9:0] pixel_x;
    wire [9:0] pixel_y;
    
    
    Divisor_F divisor(
            .clk(clk),
            .reset(reset),
            .SCLKclk(SCLKclk)
            );
    //assign SCLKclk = clk_in       
    
    VGA_Sync VGA_Sync(
            .clk_in(SCLKclk), 
            .reset(reset), 
            .hsync(hsync), 
            .vsync(vsync), 
            .video_on(video_on), 
            .p_tick(p_tick),        
            .pixel_x(pixel_x), 
            .pixel_y(pixel_y)
            );
   initial
   
     begin
                clk=0;
                reset=1;
                #30 
                reset=0;
                
     end           
    always
        begin
        #5 clk=~clk;
        end
  

            
endmodule 
