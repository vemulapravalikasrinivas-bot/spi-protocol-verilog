`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2026 18:46:57
// Design Name: 
// Module Name: spi_protocol
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


module spi_protocol(
    input clk, rst,
    input [15:0]data_in,
    output spi_cs, spi_sclk, spi_data,
    output [4:0]counter);

reg [15:0] MOSI;
reg [4:0] count;
reg cs_1, sclk;
reg [2:0] state;

always @(posedge clk or posedge rst)
    
    if(rst) begin
        MOSI<=16'b0;
        count<=5'd16;
        cs_1<=1'b1;
        sclk<=1'b0;
        state<=0;
        end
      else begin
      case(state) 
        0: begin sclk<=0; cs_1<=1; state<=1;end
        1: begin sclk<=0; cs_1<=0; MOSI<=data_in; count<=5'd15; state<=2;
        end
        2: begin sclk<=1'b1; 
        if(count>0) begin
            MOSI<={MOSI[14:0],1'b0};
            count<=count-1;
            state<=2;
            sclk<=1'b0;
            end
            else begin count<=5'd16;
            cs_1<=1'b1;
            state<=0;
            sclk<=1'b0;
            end
            end
          default: state<=0;
          
          endcase
          end
          assign spi_cs=cs_1;
          assign spi_sclk=sclk;
          assign spi_data=MOSI[15];
          assign counter=count;
          
          endmodule
            
            
  
