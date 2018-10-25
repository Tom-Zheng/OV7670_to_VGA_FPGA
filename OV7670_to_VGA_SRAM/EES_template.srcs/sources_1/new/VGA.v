`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/08 21:48:17
// Design Name: 
// Module Name: VGA
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



module vga(
    input clk25,
	output reg[3:0] vga_red,
	output reg[3:0] vga_green,
	output reg[3:0] vga_blue,
	output reg vga_hsync,
	output reg vga_vsync,
	output [16:0] frame_addr,
	input [15:0] frame_pixel,
	input display_sw
    );
    
      parameter hRez   = 640;
      parameter hStartSync   = 640+16;
      parameter hEndSync     = 640+16+96;
      parameter hMaxCount    = 800;
    
      parameter vRez         = 480;
      parameter vStartSync   = 480+10;
      parameter vEndSync     = 480+10+2;
      parameter vMaxCount    = 480+10+2+33;
    
		parameter hsync_active   =0;
		parameter vsync_active  = 0;
		reg[9:0] hCounter;
		reg[9:0] vCounter;    
		reg[16:0] address;  
		reg blank;
		initial   hCounter = 10'b0;
		initial   vCounter = 10'b0;  
		initial   address = 17'b0;   
		initial   blank = 1'b1;    
		
		assign frame_addr = address;
//		assign HCnt = hCounter;
//		assign VCnt = vCounter;
		
		always@(posedge clk25)
		begin
		if( hCounter == hMaxCount-1 )
			begin
			hCounter <=  10'b0;
			if (vCounter == vMaxCount-1 )
				vCounter <=  10'b0;
			else
				vCounter <= vCounter+1;
			end
		else
			hCounter <= hCounter+1;

		if (blank ==0)
			begin
                if(display_sw == 1) begin
                    if(frame_pixel[15:11]>=20&&frame_pixel[10:5]>=49)
                        begin
                        vga_red <= 4'b0000;
                        vga_green <= 4'b0000;
                        vga_blue <= 4'b0000;
                        end
                    else
                         begin
                         vga_red <= 4'b1111;
                         vga_green <= 4'b1111;
                         vga_blue <= 4'b1111;
                         end
                end
                else begin
                     /////////////original/////////////////////////////////////
		    vga_red   <= frame_pixel[15:12];
            vga_green <= frame_pixel[10:7];
            vga_blue  <= frame_pixel[4:1];
                end
///////////////////////////Threshold/////////////////////////////////////
			end
		else 
			begin
			vga_red   <= 4'b0;
			vga_green <= 4'b0;
			vga_blue  <= 4'b0;
			end

		if(  vCounter  >= 360 || vCounter  < 120) 
			begin
			address <= 17'b0; 
			blank <= 1;
			end
		else
			begin
			if ( hCounter  < 480 && hCounter  >= 160) 
				begin
				blank <= 0;
				address <= address+1;
				end
			else
				blank <= 1;
			end

		if( hCounter > hStartSync && hCounter <= hEndSync)
			vga_hsync <= hsync_active;
		else
			vga_hsync <= ~ hsync_active;
		


		if( vCounter >= vStartSync && vCounter < vEndSync )
			vga_vsync <= vsync_active;
		else
			vga_vsync <= ~ vsync_active;
		end 
endmodule

