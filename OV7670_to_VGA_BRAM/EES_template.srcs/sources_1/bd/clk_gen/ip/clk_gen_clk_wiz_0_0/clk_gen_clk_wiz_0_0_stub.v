// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
// Date        : Sun Oct  8 22:45:25 2017
// Host        : DESKTOP-2060MF1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/insan/Desktop/FPGA_Project/EES_template/EES_template.srcs/sources_1/bd/clk_gen/ip/clk_gen_clk_wiz_0_0/clk_gen_clk_wiz_0_0_stub.v
// Design      : clk_gen_clk_wiz_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_gen_clk_wiz_0_0(clk_100, clk_25, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_100,clk_25,reset,locked,clk_in1" */;
  output clk_100;
  output clk_25;
  input reset;
  output locked;
  input clk_in1;
endmodule
