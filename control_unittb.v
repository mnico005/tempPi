`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

module control_unittb;

	// Inputs
	reg [5:0] instr_op;

	// Outputs
	wire reg_dst;
	wire branch;
	wire mem_read;
	wire mem_to_reg;
	wire [1:0] alu_op;
	wire mem_write;
	wire alu_src;
	wire reg_write;

	// Instantiate the Unit Under Test (UUT)
	control_unit uut (
		.instr_op(instr_op), 
		.reg_dst(reg_dst), 
		.branch(branch), 
		.mem_read(mem_read), 
		.mem_to_reg(mem_to_reg), 
		.alu_op(alu_op), 
		.mem_write(mem_write), 
		.alu_src(alu_src), 
		.reg_write(reg_write)
	);

	
   integer totalTests = 0;
    integer failedTests = 0;
    initial begin
        // Initialize inputs
			instr_op = 0;
        // Wait for reset to finish
        #10

        // Test:
		  // ---------------------------------------------
		  // Testing unsigned additions 
		  // --------------------------------------------- 
		  instr_op = 6'b000000 ; 
        $write("Test case 1: <Description>...");
        totalTests = totalTests + 1; 
		
        #10;
        // Check if result != expected
        if (alu_op != 2'b10 || branch != 0 || mem_read != 0 || mem_write != 0 || reg_write!= 1 || mem_to_reg != 0 || alu_src != 0 || reg_dst != 1) begin 
            $display("...failed");
            failedTests = failedTests + 1;
        end else begin
            $display("...passed");
        end   
		  
		  instr_op = 6'b100011 ; 
        $write("Test case 2: <Description>...");
        totalTests = totalTests + 1; 
		
        #10;
        // Check if result != expected
        if (alu_op != 2'b00 || branch != 0 || mem_read != 1 || mem_write != 0 || reg_write!= 1 || mem_to_reg != 1 || alu_src != 1 || reg_dst != 0) begin 
            $display("...failed");
            failedTests = failedTests + 1;
        end else begin
            $display("...passed");
        end 
		  
		  instr_op = 6'b101011 ; 
        $write("Test case 3: <Description>...");
        totalTests = totalTests + 1; 
		
        #10;
        // Check if result != expected
        if (alu_op != 2'b00 || branch != 0 || mem_read != 0 || mem_write != 1 || reg_write!= 0  || alu_src != 1 ) begin 
            $display("...failed");
            failedTests = failedTests + 1;
        end else begin
            $display("...passed");
        end 
		  
		  instr_op = 6'b000100 ; 
        $write("Test case 4: <Description>...");
        totalTests = totalTests + 1; 
		
        #10;
        // Check if result != expected
        if (alu_op != 2'b01 || branch != 1 || mem_read != 0 || mem_write != 0 || reg_write!= 0  || alu_src != 0 ) begin 
            $display("...failed");
            failedTests = failedTests + 1;
        end else begin
            $display("...passed");
        end 
		  
		  $display("\n-----------------------------------------");
        $display("\nTesting complete\nPassed %d/%d tests", totalTests-failedTests,totalTests);
        $display("\n-----------------------------------------");
	end 
endmodule

