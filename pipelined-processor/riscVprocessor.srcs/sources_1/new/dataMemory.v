`timescale 1ns / 1ps
module dataMemory(
    input [63:0] memAddress,
    input [63:0] writeData,
    input clk,
    input memWrite,
    input memRead,
	output reg [63:0] readData,
	output reg [63:0] w0,output reg [63:0]w1,output reg [63:0]w2,output reg [63:0]w3,output reg [63:0]w4,output reg [63:0]w5,output reg [63:0]w6);

reg [7:0] dataMemory [511:0];
integer i;
initial begin
    for(i=0; i<64; i=i+1) begin
        dataMemory[i] = 8'd0 ;
    end
end
always @ (posedge clk) begin
    if (memWrite)
    begin
        dataMemory[memAddress] = writeData[7:0];
        dataMemory[memAddress+1] = writeData[15:8];
        dataMemory[memAddress+2] = writeData[23:16];
        dataMemory[memAddress+3] = writeData[31:24];
        
    end
end

always @ (*) begin
	if (memRead) begin
			readData = {32'b0,
			dataMemory[memAddress+3],
			dataMemory[memAddress+2],
			dataMemory[memAddress+1],
			dataMemory[memAddress]};
	end else begin
	readData = 64'b0; end
		w0 = {32'b0, dataMemory[memAddress + 259], dataMemory[memAddress + 258], dataMemory[memAddress + 257], dataMemory[memAddress + 256]};
w1 = {32'b0, dataMemory[memAddress + 263], dataMemory[memAddress + 262], dataMemory[memAddress + 261], dataMemory[memAddress + 260]};
w2 = {32'b0, dataMemory[memAddress + 267], dataMemory[memAddress + 266], dataMemory[memAddress + 265], dataMemory[memAddress + 264]};
w3 = {32'b0, dataMemory[memAddress + 271], dataMemory[memAddress + 270], dataMemory[memAddress + 269], dataMemory[memAddress + 268]};
w4 = {32'b0, dataMemory[memAddress + 275], dataMemory[memAddress + 274], dataMemory[memAddress + 273], dataMemory[memAddress + 272]};
w5 = {32'b0, dataMemory[memAddress + 279], dataMemory[memAddress + 278], dataMemory[memAddress + 277], dataMemory[memAddress + 276]};
w6 = {32'b0, dataMemory[memAddress + 283], dataMemory[memAddress + 282], dataMemory[memAddress + 281], dataMemory[memAddress + 280]};

	end 
	

endmodule
