`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
module fixedFloatConversion(
  input wire clk, 
  input wire rst , 
  input wire[31:0] targetnumber, 
  input wire[4:0] fixpointpos , 
  input wire opcode , 
  output reg[31:0] result );

reg [31:0] floatresult ; 
reg [31:0] fixresult ; 


reg [1:0] signBit;
reg [31:0] targetnumberCopy;
reg[7:0] exponent; 
integer index;
integer first1Pos;
reg [22:0] fraction; 
integer foundFirstOne;


reg sign = 0;  
integer exp2;
reg [31:0] temp; 

always @(*) begin 
	floatresult= 32'h0;
	fixresult=32'h0;

	case (opcode) 
	1'b00: begin
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
		
		floatresult = {signBit, exponent, fraction};
	end
// -------------------------------------------
// From fix to float (Part 1)
// -------------------------------------------
// Your  Implementation 

// -------------------------------------------	
// From float to fix (Part 2)
// -------------------------------------------
// Your  Implementation  
	1'b01: begin 
				
		sign = targetnumber[31];
		exp2 = targetnumber[30:23] - 127;
		temp = 1;
		temp[23] = 1;
		temp[22:0] = targetnumber[22:0];
		temp = temp >> (23 - (fixpointpos + exp2));
		
		if (sign == 1'b1) begin 
			temp=-temp;
		end
		
		fixresult= temp; 
  
  end 
  
  endcase
  end

// -------------------------------------------	
// Register the results 
// -------------------------------------------

always @ ( posedge clk ) begin 
    // Synchronous reset
    result <= opcode == 1 ?  fixresult : floatresult ;

end 
endmodule
