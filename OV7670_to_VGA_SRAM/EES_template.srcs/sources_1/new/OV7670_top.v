`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Tian Zheng @ 360565766@qq.com
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
    output [3:0] R,G,B,
    
    output        sram_oe_n,// output enable input, low for output, ignore for write
    output        sram_ce_n,// chip enable input
    output        sram_we_n,// high for read, low for write
    output        sram_ub_n,// low for upper-byte control
    output        sram_lb_n,// low for lower-byte control
    output [18:0] sram_addr,
    inout  [15:0] sram_data
    );
    wire clk_100, clk_25, clk_50;
    
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
        .clk_50(clk_50),
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
    wire [15:0] frame_pixel;
    
//    vram_wrapper u_vram_wrapper
//       (
//        .BRAM_PORTA_addr(capture_addr),
//        .BRAM_PORTA_clk(clk_25),
//        .BRAM_PORTA_din({capture_data[15:12], capture_data[10:7], capture_data[4:1]}),
//        .BRAM_PORTA_en(1'b1),
//        .BRAM_PORTA_we(wr),
//        .BRAM_PORTB_addr(frame_addr),
//        .BRAM_PORTB_clk(clk_25),
//        .BRAM_PORTB_dout(frame_pixel),
//        .BRAM_PORTB_en(1'b1)
//        );
        
    vga u_vga (
        .clk25(clk_25),
        .vga_red(R),
        .vga_green(G),
        .vga_blue(B),
        .vga_hsync(h_sync),
        .vga_vsync(v_sync),
        .frame_addr(frame_addr),
        .frame_pixel(frame_pixel),
        .display_sw(1'b0)
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
        
   ///////////////////////////SRAM///////////////////////////////////////////////////////////////    
   wire        sram_data_ctrl;
   wire [15:0] sram_data_in;
   wire [15:0] sram_data_out;
   
   sram_dp_interface u_sram_dp_interface(
    .clk            ( clk_50       ),
   .rst            ( ~rst      ),
   .sram_oe_n      ( sram_oe_n      ),// output enable input, low for output, ignore for write
   .sram_ce_n      ( sram_ce_n      ),// chip enable input
   .sram_we_n      ( sram_we_n      ),// high for read, low for write
   .sram_ub_n      ( sram_ub_n      ),// low for upper-byte control
   .sram_lb_n      ( sram_lb_n      ),// low for lower-byte control
   .sram_addr      ( sram_addr      ),
   .sram_data_in   ( sram_data_in   ),
   .sram_data_out  ( sram_data_out  ),
   .sram_data_ctrl ( sram_data_ctrl ),
       
   .wr_addr(capture_addr),
   .din(capture_data),
   .we(wr),
       
   .rd_addr(frame_addr),
   .dout(frame_pixel)
       );
       
       genvar j;
       generate for (j = 0; j <= 15; j = j + 1)
       begin : bidir_IO
           IOBUF #(
               .DRIVE        (  12        ),   // Specify the output drive strength
               .IBUF_LOW_PWR ( "TRUE"     ),  // Low Power - "TRUE", High Performance = "FALSE" 
               .IOSTANDARD   ( "LVCMOS33" ),  // Specify the I/O standard
               .SLEW         ( "SLOW"     )   // Specify the output slew rate
           ) u_SRAM_DATA_IOBUFs (
               .O  ( sram_data_in[j]  ),   // Buffer output
               .IO ( sram_data[j]     ),   // Buffer inout port (connect directly to top-level port)
               .I  ( sram_data_out[j] ),   // Buffer input
               .T  ( sram_data_ctrl   )    // 3-state enable input, high=input, low=output
           );
       end
       endgenerate
       
endmodule
