`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2025 06:23:41 PM
// Design Name: 
// Module Name: i2cmaster_tb
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


module i2cmaster_tb;
    reg clk = 0;
    reg rst = 0;
    reg new_dat = 0;
    reg [6:0]addr = 0;
    reg r_w = 0;
    reg [7:0]dat_in;
    wire [7:0]dat_out;
    wire sda, scl;
    wire busy;
    wire ack_err;
    
    i2cmaster dut(clk, rst, new_dat, addr, r_w, sda, scl, dat_in, dat_out, busy, ack_err);
    
    initial begin
        forever begin
            #5 clk = ~clk;
        end
    end
    initial begin
        rst = 1;
        repeat(5)@(posedge clk);
        rst = 0;
        new_dat = 1;
        r_w = 0;
        addr = 7'b1111000;
        dat_in = 8'b11111111;
        @(negedge busy);
        repeat(5)@(posedge clk);
        $stop;
    end
endmodule
