`timescale 1ns / 1ps

module myalutb;

	parameter NUMBITS = 8 ;

	// Inputs
	reg clk ;
	reg reset ; 
	reg [NUMBITS-1:0] A;
	reg [NUMBITS-1:0] B;
	reg [2:0] opcode;

	// Outputs
	
	wire [NUMBITS-1:0] result;
	reg [NUMBITS-1:0] R ;
	wire carryout;
	wire overflow;
	wire zero;

   // -------------------------------------------------------
	// Instantiate the Unit Under Test (UUT)
	// -------------------------------------------------------
	
	my_alu #(NUMBITS) uut (
	   .clk(clk),
		.reset(reset) ,  
		.A(A), 
		.B(B), 
		.opcode(opcode), 
		.result(result), 
		.carryout(carryout), 
		.overflow(overflow), 
		.zero(zero)
	);

  	initial begin 
	
	 clk = 0 ; reset = 1 ; #50 ; 
	 clk = 1 ; reset = 1 ; #50 ; 
	 clk = 0 ; reset = 0 ; #50 ; 
	 clk = 1 ; reset = 0 ; #50 ; 
		 
	 forever begin 
		clk = ~clk; #50 ; 
	 end 
	 
	end 
	
	initial begin
		
		// ---------------------------------------------
		// Testing unsigned additions 
		// --------------------------------------------- 
		opcode = 3'b000 ; 
		A = 8'hFF ;
   	    B = 8'h01 ;
		R = 8'h00 ; 
		
	    #100 ; // Wait 
     
		$display("TC11 Unsigned Add ");
		if (R != result) $display  ("Result is wrong");
		if (zero != 1'b1) $display ("Zero  is wrong");
		if (carryout != 1'b1) $display ("Carryout is wrong");
		
		// ---------------------------------------------
		// Testing unsigned subs 
		// --------------------------------------------- 

		// ---------------------------------------------
		// Testing signed adds 
		// --------------------------------------------- 
		
		// ---------------------------------------------
		// Testing signed subs 
		// --------------------------------------------- 
		
		// ---------------------------------------------
		// Testing ANDS 
		// --------------------------------------------- 
		
		// ----------------------------------------
		// ORs 
		// ---------------------------------------- 
		
		// ----------------------------------------
		// XORs 
		// ---------------------------------------- 

		// ----------------------------------------
		// Div 2 
		// ----------------------------------------
	end
      
endmodule

