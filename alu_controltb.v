`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:21:46 01/30/2020
// Design Name:   alu_control
// Module Name:   /home/ise/Desktop/CS161L/lab3/alu_controltb.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_controltb;

	// Inputs
	reg [1:0] alu_op;
	reg [5:0] instruction_5_0;

	// Outputs
	wire [3:0] alu_out;

	// Instantiate the Unit Under Test (UUT)
	alu_control uut (
		.alu_op(alu_op), 
		.instruction_5_0(instruction_5_0), 
		.alu_out(alu_out)
	);

	initial begin
		// Initialize Inputs
		alu_op = 0;
		instruction_5_0 = 0;

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
		  alu_op = 2'b00 ; 
        $write("Test case 1: <Description>...");
        totalTests = totalTests + 1; 
		  instruction_5_0 = 6'b000000
        #10;
        // Check if result != expected
        if (alu_out ! = 4'b0010) begin 
            $display("...failed");
            failedTests = failedTests + 1;
        end else begin
            $display("...passed");
        end   
		  
		  alu_op = 2'b01 ; 
        $write("Test case 2: <Description>...");
        totalTests = totalTests + 1; 
		  instruction_5_0 = 6'b000000
        #10;
        // Check if result != expected
        if (alu_out ! = 4'b0110) begin 
            $display("...failed");
            failedTests = failedTests + 1;
        end else begin
            $display("...passed");
        end 
		  
		  alu_op = 2'b10 ; 
        $write("Test case 3: <Description>...");
        totalTests = totalTests + 1; 
		  instruction_5_0 = 6'b100000
        #10;
        // Check if result != expected
        if (alu_out ! = 4'b0010) begin 
            $display("...failed");
            failedTests = failedTests + 1;
        end else begin
            $display("...passed");
        end
		  
		   $write("Test case 4: <Description>...");
        totalTests = totalTests + 1; 
		  instruction_5_0 = 6'b100010
        #10;
        // Check if result != expected
        if (alu_out ! = 4'b0110) begin 
            $display("...failed");
            failedTests = failedTests + 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 5: <Description>...");
        totalTests = totalTests + 1; 
		  instruction_5_0 = 6'b100100
        #10;
        // Check if result != expected
        if (alu_out ! = 4'b0000) begin 
            $display("...failed");
            failedTests = failedTests + 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 6: <Description>...");
        totalTests = totalTests + 1; 
		  instruction_5_0 = 6'b100101
        #10;
        // Check if result != expected
        if (alu_out ! = 4'b0001) begin 
            $display("...failed");
            failedTests = failedTests + 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 7: <Description>...");
        totalTests = totalTests + 1; 
		  instruction_5_0 = 6'b101010
        #10;
        // Check if result != expected
        if (alu_out ! = 4'b0111) begin 
            $display("...failed");
            failedTests = failedTests + 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 8: <Description>...");
        totalTests = totalTests + 1; 
		  instruction_5_0 = 6'b100111
        #10;
        // Check if result != expected
        if (alu_out ! = 4'b1100) begin 
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

