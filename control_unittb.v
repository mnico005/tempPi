`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:22:09 01/30/2020
// Design Name:   control_unit
// Module Name:   /home/ise/Desktop/CS161L/lab3/control_unittb.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: control_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
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

	initial begin
		// Initialize Inputs
		instr_op = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		forever begin 
            #5 clk = ~clk;
      end


	end
   integer totalTests = 0;
    integer failedTests = 0;
    initial begin
        // Initialize inputs

        // Wait 100 ns for global reset to finish
        #100;

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
		  
		  instr_op = 6'b110001 ; 
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
		  
		  instr_op = 6'b110101 ; 
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
		  
		  instr_op = 6'b001000 ; 
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

