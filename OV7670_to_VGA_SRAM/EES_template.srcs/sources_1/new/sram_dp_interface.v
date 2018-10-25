`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/12 13:16:49
// Design Name: 
// Module Name: sram_dp_interface
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


module sram_dp_interface(
    input         clk,
    input         rst,
    output        sram_oe_n,// output enable input, low for output, ignore for write
    output        sram_ce_n,// chip enable input
    output        sram_we_n,// high for read, low for write
    output        sram_ub_n,// low for upper-byte control
    output        sram_lb_n,// low for lower-byte control
    output [18:0] sram_addr,
    input  [15:0] sram_data_in,
    output [15:0] sram_data_out,
    output        sram_data_ctrl,
    
    input  [18:0]  wr_addr,
    input  [15:0]  din,
    input          we,
    
    input  [18:0]  rd_addr,
    output [15:0]  dout
    );
    
    reg        sram_oe_r   =  1'b1;
    reg        sram_ce_r   =  1'b1;
    reg        sram_we_r   =  1'b1;
    reg        sram_ub_r   =  1'b1;
    reg        sram_lb_r   =  1'b1;
    reg        sram_ctrl_r =  1'b1;
    
    parameter IDLE     = 3'b001;
    parameter WR_CYCLE = 3'b010;
    parameter RD_CYCLE = 3'b100;
    
    reg [2:0] c_state = IDLE;
    
    reg [15:0] din_r;
    reg [18:0] addr_r;
    
    reg [15:0] dout_r;
    always @ (posedge clk)
    begin
        if (rst)
            c_state <= IDLE;
        else
            case (c_state)
                IDLE     : c_state <= WR_CYCLE;
                WR_CYCLE : c_state <= RD_CYCLE;
                RD_CYCLE : c_state <= WR_CYCLE;
                default  : c_state <= IDLE;
            endcase
    end
    
always @ (posedge clk)
    begin
        if (rst) begin
            sram_ctrl_r  <= 1'b1;
            sram_oe_r    <= 1'b1;
            sram_we_r    <= 1'b1;
            sram_ce_r    <= 1'b1;
            sram_ub_r    <= 1'b1;
            sram_lb_r    <= 1'b1;
        end
        else
            case (c_state)
                IDLE     : begin
                    sram_ctrl_r  <= 1'b1;
                    sram_oe_r    <= 1'b1;
                    sram_we_r    <= 1'b1;
                    sram_ce_r    <= 1'b1;
                    sram_ub_r    <= 1'b1;
                    sram_lb_r    <= 1'b1;
                end
                WR_CYCLE : begin
                    dout_r <= sram_data_in;
                    if(we == 1) begin
                        sram_oe_r   <= 1'b1;
                        sram_we_r   <= 1'b0;
                        sram_ce_r   <= 1'b0;
                        sram_ub_r   <= 1'b0;
                        sram_lb_r   <= 1'b0;
                        sram_ctrl_r <= 1'b0;
                        din_r <= din;
                        addr_r <= wr_addr;
                    end
                    else begin
                        sram_ctrl_r  <= 1'b1;
                        sram_oe_r    <= 1'b1;
                        sram_we_r    <= 1'b1;
                        sram_ce_r    <= 1'b1;
                        sram_ub_r    <= 1'b1;
                        sram_lb_r    <= 1'b1;
                    end
                end
                RD_CYCLE : begin
                    sram_oe_r   <= 1'b0;
                    sram_we_r   <= 1'b1;
                    sram_ce_r   <= 1'b0;
                    sram_ub_r   <= 1'b0;
                    sram_lb_r   <= 1'b0;
                    sram_ctrl_r <= 1'b1;
                    addr_r <= rd_addr;
                end
                default  : begin
                    sram_ctrl_r  <= 1'b1;
                    sram_oe_r    <= 1'b1;
                    sram_we_r    <= 1'b1;
                    sram_ce_r    <= 1'b1;
                    sram_ub_r    <= 1'b1;
                    sram_lb_r    <= 1'b1;
                end
            endcase
    end
    
    assign sram_addr      = addr_r;
    assign sram_data_out  = din_r;
    assign sram_oe_n      = sram_oe_r;
    assign sram_ce_n      = sram_ce_r;
    assign sram_we_n      = sram_we_r;
    assign sram_ub_n      = sram_ub_r;
    assign sram_lb_n      = sram_lb_r;
    assign sram_data_ctrl = sram_ctrl_r;
    assign dout = dout_r;
    
endmodule
