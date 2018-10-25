-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1 (win64) Build 1846317 Fri Apr 14 18:55:03 MDT 2017
-- Date        : Sun Oct  8 22:45:25 2017
-- Host        : DESKTOP-2060MF1 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/insan/Desktop/FPGA_Project/EES_template/EES_template.srcs/sources_1/bd/clk_gen/ip/clk_gen_clk_wiz_0_0/clk_gen_clk_wiz_0_0_stub.vhdl
-- Design      : clk_gen_clk_wiz_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_gen_clk_wiz_0_0 is
  Port ( 
    clk_100 : out STD_LOGIC;
    clk_25 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clk_gen_clk_wiz_0_0;

architecture stub of clk_gen_clk_wiz_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_100,clk_25,reset,locked,clk_in1";
begin
end;
