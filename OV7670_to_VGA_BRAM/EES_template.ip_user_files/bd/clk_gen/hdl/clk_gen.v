//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
//Date        : Sun Oct  8 22:44:22 2017
//Host        : DESKTOP-2060MF1 running 64-bit major release  (build 9200)
//Command     : generate_target clk_gen.bd
//Design      : clk_gen
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "clk_gen,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=clk_gen,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "clk_gen.hwdef" *) 
module clk_gen
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

  wire clk_in1_1;
  wire clk_wiz_0_clk_100;
  wire clk_wiz_0_clk_25;
  wire clk_wiz_0_locked;
  wire reset_1;

  assign clk_100 = clk_wiz_0_clk_100;
  assign clk_25 = clk_wiz_0_clk_25;
  assign clk_in1_1 = clk_in1;
  assign locked = clk_wiz_0_locked;
  assign reset_1 = reset;
  clk_gen_clk_wiz_0_0 clk_wiz_0
       (.clk_100(clk_wiz_0_clk_100),
        .clk_25(clk_wiz_0_clk_25),
        .clk_in1(clk_in1_1),
        .locked(clk_wiz_0_locked),
        .reset(reset_1));
endmodule
