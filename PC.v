`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2025 12:58:26 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input wire clk,
    input wire reset,
    input wire jump_to,
    input wire [15:0] cin,
    output reg [15:0] cout
    );
    
    always@(posedge clk)
    begin
        if (reset)     
            cout <= 0;
        else if (jump_to)
            cout <= cin;
        else           
            cout <= cout + 16'd2;
    end
endmodule