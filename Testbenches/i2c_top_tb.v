`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2025 10:36:35 PM
// Design Name: 
// Module Name: i2c_top_tb
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


module i2c_top_tb;
    reg clk = 0, rst = 0, new_dat = 0, r_w;
    reg [6:0]addr;
    reg [7:0]dat_in;
    wire [7:0]dat_out;
    wire busy, ack_err, done;
    i2ctop uut(clk, rst, new_dat, addr, r_w, dat_in, dat_out, busy, ack_err, done);
    
    always #5 clk = ~clk;
    initial begin
        rst = 1;
        repeat(5)@(posedge clk);
        rst = 0;
        repeat(20)@(posedge clk);
        new_dat = 1;
        r_w = 0;
        addr = 7'b0000001;
        dat_in = 8'b11100111;
        repeat(4722)@(posedge clk);
        //new_dat = 1;
        //r_w = 1;
        //addr = 7'b0000011;
        //dat_in = 0;
        repeat(4722)@(posedge clk);
        $stop;
    end
endmodule
