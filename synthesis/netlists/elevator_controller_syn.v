/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Nov 14 18:49:34 2024
/////////////////////////////////////////////////////////////


module elevator_button_6 ( clk, rst_n, button_pressed, clear, button_out );
  input clk, rst_n, button_pressed, clear;
  output button_out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire unused_qbar; // Declare an unused signal
  tri   clk;
  tri   clear;
  tri   button_out;

  DFFR_K button_out_reg ( .D(n2), .CLK(clk), .RN(rst_n), .Q(button_out), .QBAR(unused_qbar) );
  INVERT_D U3 ( .A(n7), .Z(n5) );
  BUFFER_D U4 ( .A(button_out), .Z(n4) );
  DELAY4_J U5 ( .A(n4), .Z(n3) );
  DELAY4_F U6 ( .A(n3), .Z(n8) );
  INVERT_E U7 ( .A(n5), .Z(n6) );
  BUFFER_F U8 ( .A(n8), .Z(n7) );
  NOR2_C U9 ( .A(button_pressed), .B(n6), .Z(n1) );
  NOR2_C U10 ( .A(clear), .B(n1), .Z(n2) );
endmodule


module elevator_button_0 ( clk, rst_n, button_pressed, clear, button_out );
  input clk, rst_n, button_pressed, clear;
  output button_out;
  wire   n3, n4, n5, n6, n7, n8, n9, n10;
  wire unused_qbar; // Declare an unused signal
  tri   clk;
  tri   clear;
  tri   button_out;

  DFFR_K button_out_reg ( .D(n9), .CLK(clk), .RN(rst_n), .Q(button_out), .QBAR(unused_qbar) );
  INVERT_D U3 ( .A(n7), .Z(n5) );
  BUFFER_D U4 ( .A(button_out), .Z(n4) );
  DELAY4_J U5 ( .A(n4), .Z(n3) );
  DELAY4_F U6 ( .A(n3), .Z(n8) );
  INVERT_E U7 ( .A(n5), .Z(n6) );
  BUFFER_F U8 ( .A(n8), .Z(n7) );
  NOR2_C U9 ( .A(button_pressed), .B(n6), .Z(n10) );
  NOR2_C U10 ( .A(clear), .B(n10), .Z(n9) );
endmodule


module elevator_button_1 ( clk, rst_n, button_pressed, clear, button_out );
  input clk, rst_n, button_pressed, clear;
  output button_out;
  wire   n3, n4, n5, n6, n7, n8, n9, n10;
  wire unused_qbar; // Declare an unused signal
  tri   clk;
  tri   clear;
  tri   button_out;

  DFFR_K button_out_reg ( .D(n9), .CLK(clk), .RN(rst_n), .Q(button_out), .QBAR(unused_qbar)  );
  INVERT_D U3 ( .A(n7), .Z(n5) );
  BUFFER_D U4 ( .A(button_out), .Z(n4) );
  DELAY4_J U5 ( .A(n4), .Z(n3) );
  DELAY4_F U6 ( .A(n3), .Z(n8) );
  INVERT_E U7 ( .A(n5), .Z(n6) );
  BUFFER_F U8 ( .A(n8), .Z(n7) );
  NOR2_C U9 ( .A(button_pressed), .B(n6), .Z(n10) );
  NOR2_C U10 ( .A(clear), .B(n10), .Z(n9) );
endmodule


module elevator_button_2 ( clk, rst_n, button_pressed, clear, button_out );
  input clk, rst_n, button_pressed, clear;
  output button_out;
  wire   n3, n4, n5, n6, n7, n8, n9, n10;
  wire unused_qbar; // Declare an unused signal
  tri   clk;
  tri   clear;
  tri   button_out;

  DFFR_K button_out_reg ( .D(n9), .CLK(clk), .RN(rst_n), .Q(button_out), .QBAR(unused_qbar) );
  INVERT_D U3 ( .A(n7), .Z(n5) );
  BUFFER_D U4 ( .A(button_out), .Z(n4) );
  DELAY4_J U5 ( .A(n4), .Z(n3) );
  DELAY4_F U6 ( .A(n3), .Z(n8) );
  INVERT_E U7 ( .A(n5), .Z(n6) );
  BUFFER_F U8 ( .A(n8), .Z(n7) );
  NOR2_C U9 ( .A(button_pressed), .B(n6), .Z(n10) );
  NOR2_C U10 ( .A(clear), .B(n10), .Z(n9) );
endmodule


module elevator_button_3 ( clk, rst_n, button_pressed, clear, button_out );
  input clk, rst_n, button_pressed, clear;
  output button_out;
  wire   n3, n4, n5, n6, n7, n8, n9, n10;
  wire unused_qbar; // Declare an unused signal
  tri   clk;
  tri   clear;
  tri   button_out;

  DFFR_K button_out_reg ( .D(n9), .CLK(clk), .RN(rst_n), .Q(button_out), .QBAR(unused_qbar) );
  INVERT_D U3 ( .A(n7), .Z(n5) );
  BUFFER_D U4 ( .A(button_out), .Z(n4) );
  DELAY4_J U5 ( .A(n4), .Z(n3) );
  DELAY4_F U6 ( .A(n3), .Z(n8) );
  INVERT_E U7 ( .A(n5), .Z(n6) );
  BUFFER_F U8 ( .A(n8), .Z(n7) );
  NOR2_C U9 ( .A(button_pressed), .B(n6), .Z(n10) );
  NOR2_C U10 ( .A(clear), .B(n10), .Z(n9) );
