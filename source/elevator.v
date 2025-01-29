`timescale 1ns / 1ps

// ECE 6213
// Victor Nin
// Elevator FSM
// Project 3


module elevator (
    input wire clk,
    input wire rst_n,
    input wire [2:0] elevator_floor_button,  //000 = Floor 1 button, Floor 2 button, Floor 3 button
    input wire [3:0] floor_button,      // 0000 = floor 1 up, floor 2 down, floor 2 up, floor 3 down

    output reg [2:0] floor, //Indicates which floor elevator is on
    output reg door,
    output reg [3:0] floor_button_clear_internal,
    output reg [3:0] elevator_floor_button_clear_internal
    );

    // continuous assignment from internal register to actual signals
    reg [3:0] floor_button_reg;
    reg [2:0] elevator_floor_button_reg;

   // Declare state names
    parameter [3:0] Floor_1_IDLE_UP = 4'd0;
    parameter [3:0] Floor_1 = 4'd1;
    parameter [3:0] Floor_1_IDLE_DOWN = 4'd2;
    parameter [3:0] Floor_2_IDLE_UP = 4'd3;
    parameter [3:0] Floor_2_IDLE_DOWN = 4'd4;
    parameter [3:0] Floor_2_UP = 4'd5;
    parameter [3:0] Floor_2_DOWN = 4'd6;
    parameter [3:0] Floor_3_IDLE_UP = 4'd7;
    parameter [3:0] Floor_3_IDLE_DOWN = 4'd8;
    parameter [3:0] Floor_3 = 4'd9;

   //sequential variables
    reg [3:0] state_current;

   //combinational variables
    reg [3:0] state_next;

   
    // clock in registers, asynch active-low reset    
    always @(posedge clk or negedge rst_n)
    begin
        if (rst_n == 1'b0) begin
	   state_current <= Floor_1_IDLE_UP;
        end else begin
           state_current <= state_next; 
        end   
    end

     
   // Next State Combinational Logic 
     always @(*)
      begin
	 // default value, button holds previous output
	 state_next = state_current;

   case(state_current)
      Floor_1_IDLE_UP: begin
         if (floor_button[3] == 1) begin
            state_next = Floor_1;
	end
         else if (elevator_floor_button[1] == 1 || elevator_floor_button[0] == 1 || floor_button[0] == 1 || floor_button[1] == 1) begin
            state_next = Floor_2_IDLE_UP;
	end
         else if (floor_button == 4'b0100) begin
            state_next = Floor_2_IDLE_DOWN;
	end
      end
      Floor_1: begin
         if (floor_button == 4'b0000 && elevator_floor_button == 3'b000)
            state_next = Floor_1_IDLE_UP;
      end
      Floor_1_IDLE_DOWN: begin
         if (elevator_floor_button == 3'b100) begin
            state_next = Floor_1;
         end
         else if (floor_button == 4'b1000) begin
            state_next = Floor_1;
         end
      end
      Floor_2_IDLE_UP: begin
         if (elevator_floor_button == 3'b010 || elevator_floor_button == 3'b011) begin
            state_next = Floor_2_UP;
         end
         else if (floor_button == 4'b0010 || floor_button == 4'b0011) begin
            state_next = Floor_2_UP;
         end
         else if (floor_button == 4'b1000 || floor_button == 4'b1100 || floor_button == 4'b0100) begin
            state_next = Floor_2_IDLE_DOWN;
         end
         else if (floor_button == 4'b0001 || elevator_floor_button == 3'b001) begin
            state_next = Floor_3_IDLE_UP;
         end
      end
      Floor_2_UP: begin
         if (elevator_floor_button == 3'b001 || floor_button == 4'b0001 || floor_button == 4'b0010 || floor_button == 4'b0011 || elevator_floor_button == 3'b000)
            state_next = Floor_3_IDLE_UP;
      end
      Floor_2_IDLE_DOWN: begin
         if (elevator_floor_button == 3'b100 || floor_button == 4'b1000) begin
            state_next = Floor_1_IDLE_DOWN;
	end
         else if (elevator_floor_button == 3'b010 || elevator_floor_button == 3'b110 || floor_button == 4'b0100 || floor_button == 4'b1100) begin
            state_next = Floor_2_DOWN;
	end
         else if (floor_button == 4'b0010 || floor_button == 4'b0011 || floor_button == 4'b0001) begin
            state_next = Floor_2_IDLE_UP;
	end
      end
      Floor_2_DOWN: begin
         if (elevator_floor_button == 3'b100 || floor_button == 4'b0100)
            state_next = Floor_2_IDLE_DOWN;
      end
      Floor_3_IDLE_UP: begin
         if (elevator_floor_button == 3'b001 || floor_button == 4'b0001)
            state_next = Floor_3;
      end
      Floor_3: begin
         if (elevator_floor_button == 3'b000 || elevator_floor_button == 3'b100 || elevator_floor_button == 3'b010 || elevator_floor_button == 3'b110)
            state_next = Floor_3_IDLE_DOWN;
      end

      Floor_3_IDLE_DOWN: begin
         if (elevator_floor_button == 3'b100 || elevator_floor_button == 3'b010 || elevator_floor_button == 3'b110 || floor_button == 4'b1000 || floor_button == 4'b0100 || floor_button == 4'b1100) begin
            state_next = Floor_2_IDLE_DOWN;
	end
         else if (floor_button == 4'b0010) begin
            state_next = Floor_2_IDLE_UP;
      	end
	end
	
	default: begin
	state_next = Floor_1_IDLE_UP;
	end
	endcase 
     end


   // Output Logic Combinational Logic 
    always @(*)
      begin

	//default Output value
    	door = 1'b0;
	   floor = 3'b100;
      elevator_floor_button_clear_internal = 3'b000;
      floor_button_clear_internal = 4'b0000;

	// Register current states of floor buttons
    floor_button_reg = floor_button;
    elevator_floor_button_reg = elevator_floor_button;

    case(state_current)
        Floor_1: begin
            door = 1'b1;
            floor = 3'b100;
            elevator_floor_button_clear_internal = 3'b100;
            floor_button_clear_internal = 4'b1000;
        end
	Floor_1_IDLE_UP: begin
            door = 1'b0;
            floor = 3'b100;
            elevator_floor_button_clear_internal = 3'b000;
            floor_button_clear_internal = 4'b0000;
        end
	Floor_1_IDLE_DOWN: begin
            door = 1'b0;
            floor = 3'b100;
            elevator_floor_button_clear_internal = 3'b000;
            floor_button_clear_internal = 4'b0000;
        end
        Floor_2_UP: begin
            door = 1'b1;
            floor = 3'b010;
            elevator_floor_button_clear_internal[1] = 1; // Clear elevator button for floor 2
            floor_button_clear_internal[1] = 1; // Clear floor 2 up button
        end
        Floor_2_IDLE_UP: begin
            door = 1'b0;
            floor = 3'b010; // Indicate the elevator is at floor 2
            elevator_floor_button_clear_internal = 3'b000; // Do not clear yet
            floor_button_clear_internal = 4'b0000; // Do not clear yet
        end
	Floor_2_DOWN: begin
            door = 1'b1;
            floor = 3'b010;
            elevator_floor_button_clear_internal[1] = 1; // Clear elevator button for floor 2
            floor_button_clear_internal[2] = 1; // Clear floor 2 down button
        end
	Floor_2_IDLE_DOWN: begin
            door = 1'b0;
            floor = 3'b010;
            elevator_floor_button_clear_internal = 3'b000;
            floor_button_clear_internal = 4'b0000;
        end
        Floor_3: begin
            door = 1'b1;
            floor = 3'b001;
            elevator_floor_button_clear_internal[0] = 1; // Clear elevator button for floor 3
            floor_button_clear_internal[0] = 1; // Clear floor 3 down button
        end
	Floor_3_IDLE_UP: begin
            door = 1'b0;
            floor = 3'b001;
            elevator_floor_button_clear_internal = 3'b000;
            floor_button_clear_internal = 4'b0000;
        end
	Floor_3_IDLE_DOWN: begin
            door = 1'b0;
            floor = 3'b001;
            elevator_floor_button_clear_internal = 3'b000;
            floor_button_clear_internal = 4'b0000;
        end
        default: begin
            door = 1'b0;
            floor = 3'b100; // Default to floor 1 IDLE UP
            elevator_floor_button_clear_internal = 3'b000;
            floor_button_clear_internal = 4'b0000;
        end
    endcase 

    // Floor button clear logic
    if (floor_button_clear_internal != 4'b0000) begin
        floor_button_reg = floor_button & ~floor_button_clear_internal; // Clear the specific floor button based on the output
    end
	else begin
	floor_button_reg = floor_button;
	end

    // Elevator button clear logic
    if (elevator_floor_button_clear_internal != 3'b000) begin
        elevator_floor_button_reg = elevator_floor_button & ~elevator_floor_button_clear_internal; // Clear the specific elevator button
    end
	else begin
	elevator_floor_button_reg = elevator_floor_button;
	end 
end

endmodule

