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
        // Initialize inputs

        // Wait 100 ns for global reset to finish
        #100;

        // Wait for reset to finish
        #10

        // Test:
		  // ---------------------------------------------
		  // Testing unsigned additions 
		  // --------------------------------------------- 
		  opcode = 3'b000 ; 
        $write("Test case 1: <Description>...");
        totalTests = totalTests + 1;
        // Set input values
		   
		  A = 8'hFF ;
   	  B = 8'h01 ;
		  R = 8'h00 ; 
		
        #10;
        // Check if result != expected
        if ( result != R  || zero != 1'b1 || carryout != 1'b1) begin 
            $display("...failed");
            failedtests += 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 2: <Description>...");
        totalTests = totalTests + 1;
        // Set input values
		   
		  A = 8'h00 ;
   	  B = 8'h01 ;
		  R = 8'h01 ; 
		
        #10;
        // Check if result != expected
        if ( result != R  || zero != 1'b0 || carryout != 1'b0) begin 
            $display("...failed");
            failedtests += 1;
        end else begin
            $display("...passed");
        end
		  
		  // ---------------------------------------------
		  // Testing unsigned subs 
		  // --------------------------------------------- 
		  opcode = 3'b001 ; 
        $write("Test case 3: <Description>...");
        totalTests = totalTests + 1;
        // Set input values
		   
		  A = 8'h00 ;
   	  B = 8'h01 ;
		  R = 8'hFF ; 
		
        #10;
        // Check if result != expected
        if ( result != R  || zero != 1'b0 || carryout != 1'b0) begin 
            $display("...failed");
            failedtests += 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 4: <Description>...");
        totalTests = totalTests + 1;
        // Set input values
		   
		  A = 8'hFF ;
   	  B = 8'hFF ;
		  R = 8'h00 ; 
		
        #10;
        // Check if result != expected
        if ( result != R  || zero != 1'b1 || carryout != 1'b0) begin 
            $display("...failed");
            failedtests += 1;
        end else begin
            $display("...passed");
        end
		  
		  // ---------------------------------------------
		  // Testing signed adds 
		  // ---------------------------------------------
        opcode = 3'b010 ; 
        $write("Test case 5: <Description>...");
        totalTests = totalTests + 1;
        // Set input values
		   
		  A = 8'h7F ;
   	  B = 8'h01 ;
		  R = 8'h80 ; 
		
        #10;
        // Check if result != expected
        if ( result != R  || zero != 1'b0 || overflow != 1'b1) begin 
            $display("...failed");
            failedtests += 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 6: <Description>...");
        totalTests = totalTests + 1;
        // Set input values
		   
		  A = 8'hF0 ;
   	  B = 8'h80 ;
		  R = 8'h70 ; 
		
        #10;
        // Check if result != expected
        if ( result != R  || zero != 1'b0 || overflow != 1'b1) begin 
            $display("...failed");
            failedtests += 1;
        end else begin
            $display("...passed");
        end
		  
		  // ---------------------------------------------
		  // Testing ANDS 
		  // ---------------------------------------------
		  opcode = 3'b100 ; 
        $write("Test case 7: <Description>...");
        totalTests = totalTests + 1;
        // Set input values
		   
		  A = 8'h00 ;
   	  B = 8'hFF ;
		  R = 8'h00 ; 
		
        #10;
        // Check if result != expected
        if ( result != R  || zero != 1'b1 ) begin 
            $display("...failed");
            failedtests += 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 8: <Description>...");
        totalTests = totalTests + 1;
        // Set input values
		   
		  A = 8'hFF ;
   	  B = 8'hFF ;
		  R = 8'h00 ; 
		
        #10;
        // Check if result != expected
        if ( result != R  || zero != 1'b0 ) begin 
            $display("...failed");
            failedtests += 1;
        end else begin
            $display("...passed");
        end
		  
		  // ----------------------------------------
		  // ORs 
		  // ----------------------------------------
		  
		  opcode = 3'b101 ; 
        $write("Test case 9: <Description>...");
        totalTests = totalTests + 1;
        // Set input values
		   
		  A = 8'h00 ;
   	  B = 8'hFF ;
		  R = 8'hFF ; 
		
        #10;
        // Check if result != expected
        if ( result != R  || zero != 1'b0 ) begin 
            $display("...failed");
            failedtests += 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 10: <Description>...");
        totalTests = totalTests + 1;
        // Set input values
		   
		  A = 8'h00 ;
   	  B = 8'h00 ;
		  R = 8'h00 ; 
		
        #10;
        // Check if result != expected
        if ( result != R  || zero != 1'b1 ) begin 
            $display("...failed");
            failedtests += 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 11: <Description>...");
        totalTests = totalTests + 1;
        // Set input values
		   
		  A = 8'hFF ;
   	  B = 8'hFF ;
		  R = 8'hFF ; 
		
        #10;
        // Check if result != expected
        if ( result != R  || zero != 1'b0 ) begin 
            $display("...failed");
            failedtests += 1;
        end else begin
            $display("...passed");
        end
		  
		  // ----------------------------------------
		  // XORs 
		  // ----------------------------------------
		  
		  opcode = 3'b110 ; 
        $write("Test case 12: <Description>...");
        totalTests = totalTests + 1;
        // Set input values
		   
		  A = 8'h00 ;
   	  B = 8'hFF ;
		  R = 8'hFF ; 
		
        #10;
        // Check if result != expected
        if ( result != R  || zero != 1'b0 ) begin 
            $display("...failed");
            failedtests += 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 13: <Description>...");
        totalTests = totalTests + 1;
        // Set input values
		   
		  A = 8'h00 ;
   	  B = 8'h00 ;
		  R = 8'h00 ; 
		
        #10;
        // Check if result != expected
        if ( result != R  || zero != 1'b1 ) begin 
            $display("...failed");
            failedtests += 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 14: <Description>...");
        totalTests = totalTests + 1;
        // Set input values
		   
		  A = 8'hFF ;
   	  B = 8'hFF ;
		  R = 8'h00 ; 
		
        #10;
        // Check if result != expected
        if ( result != R  || zero != 1'b1 ) begin 
            $display("...failed");
            failedtests += 1;
        end else begin
            $display("...passed");
        end
		  
		  // ----------------------------------------
		  // Div 2 
		  // ----------------------------------------
		  opcode = 3'b111 ; 
        $write("Test case 15: <Description>...");
        totalTests = totalTests + 1;
        // Set input values
		   
		  A = 8'hF0 ;
   	  
		  R = 8'h78 ; 
		
        #10;
        // Check if result != expected
        if ( result != R  || zero != 1'b0 ) begin 
            $display("...failed");
            failedtests += 1;
        end else begin
            $display("...passed");
        end
		  
		  $write("Test case 15: <Description>...");
        totalTests = totalTests + 1;
        // Set input values
		   
		  A = 8'h01 ;
   	  
		  R = 8'h00 ; 
		
        #10;
        // Check if result != expected
        if ( result != R  || zero != 1'b1 ) begin 
            $display("...failed");
            failedtests += 1;
        end else begin
            $display("...passed");
        end

		  
		  
        $display("\n-----------------------------------------");
        $display("\nTesting complete\nPassed %d/%d tests", totalTests-failedTests,totalTests);
        $display("\n-----------------------------------------");
    end
endmodule