endmodule


module elevator_button_4 ( clk, rst_n, button_pressed, clear, button_out );
  input clk, rst_n, button_pressed, clear;
  output button_out;
  wire   n3, n4, n5, n6, n7, n8, n9, n10;
  wire unused_qbar; // Declare an unused signal
  tri   clk;
  tri   clear;
  tri   button_out;

  DFFR_K button_out_reg ( .D(n9), .CLK(clk), .RN(rst_n), .Q(button_out), .QBAR(unused_qbar) );
  INVERT_D U3 ( .A(n7), .Z(n5) );
  BUFFER_D U4 ( .A(button_out), .Z(n4) );
  DELAY4_J U5 ( .A(n4), .Z(n3) );
  DELAY4_F U6 ( .A(n3), .Z(n8) );
  INVERT_E U7 ( .A(n5), .Z(n6) );
  BUFFER_F U8 ( .A(n8), .Z(n7) );
  NOR2_C U9 ( .A(button_pressed), .B(n6), .Z(n10) );
  NOR2_C U10 ( .A(clear), .B(n10), .Z(n9) );
endmodule


module elevator_button_5 ( clk, rst_n, button_pressed, clear, button_out );
  input clk, rst_n, button_pressed, clear;
  output button_out;
  wire   n3, n4, n5, n6, n7, n8, n9, n10;
  wire unused_qbar; // Declare an unused signal
  tri   clk;
  tri   clear;
  tri   button_out;

  DFFR_K button_out_reg ( .D(n9), .CLK(clk), .RN(rst_n), .Q(button_out), .QBAR(unused_qbar) );
  INVERT_D U3 ( .A(n7), .Z(n5) );
  BUFFER_D U4 ( .A(button_out), .Z(n4) );
  DELAY4_J U5 ( .A(n4), .Z(n3) );
  DELAY4_F U6 ( .A(n3), .Z(n8) );
  INVERT_E U7 ( .A(n5), .Z(n6) );
  BUFFER_F U8 ( .A(n8), .Z(n7) );
  NOR2_C U9 ( .A(button_pressed), .B(n6), .Z(n10) );
  NOR2_C U10 ( .A(clear), .B(n10), .Z(n9) );
endmodule


module elevator_controller_syn ( clk, rst_n, elevator_floor_button_pressed, 
        floor_button_pressed, floor, door, elevator_button_out, 
        floor_button_out );
  input [2:0] elevator_floor_button_pressed;
  input [3:0] floor_button_pressed;
  output [2:0] floor;
  output [2:0] elevator_button_out;
  output [3:0] floor_button_out;
  input clk, rst_n;
  output door;
  wire   n1, n2, n3;
  tri   clk;
  tri   rst_n;
  tri   [2:0] floor;
  tri   door;
  tri   [2:0] elevator_button_out;
  tri   [3:0] floor_button_out;
  tri   [2:0] elevator_floor_button_clear;
  tri   [3:0] floor_button_clear;

  elevator_button_6 u_elevator_button_1 ( .clk(clk), .rst_n(n3), 
        .button_pressed(elevator_floor_button_pressed[2]), .clear(
        elevator_floor_button_clear[2]), .button_out(elevator_button_out[2])
         );
  elevator_button_5 u_elevator_button_2 ( .clk(clk), .rst_n(n2), 
        .button_pressed(elevator_floor_button_pressed[1]), .clear(
        elevator_floor_button_clear[1]), .button_out(elevator_button_out[1])
         );
  elevator_button_4 u_elevator_button_3 ( .clk(clk), .rst_n(n2), 
        .button_pressed(elevator_floor_button_pressed[0]), .clear(
        elevator_floor_button_clear[0]), .button_out(elevator_button_out[0])
         );
  elevator_button_3 u_floor_button_1_up ( .clk(clk), .rst_n(n2), 
        .button_pressed(floor_button_pressed[3]), .clear(floor_button_clear[3]), .button_out(floor_button_out[3]) );
  elevator_button_2 u_floor_button_2_down ( .clk(clk), .rst_n(n3), 
        .button_pressed(floor_button_pressed[2]), .clear(floor_button_clear[2]), .button_out(floor_button_out[2]) );
  elevator_button_1 u_floor_button_2_up ( .clk(clk), .rst_n(n3), 
        .button_pressed(floor_button_pressed[1]), .clear(floor_button_clear[1]), .button_out(floor_button_out[1]) );
  elevator_button_0 u_floor_button_3_down ( .clk(clk), .rst_n(n3), 
        .button_pressed(floor_button_pressed[0]), .clear(floor_button_clear[0]), .button_out(floor_button_out[0]) );
  elevator the_elevator ( .clk(clk), .rst_n(rst_n), .elevator_floor_button(
        elevator_button_out), .floor_button(floor_button_out), .floor(floor), 
        .door(door), .floor_button_clear_internal(floor_button_clear), 
        .elevator_floor_button_clear_internal(elevator_floor_button_clear) );
  INVERT_I U1 ( .A(rst_n), .Z(n1) );
  INVERT_I U2 ( .A(n1), .Z(n2) );
  INVERT_J U3 ( .A(n1), .Z(n3) );
endmodule

