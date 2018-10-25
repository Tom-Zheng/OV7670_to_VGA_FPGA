# OV7670_to_VGA_FPGA
This is a basic project that takes video stream from OV7670 camera and displays via VGA on Artix7 FPGA.


## Requirements

- Vivado 2017.1
- Xilinx xc7a35tcsg324-1 (Should work on Basys 3 and any Artix7 family)
- OV7670 Camera Module
- PMOD to VGA Connector

## Which one to use

To build a video data stream, `OV7670_to_VGA_BRAM` uses on chip BRAM as video buffer and `OV7670_to_VGA_SRAM` uses SRAM to save on chip resources.

`OV7670_to_VGA_SRAM` needs an on board SRAM of *at least 2Mbit*.

## Before you flash

- Check your pin constraints

![Picture](https://github.com/Tom-Zheng/OV7670_to_VGA_FPGA/raw/master/pics/PMOD_OV7670.jpg)