`timescale 1ns / 1ps

// ECE 6213
// Victor Nin
// Elevator Controller Test Bench
// Project 3


module elevator_controller_compare_syn_tb();


    // testbench control signals
    // string to display section labels on waveforms, change its radix 
    //      to ASCII in the waveform to view correctly
   reg [(20*8)-1:0] testcase; 
   reg [31:0] 	    error_count = 32'h00000000;
   reg 		    check_outputs = 1'b0;

    reg clk, rst_n;
    reg [2:0] elevator_floor_button_pressed;
    reg [3:0] floor_button_pressed;

    wire [2:0] floor; // Indicates which floor the elevator is on
    wire door;
    wire [3:0] floor_button_out;
    wire [2:0] elevator_button_out;

    // DUT Synthesis vs DUT
    wire [2:0] floor_syn; // Indicates which floor the elevator is on
    wire door_syn;
    wire [3:0] floor_button_out_syn;
    wire [2:0] elevator_button_out_syn;

    // Instantiate the DUT (Device Under Test)
    elevator_controller DUT(
        .clk(clk),
        .rst_n(rst_n),
        .elevator_floor_button_pressed(elevator_floor_button_pressed),
        .floor_button_pressed(floor_button_pressed),
        .floor(floor),
        .door(door),
        .elevator_button_out(elevator_button_out),
        .floor_button_out(floor_button_out)
    );

    elevator_controller_syn DUT_SYN(
        .clk(clk),
        .rst_n(rst_n),
        .elevator_floor_button_pressed(elevator_floor_button_pressed),
        .floor_button_pressed(floor_button_pressed),
        .floor(floor_syn),
        .door(door_syn),
        .elevator_button_out(elevator_button_out_syn),
        .floor_button_out(floor_button_out_syn)
    );

    // Clock generation
    always #5 clk = ~clk;  // 10ns clock period (100 MHz)
   

    initial begin
      $sdf_annotate("../../synthesis/netlists/elevator_controller_syn.sdf",elevator_controller_compare_syn_tb.DUT_SYN, ,"back_annotate.log");
   end

    initial begin
    // Initialize
    clk = 0;
    rst_n = 0;
    elevator_floor_button_pressed = 3'b000;
    floor_button_pressed = 4'b0000;

    // Reset the system
    repeat (5) @(negedge clk);
    rst_n = 1;
    check_outputs = 1'b1;

    // Add monitor to track the door state in real-time
    $monitor("Time: %0t | Floor: %b | Door: %b", $time, floor, door);

    // Test Case 6: Floor 3 -> Floor 1
    $display("Test Case 6: Floor 3 -> Floor 1");
    testcase            = "Test Case 6";

    repeat (5) @(negedge clk);
    floor_button_pressed[0] = 1;
    $display("Floor 3 (Down) button pressed");

    //Release floor 1 up button
    repeat (1) @(negedge clk);
    floor_button_pressed[0] = 0;
    $display("Floor 3 (Down) button released");


    // Wait for a few cycles and check the state
    repeat (10) @(negedge clk);
    $display("Floor: %b, Door: %b", floor, door);

    // Now press elevator button for floor 2 & 3
    repeat (5) @(negedge clk);
    elevator_floor_button_pressed[2] = 1;
    $display("Elevator button for Floor 1 pressed");

    //Release Elevator button for floor 2 & 3
    repeat (1) @(negedge clk);
    elevator_floor_button_pressed[2] = 0;
    $display("Elevator button for Floor 1 released");

     // Wait for a few cycles and check the state
    repeat (10) @(negedge clk);
    $display("Floor: %b, Door: %b", floor, door);

    // Press floor 1 up button
    repeat (5) @(negedge clk);
    floor_button_pressed[3] = 1;
    $display("Floor 1 (Up) button pressed");

    //Release floor 1 up button
    repeat (1) @(negedge clk);
    floor_button_pressed[3] = 0;
    $display("Floor 1 (Up) button released");


    // Wait for a few cycles and check the state
    repeat (10) @(negedge clk);
    $display("Floor: %b, Door: %b", floor, door);

    // Press floor 2 up & down button
    repeat (5) @(negedge clk);
    floor_button_pressed[1] = 1;
    floor_button_pressed[2] = 1;
    $display("Floor 2 (Up) button pressed");
    $display("Floor 2 (Down) button pressed");

    //Release floor 2 up & down button
    repeat (1) @(negedge clk);
    floor_button_pressed[1] = 0;
    floor_button_pressed[2] = 0;
    $display("Floor 2 (Up) button released");
    $display("Floor 2 (Down) button released");


    // Now press elevator button for floor 2 & 3
    repeat (5) @(negedge clk);
    elevator_floor_button_pressed[1] = 1;
    elevator_floor_button_pressed[0] = 1;
    $display("Elevator button for Floor 2 pressed");
    $display("Elevator button for Floor 3 pressed");

    //Release Elevator button for floor 2 & 3
    repeat (1) @(negedge clk);
    elevator_floor_button_pressed[1] = 0;
    elevator_floor_button_pressed[0] = 0;
    $display("Elevator button for Floor 2 released");
    $display("Elevator button for Floor 3 released");

    // Press floor 2 up & down button
    repeat (2) @(negedge clk);
    floor_button_pressed[0] = 1;
    $display("Floor 3 (Down) button pressed");
    $display("Test Case 5: Floor3 -> Floor2");
    testcase            = "Test Case 5";

    //Release floor 2 up & down button
    repeat (1) @(negedge clk);
    floor_button_pressed[0] = 0;
    $display("Floor 3 (Down) button released");

    // Now press elevator button for floor 2 & 3
    repeat (5) @(negedge clk);
    elevator_floor_button_pressed[1] = 1;
    $display("Elevator button for Floor 2 pressed");

    //Release Elevator button for floor 2 & 3
    repeat (1) @(negedge clk);
    elevator_floor_button_pressed[1] = 0;
    $display("Elevator button for Floor 2 released");

     // Wait for a few cycles and check the state
    repeat (10) @(negedge clk);
    $display("Floor: %b, Door: %b", floor, door);

    // Now press elevator button for floor 1
    repeat (5) @(negedge clk);
    elevator_floor_button_pressed[2] = 1;
    $display("Elevator button for Floor 1 pressed");
    $display("Test Case 4: Floor2 -> Floor1");
    testcase            = "Test Case 4";

    //Release Elevator button for floor 1
    repeat (1) @(negedge clk);
    elevator_floor_button_pressed[2] = 0;
    $display("Elevator button for Floor 1 released");



    // Wait for elevator to reach Floor 1
    repeat (25) @(negedge clk);
    $display("Floor: %b, Door: %b", floor, door);


    // Ensure buttons are cleared at the right time
    if (elevator_button_out[0] == 0 && floor_button_out[3] == 0) begin
        $display("Test Case 9 Passed: Buttons cleared correctly after no passagers were stuck");
        testcase            = "Test Case 9";
    end else begin
        $display("Buttons did not clear correctly");
    end


    if (error_count == 0) begin
	  $display("\n\n----------SIMULATION PASSED   ----------\n\n");
       end else begin
	  $display("\n\n----------SIMULATION FAILED   ----------");
	  $display("---------- %d ERRORS TOTAL----------\n\n",error_count);
       end

    $finish;
    end

    // always block for response checking
   always @(negedge clk) begin
      if (check_outputs == 1'b1 ) begin
	 if (floor != floor_syn) begin
	    $display("**FAIL**: Expected Floor = %h, Actual = %h, Time = %t", floor, 
		    floor_syn, $time);
	    error_count = error_count + 1;
	 end
     else if (floor_button_out != floor_button_out_syn) begin
        $display("**FAIL**: Expected Floor Button Out = %h, Actual = %h, Time = %t", floor_button_out, 
		    floor_button_out_syn, $time);
	    error_count = error_count + 1;
     end
     else if (elevator_button_out != elevator_button_out_syn) begin
        $display("**FAIL**: Expected Elevator Button = %h, Actual = %h, Time = %t", elevator_button_out, 
		    elevator_button_out_syn, $time);
	    error_count = error_count + 1;
     end
     else if (door != door_syn) begin
        $display("**FAIL**: Expected Door = %h, Actual = %h, Time = %t", door, 
		    door_syn, $time);
	    error_count = error_count + 1;
     end
      end
   end

endmodule

	







