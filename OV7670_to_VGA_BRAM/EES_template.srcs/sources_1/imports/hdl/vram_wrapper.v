//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
//Date        : Sun Oct  8 22:06:56 2017
//Host        : DESKTOP-2060MF1 running 64-bit major release  (build 9200)
//Command     : generate_target vram_wrapper.bd
//Design      : vram_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module vram_wrapper
   (BRAM_PORTA_addr,
    BRAM_PORTA_clk,
    BRAM_PORTA_din,
    BRAM_PORTA_en,
    BRAM_PORTA_we,
    BRAM_PORTB_addr,
    BRAM_PORTB_clk,
    BRAM_PORTB_dout,
    BRAM_PORTB_en);
  input [16:0]BRAM_PORTA_addr;
  input BRAM_PORTA_clk;
  input [11:0]BRAM_PORTA_din;
  input BRAM_PORTA_en;
  input [0:0]BRAM_PORTA_we;
  input [16:0]BRAM_PORTB_addr;
  input BRAM_PORTB_clk;
  output [11:0]BRAM_PORTB_dout;
  input BRAM_PORTB_en;

  wire [16:0]BRAM_PORTA_addr;
  wire BRAM_PORTA_clk;
  wire [11:0]BRAM_PORTA_din;
  wire BRAM_PORTA_en;
  wire [0:0]BRAM_PORTA_we;
  wire [16:0]BRAM_PORTB_addr;
  wire BRAM_PORTB_clk;
  wire [11:0]BRAM_PORTB_dout;
  wire BRAM_PORTB_en;

  vram vram_i
       (.BRAM_PORTA_addr(BRAM_PORTA_addr),
        .BRAM_PORTA_clk(BRAM_PORTA_clk),
        .BRAM_PORTA_din(BRAM_PORTA_din),
        .BRAM_PORTA_en(BRAM_PORTA_en),
        .BRAM_PORTA_we(BRAM_PORTA_we),
        .BRAM_PORTB_addr(BRAM_PORTB_addr),
        .BRAM_PORTB_clk(BRAM_PORTB_clk),
        .BRAM_PORTB_dout(BRAM_PORTB_dout),
        .BRAM_PORTB_en(BRAM_PORTB_en));
endmodule
