`timescale 1ns / 1ps

module program_counter_v1_compare_syn_tb(
    );

   // testbench control signals
    // string to display section labels on waveforms, change its radix 
    //      to ASCII in the waveform to view correctly
   reg [(20*8)-1:0] testcase; 
   reg [31:0] 	    error_count = 32'h00000000;
   reg 		    check_outputs = 1'b0;		    
   
   // inputs - shared by DUT and post-synthesis DUT
   reg 		    clk;
   reg 		    rst_n;
   reg 		    update_msbs;
   reg 		    update_lsbs;
   reg 		    jump;
   reg [5:0] 	    jump_destination;
   reg 		    branch;
   reg [5:0] 	    branch_offset;

   // outputs - separate for DUT and post-synthesis DUT
   wire [7:0] 	    mem_addr;
   wire [7:0] 	    mem_addr_syn;

    
      
    program_counter_v1 DUT(
    .clk(clk),
    .rst_n(rst_n),
    .update_msbs(update_msbs),
    .update_lsbs(update_lsbs),
    .jump(jump),
    .jump_destination(jump_destination),
    .branch(branch),
    .branch_offset(branch_offset),
    .mem_addr(mem_addr)
    );

   program_counter_v1_syn DUT_SYN(
    .clk(clk),
    .rst_n(rst_n),
    .update_msbs(update_msbs),
    .update_lsbs(update_lsbs),
    .jump(jump),
    .jump_destination(jump_destination),
    .branch(branch),
    .branch_offset(branch_offset),
    .mem_addr(mem_addr_syn)
    );

   // 10 ns clock period
   always #5 clk = ~clk;

   // initial block for SDF back annotation
   initial begin
      $sdf_annotate("../../synthesis/netlists/program_counter_v1_syn.sdf",program_counter_v1_compare_syn_tb.DUT_SYN, ,"back_annotate.log");
   end
  
   // initial block for stimulus generation
   initial begin
       $monitor("Testcase %s: Time = %t", testcase, $time);
       
       // initial values
       clk             = 0;
       rst_n           = 1;
       update_msbs     = 0;
       update_lsbs     = 0;
       jump            = 0;
       jump_destination = 6'h00;
       branch          = 0;
       branch_offset   = 6'h00;
       testcase            = "Reset_Checks";
       
       // check that reset works
       repeat(3)
	 @(negedge clk);
       
       // activate reset
       rst_n       = 0;
       repeat(2)
	 @(negedge clk);

       // turn on output checking after reset is applied
       check_outputs = 1'b1;
          
       // release reset and check
       rst_n       = 1;
       repeat(2)
	 @(negedge clk);
             
       // check updating program counter LSBs for normal operation
       testcase        = "LSBs_update";
       update_lsbs     = 1;    
       repeat(10)
	 @(negedge clk);
       update_lsbs = 0;
       
        // check updating program counter MSBs for normal operation        
       testcase            = "MSBs_update";
       update_msbs     = 1;       
       repeat(4)
	 @(negedge clk);
       update_msbs     = 0;   
       update_lsbs     = 1;
       repeat(6)
	 @(negedge clk);
       update_msbs     = 0;   
       update_lsbs     = 0;
       repeat(2)
	 @(negedge clk);
        
       // check jump mode      
       testcase            = "Jump"; 
       jump             = 1;
       jump_destination = 6'h0F;
       repeat(3)
	 @(negedge clk);
       jump_destination = 6'h0A;
       repeat(3)
	 @(negedge clk);
       jump             = 0;
         
       // check branch
       testcase            = "Banch"; 
       branch          = 1;
       branch_offset   = 6'h3F;
       repeat(2)
	 @(negedge clk);
       branch_offset   = 6'h04;
       repeat(2)
	 @(negedge clk);
       branch          = 0;

       repeat(3)
	 @(negedge clk);

       if (error_count == 0) begin
	  $display("\n\n----------SIMULATION PASSED   ----------\n\n");
       end else begin
	  $display("\n\n----------SIMULATION FAILED   ----------");
	  $display("---------- %d ERRORS TOTAL----------\n\n",error_count);
       end

       $finish;         
    end // initial begin


   // always block for response checking
   always @(negedge clk) begin
      if (check_outputs == 1'b1 ) begin
	 if (mem_addr != mem_addr_syn ) begin
	    $display("**FAIL**: Expected = %h, Actual = %h, Time = %t", mem_addr, 
		    mem_addr_syn, $time);
	    error_count = error_count + 1;
	 end
      end
   end

    
endmodule
