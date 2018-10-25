set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports sys_clk_pin]
set_property -dict {PACKAGE_PIN R10 IOSTANDARD LVCMOS33} [get_ports sys_rst_n_pin]
#set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports uart_rx_pin]
#set_property -dict {PACKAGE_PIN V1 IOSTANDARD LVCMOS33} [get_ports uart_tx_pin]


set_property PACKAGE_PIN D10 [get_ports {led_pin[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pin[0]}]
set_property PACKAGE_PIN D9 [get_ports {led_pin[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pin[1]}]
set_property PACKAGE_PIN C9 [get_ports {led_pin[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pin[2]}]
set_property PACKAGE_PIN B9 [get_ports {led_pin[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_pin[3]}]
#set_property PACKAGE_PIN B8 [get_ports {led_pin[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led_pin[4]}]
#set_property PACKAGE_PIN A8 [get_ports {led_pin[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led_pin[5]}]
#set_property PACKAGE_PIN C11 [get_ports {led_pin[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led_pin[6]}]
#set_property PACKAGE_PIN C10 [get_ports {led_pin[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {led_pin[7]}]

#set_property PACKAGE_PIN A9 [get_ports {seg_cs_pin[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_cs_pin[0]}]
#set_property PACKAGE_PIN A10 [get_ports {seg_cs_pin[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_cs_pin[1]}]
#set_property PACKAGE_PIN C14 [get_ports {seg_cs_pin[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_cs_pin[2]}]
#set_property PACKAGE_PIN D14 [get_ports {seg_cs_pin[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_cs_pin[3]}]

#set_property PACKAGE_PIN B11 [get_ports {seg_data_pin[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_data_pin[0]}]
#set_property PACKAGE_PIN A11 [get_ports {seg_data_pin[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_data_pin[1]}]
#set_property PACKAGE_PIN F13 [get_ports {seg_data_pin[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_data_pin[2]}]
#set_property PACKAGE_PIN F14 [get_ports {seg_data_pin[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_data_pin[3]}]
#set_property PACKAGE_PIN D12 [get_ports {seg_data_pin[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_data_pin[4]}]
#set_property PACKAGE_PIN D13 [get_ports {seg_data_pin[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_data_pin[5]}]
#set_property PACKAGE_PIN D15 [get_ports {seg_data_pin[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {seg_data_pin[6]}]
#set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports { seg_data_pin[7] }];


set_property PACKAGE_PIN A18 [get_ports siod]
set_property IOSTANDARD LVCMOS33 [get_ports siod]
set_property PACKAGE_PIN D17 [get_ports sioc]
set_property IOSTANDARD LVCMOS33 [get_ports sioc]
set_property PACKAGE_PIN B18 [get_ports href]
set_property IOSTANDARD LVCMOS33 [get_ports href]
set_property PACKAGE_PIN E17 [get_ports vsync]
set_property IOSTANDARD LVCMOS33 [get_ports vsync]
set_property PACKAGE_PIN B17 [get_ports xclk]
set_property IOSTANDARD LVCMOS33 [get_ports xclk]
set_property PACKAGE_PIN C17 [get_ports pclk]
set_property IOSTANDARD LVCMOS33 [get_ports pclk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets pclk]
set_property PACKAGE_PIN B16 [get_ports {data_pin[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_pin[5]}]
set_property PACKAGE_PIN C16 [get_ports {data_pin[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_pin[7]}]
set_property PACKAGE_PIN B14 [get_ports {data_pin[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_pin[4]}]
set_property PACKAGE_PIN A16 [get_ports {data_pin[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_pin[6]}]
set_property PACKAGE_PIN B13 [get_ports {data_pin[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_pin[2]}]
set_property PACKAGE_PIN A15 [get_ports {data_pin[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_pin[3]}]
set_property PACKAGE_PIN B12 [get_ports {data_pin[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_pin[0]}]
set_property PACKAGE_PIN A14 [get_ports {data_pin[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_pin[1]}]
set_property PACKAGE_PIN C12 [get_ports pwdn]
set_property IOSTANDARD LVCMOS33 [get_ports pwdn]
set_property PACKAGE_PIN A13 [get_ports reset_pin]
set_property IOSTANDARD LVCMOS33 [get_ports reset_pin]

set_property PACKAGE_PIN V16 [get_ports {B[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[0]}]
set_property PACKAGE_PIN V15 [get_ports {B[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[1]}]
set_property PACKAGE_PIN V14 [get_ports {B[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[2]}]
set_property PACKAGE_PIN U14 [get_ports {B[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {B[3]}]
set_property PACKAGE_PIN V12 [get_ports {R[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {R[0]}]
set_property PACKAGE_PIN U12 [get_ports {R[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {R[1]}]
set_property PACKAGE_PIN V11 [get_ports {R[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {R[2]}]
set_property PACKAGE_PIN V10 [get_ports {R[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {R[3]}]
set_property PACKAGE_PIN U13 [get_ports {G[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {G[0]}]
set_property PACKAGE_PIN T13 [get_ports {G[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {G[1]}]
set_property PACKAGE_PIN U11 [get_ports {G[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {G[2]}]
set_property PACKAGE_PIN T11 [get_ports {G[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {G[3]}]
set_property PACKAGE_PIN U18 [get_ports v_sync]
set_property IOSTANDARD LVCMOS33 [get_ports v_sync]
set_property PACKAGE_PIN U17 [get_ports h_sync]
set_property IOSTANDARD LVCMOS33 [get_ports h_sync]
