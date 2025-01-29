`timescale 1ns / 1ps

// ECE 6213
// Victor Nin
// Elevator Controller FSM
// Project 3

module elevator_controller (
    input wire clk,
    input wire rst_n,
    
    // Inputs from buttons
    input wire [2:0] elevator_floor_button_pressed, // Buttons for each elevator floor
    input wire [3:0] floor_button_pressed,          // Floor call buttons (up/down)

    // Outputs
    output wire [2:0] floor,              // Indicates current floor of the elevator
    output wire door,                     // Door control signal
    output wire [2:0] elevator_button_out, // Elevator button status (which buttons are lit)
    output wire [3:0] floor_button_out    // Floor button status (which buttons are lit)
);

    // Internal signals for clearing buttons
    wire [2:0] elevator_floor_button_clear;
    wire [3:0] floor_button_clear;

    // Instantiating elevator_button for elevator buttons
    elevator_button u_elevator_button_1 (
        .clk(clk),
        .rst_n(rst_n),
        .button_pressed(elevator_floor_button_pressed[2]), // Button for elevator floor 1
        .clear(elevator_floor_button_clear[2]),            // Clear signal for floor 1 button
        .button_out(elevator_button_out[2])                // Status of elevator floor 1 button
    );

    elevator_button u_elevator_button_2 (
        .clk(clk),
        .rst_n(rst_n),
        .button_pressed(elevator_floor_button_pressed[1]), // Button for elevator floor 2
        .clear(elevator_floor_button_clear[1]),            // Clear signal for floor 2 button
        .button_out(elevator_button_out[1])                // Status of elevator floor 2 button
    );

    elevator_button u_elevator_button_3 (
        .clk(clk),
        .rst_n(rst_n),
        .button_pressed(elevator_floor_button_pressed[0]), // Button for elevator floor 3
        .clear(elevator_floor_button_clear[0]),            // Clear signal for floor 3 button
        .button_out(elevator_button_out[0])                // Status of elevator floor 3 button
    );

    // Instantiating elevator_button for floor up/down buttons
    elevator_button u_floor_button_1_up (
        .clk(clk),
        .rst_n(rst_n),
        .button_pressed(floor_button_pressed[3]), // Button for floor 1 up
        .clear(floor_button_clear[3]),            // Clear signal for floor 1 up button
        .button_out(floor_button_out[3])          // Status of floor 1 up button
    );

    elevator_button u_floor_button_2_down (
        .clk(clk),
        .rst_n(rst_n),
        .button_pressed(floor_button_pressed[2]), // Button for floor 2 down
        .clear(floor_button_clear[2]),            // Clear signal for floor 2 down button
        .button_out(floor_button_out[2])          // Status of floor 2 down button
    );

    elevator_button u_floor_button_2_up (
        .clk(clk),
        .rst_n(rst_n),
        .button_pressed(floor_button_pressed[1]), // Button for floor 2 up
        .clear(floor_button_clear[1]),            // Clear signal for floor 2 up button
        .button_out(floor_button_out[1])          // Status of floor 2 up button
    );

    elevator_button u_floor_button_3_down (
        .clk(clk),
        .rst_n(rst_n),
        .button_pressed(floor_button_pressed[0]), // Button for floor 3 down
        .clear(floor_button_clear[0]),            // Clear signal for floor 3 down button
        .button_out(floor_button_out[0])          // Status of floor 3 down button
    );

    // Instantiating the elevator FSM module
    elevator the_elevator (
        .clk(clk),
        .rst_n(rst_n),
        .elevator_floor_button(elevator_button_out),  // Pass elevator button outputs to FSM
        .floor_button(floor_button_out),              // Pass floor button outputs to FSM
        .floor(floor),                                // Current floor output
        .door(door),                                  // Door control output
        .floor_button_clear_internal(floor_button_clear),      // Clear signals for floor buttons
        .elevator_floor_button_clear_internal(elevator_floor_button_clear) // Clear signals for elevator buttons
    );

endmodule
