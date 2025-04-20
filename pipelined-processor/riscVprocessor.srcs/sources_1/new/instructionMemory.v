`timescale 1ns / 1ps
module instructionMemory(
    input [63:0] instAddress,
//    input stall,
	output reg [31:0] instruction);

reg [7:0] memory [179:0];
//reg [7:0] memory [27:0];
initial begin
    
  {memory[3], memory[2], memory[1], memory[0]} = 32'h10000593; //1
{memory[7], memory[6], memory[5], memory[4]} = 32'h01100093; //2
{memory[11], memory[10], memory[9], memory[8]} = 32'h06300093; //3
{memory[15], memory[14], memory[13], memory[12]} = 32'h00900193; //4
{memory[19], memory[18], memory[17], memory[16]} = 32'h01f00213; //5
{memory[23], memory[22], memory[21], memory[20]} = 32'h00500293; //6
{memory[27], memory[26], memory[25], memory[24]} = 32'h01a00313; //7
{memory[31], memory[30], memory[29], memory[28]} = 32'h00b00393; //8
{memory[35], memory[34], memory[33], memory[32]} = 32'h0015a023; //9
{memory[39], memory[38], memory[37], memory[36]} = 32'h0025a223; //10
{memory[43], memory[42], memory[41], memory[40]} = 32'h0035a423; //11
{memory[47], memory[46], memory[45], memory[44]} = 32'h0045a623; //12
{memory[51], memory[50], memory[49], memory[48]} = 32'h0055a823; //13
{memory[55], memory[54], memory[53], memory[52]} = 32'h0065aa23; //14
{memory[59], memory[58], memory[57], memory[56]} = 32'h0075ac23; //15
{memory[63], memory[62], memory[61], memory[60]} = 32'h10000293; //16
{memory[67], memory[66], memory[65], memory[64]} = 32'h00700313; //17
{memory[71], memory[70], memory[69], memory[68]} = 32'h00000413; //18
{memory[75], memory[74], memory[73], memory[72]} = 32'h06640463; //19
{memory[79], memory[78], memory[77], memory[76]} = 32'h10000293; //20
{memory[83], memory[82], memory[81], memory[80]} = 32'h00030493; //21
{memory[87], memory[86], memory[85], memory[84]} = 32'h00000793; //22
{memory[91], memory[90], memory[89], memory[88]} = 32'h00878863; //23
{memory[95], memory[94], memory[93], memory[92]} = 32'hfff48493; //24
{memory[99], memory[98], memory[97], memory[96]} = 32'h00178793; //25
{memory[103], memory[102], memory[101], memory[100]} = 32'hfe000ae3; //26
{memory[107], memory[106], memory[105], memory[104]} = 32'hfff48493; //27
{memory[111], memory[110], memory[109], memory[108]} = 32'h00000513; //28
{memory[115], memory[114], memory[113], memory[112]} = 32'h02950c63; //29
{memory[119], memory[118], memory[117], memory[116]} = 32'h00251593; //30
{memory[123], memory[122], memory[121], memory[120]} = 32'h00b285b3; //31
{memory[127], memory[126], memory[125], memory[124]} = 32'h00150613; //32
{memory[131], memory[130], memory[129], memory[128]} = 32'h00261613; //33
{memory[135], memory[134], memory[133], memory[132]} = 32'h00c28633; //34
{memory[139], memory[138], memory[137], memory[136]} = 32'h0005a683; //35
{memory[143], memory[142], memory[141], memory[140]} = 32'h00062703; //36
{memory[147], memory[146], memory[145], memory[144]} = 32'h00d74463; //37
{memory[151], memory[150], memory[149], memory[148]} = 32'h00000663; //38
{memory[155], memory[154], memory[153], memory[152]} = 32'h00e5a023; //39
{memory[159], memory[158], memory[157], memory[156]} = 32'h00d62023; //40
{memory[163], memory[162], memory[161], memory[160]} = 32'h00150513; //41
{memory[167], memory[166], memory[165], memory[164]} = 32'hfc0006e3; //42
{memory[171], memory[170], memory[169], memory[168]} = 32'h00140413; //43
{memory[175], memory[174], memory[173], memory[172]} = 32'hf8000ee3; //44
{memory[179], memory[178], memory[177], memory[176]} = 32'h00000013; //45

end
always @(*)
	begin
//	if(stall) instruction = 32'b0; else 
		instruction={memory[instAddress+3],memory[instAddress+2],memory[instAddress+1],memory[instAddress]};
	end
endmodule
