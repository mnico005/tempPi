`timescale 1ns / 1ps

module fixedFloatConversionTB;

	// Inputs
	reg clk;
	reg rst; 
	reg[31:0] targetnumber;
	reg[4:0] fixpointpos;
	reg opcode;
	
	// Outputs
	wire[31:0] result;

   // -------------------------------------------------------
	// Instantiate the Unit Under Test (UUT)
	// -------------------------------------------------------
	fixedFloatConversion uut(
		.clk(clk),
		.rst(rst) ,  
		.targetnumber(targetnumber), 
		.fixpointpos(fixpointpos), 
		.opcode(opcode), 
		.result(result) );


	initial begin 
	 clk = 0; rst = 1; #50; 
	 clk = 1; rst = 1; #50; 
	 clk = 0; rst = 0; #50; 
	 clk = 1; rst = 0; #50; 
		 
	 forever begin 
		clk = ~clk; #50;
	 end 	 
	end 
	
	
	initial begin
		
		//---fixpoint pos == 7----
		
		//8.25
		$display("TC1");
		opcode = 0;
		targetnumber = 32'b0000_0000_0000_0000_0000_0100_0010_0000;
		fixpointpos = 7;
	   #100;
		if (result != 32'b0100_0001_0000_0100_0000_0000_0000_0000) $display("Test Failed");
	

		//-8.25
		$display("TC2");
		opcode = 0;
		targetnumber = 32'b1111_1111_1111_1111_1111_1011_1110_0000;
		fixpointpos = 7;
	   #100;
		if (result != 32'b1100_0001_0000_0100_0000_0000_0000_0000) $display("Test Failed");


		//0.0
		$display("TC3");
		opcode = 0;
		targetnumber = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		fixpointpos = 7;
	   #100;
		if (result != 32'b0000_0000_0000_0000_0000_0000_0000_0000) $display("Test Failed");
		
		
		//0.25
		$display("TC4");
		opcode = 0;
		targetnumber = 32'b0000_0000_0000_0000_0000_0000_0010_0000;
		fixpointpos = 7;
	   #100;
		if (result != 32'b0011_1110_1000_0000_0000_0000_0000_0000) $display("Test Failed");	


		//-0.25
		$display("TC5");
		opcode = 0;
		targetnumber = 32'b1111_1111_1111_1111_1111_1111_1110_0000;
		fixpointpos = 7;
	   #100;
		if (result != 32'b1011_1110_1000_0000_0000_0000_0000_0000) $display("Test Failed");	
		



		//---fixpoint pos == 5----

		//8.25
		$display("TC6");
		opcode = 0;
		targetnumber = 32'b0000_0000_0000_0000_0000_0001_0000_1000;
		fixpointpos = 5;
	   #100;
		if (result != 32'b0100_0001_0000_0100_0000_0000_0000_0000) $display("Test Failed");


		//-8.25
		$display("TC7");
		opcode = 0;
		targetnumber = 32'b1111_1111_1111_1111_1111_1110_1111_1000;
		fixpointpos = 5;
	   #100;
		if (result != 32'b1100_0001_0000_0100_0000_0000_0000_0000) $display("Test Failed");


		//0.0
		$display("TC8");
		opcode = 0;
		targetnumber = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		fixpointpos = 5;
	   #100;
		if (result != 32'b0000_0000_0000_0000_0000_0000_0000_0000) $display("Test Failed");
		
		
		//0.25
		$display("TC9");
		opcode = 0;
		targetnumber = 32'b0000_0000_0000_0000_0000_0000_0000_1000;
		fixpointpos = 5;
	   #100;
		if (result != 32'b0011_1110_1000_0000_0000_0000_0000_0000) $display("Test Failed");	


		//-0.25
		$display("TC10");
		opcode = 0;
		targetnumber = 32'b1111_1111_1111_1111_1111_1111_1111_1000;
		fixpointpos = 5;
	   #100;
		if (result != 32'b1011_1110_1000_0000_0000_0000_0000_0000) $display("Test Failed");	
		
		
		
		//---fixpoint pos == 1----

		//8.5
		$display("TC11");
		opcode = 0;
		targetnumber = 32'b0000_0000_0000_0000_0000_0000_0001_0001;
		fixpointpos = 1;
	   #100;
		if (result != 32'b0100_0001_0000_1000_0000_0000_0000_0000) $display("Test Failed");


		//-8.25
		$display("TC12");
		opcode = 0;
		targetnumber = 32'b1111_1111_1111_1111_1111_1111_1110_1111;
		fixpointpos = 1;
	   #100;
		if (result != 32'b1100_0001_0000_1000_0000_0000_0000_0000) $display("Test Failed");


		//0.0
		$display("TC13");
		opcode = 0;
		targetnumber = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
		fixpointpos = 1;
	   #100;
		if (result != 32'b0000_0000_0000_0000_0000_0000_0000_0000) $display("Test Failed");
		
		
		//0.5
		$display("TC14");
		opcode = 0;
		targetnumber = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
		fixpointpos = 1;
	   #100;
		if (result != 32'b0011_1111_0000_0000_0000_0000_0000_0000) $display("Test Failed");	


		//-0.5
		$display("TC15");
		opcode = 0;
		targetnumber = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
		fixpointpos = 1;
	   #100;
		if (result != 32'b1011_1111_0000_0000_0000_0000_0000_0000) $display("Test Failed");	
		
	end
      
endmodule
