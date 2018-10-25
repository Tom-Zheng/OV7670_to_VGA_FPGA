`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/06 21:53:09
// Design Name: 
// Module Name: Testbench
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


module Testbench();
reg        sys_clk;
reg        sys_rst;

wire I2C_SCLK;
wire I2C_SDAT;

   wire mI2C_END;
   wire mI2C_ACK;
   reg mI2C_WR;
   reg mI2C_GO;
   wire I2C_RDATA;
   
always begin
    sys_clk = 1'b0; #10;
    sys_clk = 1'b1; #10;
end

   initial begin
      sys_clk = 0;
      sys_rst = 0;
      #100;
      sys_rst = 1;
      mI2C_WR = 1;
      mI2C_GO = 1;
   end
   
/////////////////////	I2C Control Clock	////////////////////////
//	Clock Setting
parameter	CLK_Freq	=	100_000000;	//25 MHz
parameter	I2C_Freq	=	10_000;		//10 KHz
reg	[15:0]	mI2C_CLK_DIV;				//CLK DIV
reg			mI2C_CTRL_CLK;				//I2C Control Clock
always@(posedge sys_clk or negedge sys_rst)
begin
	if(!sys_rst)
		begin
		mI2C_CLK_DIV	<=	0;
		mI2C_CTRL_CLK	<=	0;
		end
	else
		begin
		 if( mI2C_CLK_DIV	< (CLK_Freq/I2C_Freq)/2)
			 mI2C_CLK_DIV	<=	mI2C_CLK_DIV + 1'd1;
		 else
			 begin
			 mI2C_CLK_DIV	<=	0;
			mI2C_CTRL_CLK	<=	~mI2C_CTRL_CLK;
			end
		end
end

pullup(I2C_SDAT);

//-------------------------------------
reg	i2c_en_r0, i2c_en_r1;
always@(posedge sys_clk or negedge sys_rst)
begin
	if(!sys_rst)
		begin
		i2c_en_r0 <= 0;
		i2c_en_r1 <= 0;
		end
	else
		begin
		i2c_en_r0 <= mI2C_CTRL_CLK;
		i2c_en_r1 <= i2c_en_r0;
		end
end
wire	i2c_negclk = (i2c_en_r1 & ~i2c_en_r0) ? 1'b1 : 1'b0;		//negedge i2c_sclk transfer data

   I2C_Controller2 	u_I2C_Controller	
   (    
       .iCLK            (sys_clk),
       .iRST_N            (sys_rst),
                               
       .I2C_CLK        (mI2C_CTRL_CLK),    //    Controller Work Clock
       .I2C_EN            (i2c_negclk),        //    I2C DATA ENABLE
       .I2C_WDATA        (24'h420102),//    DATA:[SLAVE_ADDR,SUB_ADDR,DATA]
       .I2C_SCLK        (I2C_SCLK),            //    I2C CLOCK
       .I2C_SDAT        (I2C_SDAT),            //    I2C DATA
       
       .GO                (mI2C_GO),            //    Go Transfer
       .WR                (mI2C_WR),          //    END transfor
       .ACK            (mI2C_ACK),            //    ACK
       .END            (mI2C_END),            //    END transfor 
       .I2C_RDATA        (I2C_RDATA)            //    ID
   );

endmodule
