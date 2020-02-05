`timescale 1ns / 1ps

module control_unit  (
    input wire [5:0]  instr_op , 
    output reg  reg_dst      ,   
    output reg   branch    ,     
    output reg  mem_read ,  
    output reg   mem_to_reg  ,
    output reg  [1:0]  alu_op  ,        
    output reg   mem_write  , 
    output reg   alu_src     ,    
    output reg   reg_write   
    );
always @(*) begin
	case (instr_op)
		6'b000000: begin
			reg_dst <= 1;
			alu_src <= 0;
			mem_to_reg <= 0;
			reg_write <=1;
			mem_read <=0;
			mem_write <= 0;
			branch <= 0;
			alu_op <= 2'b10;
		end
		6'b100011: begin
			reg_dst <= 0;
			alu_src <= 1;
			mem_to_reg <= 1;
			reg_write <=1;
			mem_read <=1;
			mem_write <= 0;
			branch <= 0;
			alu_op <= 2'b00;
		end
		6'b101011: begin
			
			alu_src <= 1;
			
			reg_write <=0;
			mem_read <=0;
			mem_write <= 1;
			branch <= 0;
			alu_op <= 2'b00;
		end
		6'b000100: begin
			
			alu_src <= 0;
			
			reg_write <=0;
			mem_read <=0;
			mem_write <= 0;
			branch <= 1;
			alu_op <= 2'b01;
		end
		/*6'b001000: begin
			reg_dst <= 0;
			alu_src <= 1;
			mem_to_reg <= 0;
			reg_write <= 1;
			mem_read <= 0;
			mem_write <= 0;
			branch <= 0;
			alu_op <= 2'b ;
		end*/
	endcase
end

endmodule
