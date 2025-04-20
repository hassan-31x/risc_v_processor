`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2024 05:51:19 PM
// Design Name: 
// Module Name: instFlush
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


module instFlush(
    input branchCheck,
    input [31:0] instructionIFID,
    input branchIDEX,
    input memtoRegIDEX,
    input [1:0] ALUOpIDEX,
    input ALUSrcIDEX,
    input memReadIDEX,
    input memWriteIDEX,
    input regWriteIDEX,
    
    output reg [31:0] instructionIFIDFlushed,
    output reg branchIDEXFlushed,
    output reg memtoRegIDEXFlushed,
    output reg [1:0] ALUOpIDEXFlushed,
    output reg ALUSrcIDEXFlushed,
    output reg memReadIDEXFlushed,
    output reg memWriteIDEXFlushed,
    output reg regWriteIDEXFlushed
    );
    
    always @(*) begin
        if(branchCheck) begin
            instructionIFIDFlushed = 32'b0;
            branchIDEXFlushed = 1'b0;
            memtoRegIDEXFlushed = 1'b0;
            ALUOpIDEXFlushed = 2'b0;
            ALUSrcIDEXFlushed = 1'b0;
            memReadIDEXFlushed = 1'b0;
            memWriteIDEXFlushed = 1'b0;
            regWriteIDEXFlushed = 1'b0;
        end else begin
            instructionIFIDFlushed = instructionIFID;
            branchIDEXFlushed = branchIDEX;
            memtoRegIDEXFlushed = memtoRegIDEX;
            ALUOpIDEXFlushed = ALUOpIDEX;
            ALUSrcIDEXFlushed = ALUSrcIDEX;
            memReadIDEXFlushed = memReadIDEX;
            memWriteIDEXFlushed = memWriteIDEX;
            regWriteIDEXFlushed = regWriteIDEX;
        end
    end
    
    
endmodule
