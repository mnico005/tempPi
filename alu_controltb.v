`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:Marios Nicolaides
//
// Create Date:   19:07:28 01/23/2020
// Design Name:   fixedFloatConversion
// Module Name:   /home/ise/Desktop/CS161L/mnico005_lab2/fixedFloatConversion_tb.v
// Project Name:  mnico005_lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fixedFloatConversion
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fixedFloatConversion_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] targetnumber;
	reg [4:0] fixpointpos;
	reg opcode;

	// Outputs
	wire [31:0] result;
	reg  [31:0] R;

	// Instantiate the Unit Under Test (UUT)
	fixedFloatConversion uut (
		.clk(clk), 
		.rst(rst), 
		.targetnumber(targetnumber), 
		.fixpointpos(fixpointpos), 
		.opcode(opcode), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		 // Initialize inputs
        clk = 0; // Clear clock
        rst = 0; // Clear reset

        // Wait 100 ns for global reset to finish
        #100;

        // Synchronous reset
        rst = 1; clk = 0; #5
        rst = 1; clk = 1; #5
        rst = 0; clk = 0; #5

        // Start the clock
        forever begin 
            #5 clk = ~clk;
        end
    end

        
	 integer totalTests = 0;
    integer failedTests = 0;
    initial begin
        
        // Test:
		  // ---------------------------------------------
		  // Testing fix to float 
		  // ---------------------------------------------
		  $write("Test case 1: negative greater than -1");
        totalTests = totalTests + 1;
		  opcode = 0;
		  targetnumber = -32;
		  fixpointpos = 7;
		  R = 32'b10111110100000000000000000000000;
		  #10;
        // Check if result != expected
        if ( result != R  ) begin 
            $display("...failed");
            failedtests = failedtests + 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 2: negative less than -1");
        totalTests = totalTests + 1;
		  opcode = 0;
		  targetnumber = -16016;
		  fixpointpos = 7;
		  R = 32'b11000010111110100000000000000000;
		  #10;
        // Check if result != expected
        if ( result != R  ) begin 
            $display("...failed");
            failedtests = failedtests + 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 3: positive greater than 1");
        totalTests = totalTests + 1;
		  opcode = 0;
		  targetnumber = 1056;
		  fixpointpos = 7;
		  R = 32'b01000001000001000000000000000000;
		  #10;
        // Check if result != expected
        if ( result != R  ) begin 
            $display("...failed");
            failedtests = failedtests + 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 4: positive less than 1");
        totalTests = totalTests + 1;
		  opcode = 0;
		  targetnumber = 16;
		  fixpointpos = 7;
		  R = 32'b0111110000000000000000000000000;
		  #10;
        // Check if result != expected
        if ( result != R  ) begin 
            $display("...failed");
            failedtests = failedtests + 1;
        end else begin
            $display("...passed");
        end
		  
		  // ---------------------------------------------
		  // Testing fix to float 
		  // ---------------------------------------------
		  $write("Test case 5: negative greater than -1");
        totalTests = totalTests + 1;
		  opcode = 1;
		  targetnumber = 32'b10111110100000000000000000000000;
		  fixpointpos = 7;
		  R = -32;
		  #10;
        // Check if result != expected
        if ( result != R  ) begin 
            $display("...failed");
            failedtests = failedtests + 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 6: negative less than -1");
        totalTests = totalTests + 1;
		  opcode = 1;
		  targetnumber = 32'b11000010111110100000000000000000;
		  fixpointpos = 7;
		  R = -16016;
		  #10;
        // Check if result != expected
        if ( result != R  ) begin 
            $display("...failed");
            failedtests = failedtests + 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 7: positive greater than 1");
        totalTests = totalTests + 1;
		  opcode = 1;
		  targetnumber = 32'b01000001000001000000000000000000;
		  fixpointpos = 7;
		  R = 1056;
		  #10;
        // Check if result != expected
        if ( result != R  ) begin 
            $display("...failed");
            failedtests = failedtests + 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 8: positive less than 1");
        totalTests = totalTests + 1;
		  opcode = 1;
		  targetnumber = 32'b0111110000000000000000000000000;
		  fixpointpos = 7;
		  R = 16;
		  #10;
        // Check if result != expected
        if ( result != R  ) begin 
            $display("...failed");
            failedtests = failedtests + 1;
        end else begin
            $display("...passed");
        end
		  
		  $display("\n-----------------------------------------");
        $display("\nTesting complete\nPassed %d/%d tests", totalTests-failedTests,totalTests);
        $display("\n-----------------------------------------");
	end
      
endmodule

