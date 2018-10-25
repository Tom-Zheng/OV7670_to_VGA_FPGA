`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/07 12:19:24
// Design Name: 
// Module Name: OV7670_top
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


module OV7670_top(
    input sys_clk_pin,
    input sys_rst_n_pin,

    output				sioc,	//I2C CLOCK
    inout                siod,    //I2C DATA

    input pclk,
    input vsync,
    input href,
    input [7:0] data_pin,
    
    output [3:0] led_pin,
    output xclk,
    output pwdn,
    output reset_pin,
    
    output h_sync,v_sync,  
    output [3:0] R,G,B
    );
    wire clk_100, clk_25;
    
    reg [15:0] reset = 0;
    reg rst = 0;
    
    assign led_pin[1] = pclk;
    assign led_pin[2] = vsync;
    assign led_pin[3] = href;
    assign xclk = clk_25;
    assign pwdn = 0;
    assign reset_pin = 1;
    
    // Reset after booted
    always@(posedge sys_clk_pin) begin
        if(!sys_rst_n_pin) begin
            reset <= 0;
            rst <= 0;
        end
        else begin
        if(reset < 16'hFFFF) begin
            reset <= reset + 1'b1;
            rst <= 0;
            end
        else begin
            reset <= reset;
            rst <= 1;
            end
         
        end
    end
    ///////////////clkgen///////////////////////////////\

    clk_gen_wrapper u_clk_gen_wrapper
       (.clk_100(clk_100),
        .clk_25(clk_25),
        .clk_in1(sys_clk_pin)
        );
        
    // OV7670 Configuration
    ov7670_init u_ov7670_init
    (
        .iCLK(clk_100),		//100MHz
        .iRST_N(rst),        //Global Reset
        
        //I2C Side
        .I2C_SCLK(sioc),    //I2C CLOCK
        .I2C_SDAT(siod),    //I2C DATA
        
        .Config_Done(led_pin[0])//Config Done
    );
    
    /////////////////////////////VGA Test/////////////////////////////////////////////////
    wire wr;
    wire [16:0] capture_addr;
    wire [15:0] capture_data;
    wire [16:0] frame_addr;
    wire [11:0] frame_pixel;
    
    vram_wrapper u_vram_wrapper
       (
        .BRAM_PORTA_addr(capture_addr),
        .BRAM_PORTA_clk(clk_25),
        .BRAM_PORTA_din({capture_data[15:12], capture_data[10:7], capture_data[4:1]}),
        .BRAM_PORTA_en(1'b1),
        .BRAM_PORTA_we(wr),
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

    /////////////////////////Capturing//////////////////////////////////////////////////
    
   ov7670_capture u_ov7670_capture(
        .pclk(pclk),
        .vsync(vsync),
        .href(href),
        .d(data_pin),
        .addr(capture_addr),
        .dout(capture_data),
        .wr(wr)
        );
endmodule
