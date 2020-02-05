`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
module fixedFloatConversion(
  input wire clk, 
  input wire rst, 
  input wire[31:0] targetnumber, 
  input wire[4:0] fixpointpos, 
  input wire opcode, // 1 is float to fix, 0 is fix to float
  output reg[31:0] result);

reg [31:0] floatresult;
reg [31:0] fixresult; 

reg [1:0] signBit;
reg [31:0] targetnumberCopy;
reg[7:0] exponent; 
integer index;
integer first1Pos;
reg [22:0] fraction; 
integer foundFirstOne;

always @ (posedge clk) begin
	if (opcode == 0) begin
		
		
		foundFirstOne = 0;
		first1Pos = 999;
		targetnumberCopy = targetnumber;
		signBit = targetnumberCopy[31];
		
		if (signBit == 1) begin
			targetnumberCopy = (~targetnumberCopy) + 1;
		end

		for(index = 30; index >= 0; index = index - 1) begin
		
			if (targetnumberCopy[index] == 1 && foundFirstOne == 0) begin
				exponent = index - fixpointpos + 127;
				first1Pos = index;
				foundFirstOne = 1;
			end
		end
		
		if(first1Pos == 999) begin
			signBit = 0;
			exponent = 0;
			fraction = 0;
		end
		
		else begin
			targetnumberCopy = targetnumberCopy << (31-first1Pos);
			fraction = targetnumberCopy[31:8];		
		end
		
		result = {signBit, exponent, fraction};
	end
end

	

// -------------------------------------------	
// From float to fix (Part 2)
// -------------------------------------------
// Your  Implementation  

// -------------------------------------------	
// Register the results 
// -------------------------------------------

//always @ ( posedge clk ) begin 
//    // synchronous reset
//    result <= opcode == 1 ?  fixresult : floatresult ;
//end 

endmodule