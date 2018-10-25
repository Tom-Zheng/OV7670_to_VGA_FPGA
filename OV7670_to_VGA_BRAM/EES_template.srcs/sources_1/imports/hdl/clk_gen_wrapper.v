//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
//Date        : Sun Oct  8 22:24:36 2017
//Host        : DESKTOP-2060MF1 running 64-bit major release  (build 9200)
//Command     : generate_target clk_gen_wrapper.bd
//Design      : clk_gen_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module clk_gen_wrapper
   (clk_100,
    clk_25,
    clk_in1,
    locked,
    reset);
  output clk_100;
  output clk_25;
  input clk_in1;
  output locked;
  input reset;

  wire clk_100;
  wire clk_25;
  wire clk_in1;
  wire locked;
  wire reset;

  clk_gen clk_gen_i
       (.clk_100(clk_100),
        .clk_25(clk_25),
        .clk_in1(clk_in1),
        .locked(locked),
        .reset(reset));
endmodule
