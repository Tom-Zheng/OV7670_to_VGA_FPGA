`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/06 21:53:09
// Design Name: 
// Module Name: Testbench
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


module Testbench();
reg        sys_clk;
reg        sys_rst;
reg        clk_25;

   
always begin
    sys_clk = 1'b0; #10;
    sys_clk = 1'b1; #10;
end

always begin
    clk_25 = 1'b0; #40;
    clk_25 = 1'b1; #40;
end

   initial begin
      sys_clk = 0;
      sys_rst = 0;
      #100;
      sys_rst = 1;
   end
   
   /////////////////////////////VGA Test/////////////////////////////////////////////////
   wire [3:0] R,G,B;
   wire h_sync, v_sync;
   
   wire portb_addr, portb_dout;
   wire frame_addr, frame_pixel;
   vram_wrapper u_vram_wrapper
      (
      .BRAM_PORTA_addr(17'b0),
          .BRAM_PORTA_clk(clk_25),
          .BRAM_PORTA_din(12'b0),
          .BRAM_PORTA_en(1'b0),
          .BRAM_PORTA_we(1'b0),
       .BRAM_PORTB_addr(frame_addr),
       .BRAM_PORTB_clk(clk_25),
       .BRAM_PORTB_dout(frame_pixel),
       .BRAM_PORTB_en(1'b1)
       );
       
   vga u_vga (
       .clk25(clk_25),
       .vga_red(R),
       .vga_green(G),
       .vga_blue(B),
       .vga_hsync(h_sync),
       .vga_vsync(v_sync),
       .frame_addr(frame_addr),
       .frame_pixel(frame_pixel)
       );
   

endmodule
