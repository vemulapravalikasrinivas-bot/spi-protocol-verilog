`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2026 19:01:13
// Design Name: 
// Module Name: spi_tb
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


module spi_tb;

    reg clk, rst;
    reg [15:0]data_in;
    wire spi_cs, spi_sclk, spi_data;
    wire [4:0]counter;

spi_protocol uut(.clk(clk),.rst(rst),.data_in(data_in),.spi_cs(spi_cs),
                    .spi_sclk(spi_sclk),.spi_data(spi_data),.counter(counter));

always #5 clk=~clk;

 initial begin
        // Initialize values
        clk = 0;
        rst = 1;
        data_in = 0;

        // Apply reset
        #10 rst = 0;

        // Provide different input data
        #10 data_in = 16'hA569;
        #335 data_in = 16'h2563;
        #335 data_in = 16'h9B63;
        #335 data_in = 16'h6A61; 

        #500 $finish;
    end

endmodule
