`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2025 1:30:12 PM
// Design Name: 
// Module Name: MUX
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX (a,b,c,d,s0,s1,out);

input wire a,b,c,d;
input wire s0,s1;

output reg out;

always @ (a or b or c or d or s0, s1)
begin 

case(s0|s1)
2'b00 : out <= a;
2'b01 : out <= b;
2'b10 : out <= c;
2'b11 : out <= d;

endcase
end
endmodule

// Design for MUX taken from Project 1 Pointers Slides
