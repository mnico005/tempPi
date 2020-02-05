`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
module alu_control  (
    input wire [1:0] alu_op , 
    input wire [5:0] instruction_5_0 , 
    output reg [3:0] alu_out  
    );
	
	
always @(*)	begin
	case (alu_op) 
		2'b00: begin
			alu_out = 4'b0010;
		end
		2'b01: begin
			alu_out = 4'b0110;
		end
		2'b10: begin
			if (instruction_5_0 == 6'b100000) begin
				alu_out = 4'b0010;
			end
			else if(instruction_5_0 == 6'b100010) begin
				alu_out = 4'b0110;
			end
			else if(instruction_5_0 == 6'b100100) begin
				alu_out = 4'b0000;
			end
			else if(instruction_5_0 == 6'b100101) begin
				alu_out = 4'b0001;
			end
			else if(instruction_5_0 == 6'b100111) begin
				alu_out = 4'b1100;
			end
			else if (instruction_5_0 == 6'b101010) begin
				alu_out = 4'b0111;
			end
		end
	endcase
end
	

endmodule
