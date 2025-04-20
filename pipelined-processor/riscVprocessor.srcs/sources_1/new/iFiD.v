`timescale 1ns / 1ps


module iFiD(
    input reset,
    input clk,
    input stall,
    input branchCheck,
    input [63:0] PCOut,
    input [31:0] instruction,
    output reg [63:0] PCOutDel,
    output reg [31:0] instructionDel
    );
    always @(posedge clk or posedge reset) begin
        if (reset == 1'b1) begin
            // Reset the IF/ID register
            instructionDel <= 32'b0; 
            PCOutDel <= 64'b0;
        end
        else if (stall) begin
            // Hold the previous values when stall is high
            instructionDel <= instructionDel;
            PCOutDel <= PCOutDel;
        end
        else begin
            // Update the IF/ID register on a normal clock cycle (stall = 0)
            if (branchCheck) begin
                // If there's a branch (assuming branch check logic is implemented)
                instructionDel <= 32'b0; 
            end else begin
                instructionDel <= instruction; 
            end
            PCOutDel <= PCOut;
        end
    end
    
endmodule
