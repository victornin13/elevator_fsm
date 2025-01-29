/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue Nov 12 14:13:59 2024
/////////////////////////////////////////////////////////////


module program_counter_v1_DW01_add_0 ( A, B, CI, SUM, CO );
  input [5:0] A;
  input [5:0] B;
  output [5:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [5:1] carry;

  ADDF_B U1_4 ( .A(A[4]), .B(B[4]), .CIN(carry[4]), .COUT(carry[5]), .SUM(
        SUM[4]) );
  ADDF_B U1_2 ( .A(A[2]), .B(B[2]), .CIN(carry[2]), .COUT(carry[3]), .SUM(
        SUM[2]) );
  ADDF_B U1_3 ( .A(A[3]), .B(B[3]), .CIN(carry[3]), .COUT(carry[4]), .SUM(
        SUM[3]) );
  ADDF_B U1_1 ( .A(A[1]), .B(B[1]), .CIN(n1), .COUT(carry[2]), .SUM(SUM[1]) );
  XOR3_D U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .Z(SUM[5]) );
  INVERT_D U1 ( .A(n2), .Z(n1) );
  BUFFER_F U2 ( .A(carry[1]), .Z(n2) );
  NAND2_D U3 ( .A(A[0]), .B(B[0]), .Z(carry[1]) );
  XOR2_C U4 ( .A(A[0]), .B(B[0]), .Z(SUM[0]) );
endmodule


module program_counter_v1 ( clk, rst_n, update_msbs, update_lsbs, jump, 
        jump_destination, branch, branch_offset, mem_addr );
  input [5:0] jump_destination;
  input [5:0] branch_offset;
  output [7:0] mem_addr;
  input clk, rst_n, update_msbs, update_lsbs, jump, branch;
  wire   n131, n132, n133, n134, N6, N7, N8, N9, N10, N15, N16, N17, N18, N19,
         N20, n7, n9, n12, n14, n16, n17, n19, n20, n21, n22, n23, n24, n25,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n81, n82, n83,
         n85, n86, n87, n88, n89, n91, n92, n93, n94, n96, n97, n98, n99, n101,
         n102, n103, n104, n106, n107, n108, n109, n110, n112, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130;
  wire   [5:0] jump_destination_q;
  wire   [5:0] branch_offset_q;

  program_counter_v1_DW01_add_0 add_75 ( .A({n79, n35, n94, n89, n106, n99}), 
        .B(branch_offset_q), .CI(1'b0), .SUM({N20, N19, N18, N17, N16, N15})
         );
  DFFR_E \jump_destination_q_reg[5]  ( .D(jump_destination[5]), .CLK(clk), 
        .RN(n116), .Q(jump_destination_q[5]) );
  DFFR_E \jump_destination_q_reg[4]  ( .D(jump_destination[4]), .CLK(clk), 
        .RN(n116), .Q(jump_destination_q[4]) );
  DFFR_E \jump_destination_q_reg[3]  ( .D(jump_destination[3]), .CLK(clk), 
        .RN(n116), .Q(jump_destination_q[3]) );
  DFFR_E \jump_destination_q_reg[2]  ( .D(jump_destination[2]), .CLK(clk), 
        .RN(n116), .Q(jump_destination_q[2]) );
  DFFR_E \jump_destination_q_reg[1]  ( .D(jump_destination[1]), .CLK(clk), 
        .RN(n116), .QBAR(n39) );
  DFFR_E \jump_destination_q_reg[0]  ( .D(jump_destination[0]), .CLK(clk), 
        .RN(n117), .Q(jump_destination_q[0]) );
  DFFR_E \branch_offset_q_reg[5]  ( .D(branch_offset[5]), .CLK(clk), .RN(n114), 
        .Q(branch_offset_q[5]) );
  DFFR_E \branch_offset_q_reg[4]  ( .D(branch_offset[4]), .CLK(clk), .RN(n114), 
        .Q(branch_offset_q[4]) );
  DFFR_E \branch_offset_q_reg[3]  ( .D(branch_offset[3]), .CLK(clk), .RN(n114), 
        .Q(branch_offset_q[3]) );
  DFFR_E branch_q_reg ( .D(branch), .CLK(clk), .RN(n114), .QBAR(n19) );
  DFFR_E \branch_offset_q_reg[2]  ( .D(branch_offset[2]), .CLK(clk), .RN(n114), 
        .Q(branch_offset_q[2]) );
  DFFR_E \branch_offset_q_reg[1]  ( .D(branch_offset[1]), .CLK(clk), .RN(n115), 
        .Q(branch_offset_q[1]) );
  DFFR_E \branch_offset_q_reg[0]  ( .D(branch_offset[0]), .CLK(clk), .RN(n115), 
        .Q(branch_offset_q[0]) );
  DFFR_E \mem_addr_reg[0]  ( .D(n42), .CLK(clk), .RN(n117), .Q(n134), .QBAR(
        n22) );
  DFFR_E \mem_addr_reg[1]  ( .D(n29), .CLK(clk), .RN(n117), .Q(n133), .QBAR(
        n17) );
  DFFR_E update_lsbs_q_reg ( .D(update_lsbs), .CLK(clk), .RN(n115), .Q(n21), 
        .QBAR(n108) );
  DFFR_E \mem_addr_reg[2]  ( .D(n28), .CLK(clk), .RN(n117), .Q(n132), .QBAR(
        n109) );
  DFFR_E \mem_addr_reg[3]  ( .D(n34), .CLK(clk), .RN(n116), .Q(n131), .QBAR(
        n36) );
  DFFR_E \mem_addr_reg[5]  ( .D(n24), .CLK(clk), .RN(n117), .QBAR(n96) );
  DFFR_E \mem_addr_reg[4]  ( .D(n25), .CLK(clk), .RN(n114), .QBAR(n91) );
  DFFR_E \mem_addr_reg[6]  ( .D(n23), .CLK(clk), .RN(n115), .Q(n35), .QBAR(n86) );
  DFFR_E \mem_addr_reg[7]  ( .D(n27), .CLK(clk), .RN(n117), .Q(n38), .QBAR(n81) );
  DFFR_E update_msbs_q_reg ( .D(update_msbs), .CLK(clk), .RN(n115), .Q(n20), 
        .QBAR(n40) );
  DFFR_E jump_q_reg ( .D(jump), .CLK(clk), .RN(n115), .Q(n37) );
  INVERT_I U26 ( .A(n37), .Z(n66) );
  INVERT_I U27 ( .A(n121), .Z(n120) );
  INVERT_J U28 ( .A(n88), .Z(n89) );
  AO21_F U29 ( .A1(n70), .A2(n64), .B(n127), .Z(n31) );
  NOR2_D U30 ( .A(n45), .B(n66), .Z(n32) );
  INVERT_H U31 ( .A(n7), .Z(n45) );
  AND2_I U32 ( .A(n46), .B(n66), .Z(n33) );
  OR2_H U33 ( .A(n55), .B(n56), .Z(n34) );
  INVERT_K U34 ( .A(n87), .Z(n83) );
  XNOR2_C U35 ( .A(n89), .B(n41), .Z(N7) );
  INVERT_L U36 ( .A(n77), .Z(n59) );
  INVERT_J U37 ( .A(n120), .Z(n118) );
  AO2222_F U38 ( .A1(n76), .A2(n101), .B1(N15), .B2(n74), .C1(n72), .C2(
        jump_destination_q[0]), .D1(n109), .D2(n59), .Z(n28) );
  AND2_H U39 ( .A(n106), .B(n101), .Z(n122) );
  INVERT_D U40 ( .A(n122), .Z(n41) );
  XOR2_B U41 ( .A(n106), .B(n109), .Z(N6) );
  INVERT_H U42 ( .A(n60), .Z(n61) );
  OA21_F U43 ( .A1(n61), .A2(n68), .B(n16), .Z(n30) );
  INVERT_C U44 ( .A(n30), .Z(n42) );
  INVERT_E U45 ( .A(n62), .Z(n60) );
  INVERT_I U46 ( .A(n83), .Z(n85) );
  INVERT_H U47 ( .A(n108), .Z(n43) );
  INVERT_H U48 ( .A(n43), .Z(n44) );
  AO33_H U49 ( .A1(n130), .A2(n12), .A3(n70), .B1(n127), .B2(n68), .B3(n17), 
        .Z(n29) );
  AO22_F U50 ( .A1(n21), .A2(n22), .B1(n44), .B2(n65), .Z(n12) );
  INVERT_J U51 ( .A(n93), .Z(n94) );
  INVERT_H U52 ( .A(n45), .Z(n46) );
  NOR2_D U53 ( .A(n76), .B(n59), .Z(n7) );
  AO2222_F U54 ( .A1(n76), .A2(n38), .B1(N20), .B2(n74), .C1(n72), .C2(
        jump_destination_q[5]), .D1(n59), .D2(N10), .Z(n27) );
  AO2222_F U55 ( .A1(n76), .A2(n94), .B1(N18), .B2(n74), .C1(n72), .C2(
        jump_destination_q[3]), .D1(N8), .D2(n59), .Z(n24) );
  AO2222_F U56 ( .A1(n76), .A2(n89), .B1(N17), .B2(n74), .C1(n72), .C2(
        jump_destination_q[2]), .D1(N7), .D2(n59), .Z(n25) );
  INVERT_H U57 ( .A(n72), .Z(n47) );
  INVERT_H U58 ( .A(n74), .Z(n48) );
  INVERT_H U59 ( .A(N16), .Z(n49) );
  INVERT_E U60 ( .A(n76), .Z(n50) );
  NOR2_C U61 ( .A(n40), .B(N6), .Z(n51) );
  NOR2_C U62 ( .A(n39), .B(n47), .Z(n52) );
  NOR2_C U63 ( .A(n48), .B(n49), .Z(n53) );
  NOR2_C U64 ( .A(n36), .B(n50), .Z(n54) );
  NOR2_C U65 ( .A(n51), .B(n52), .Z(n57) );
  INVERT_E U66 ( .A(n57), .Z(n55) );
  NOR2_C U67 ( .A(n53), .B(n54), .Z(n58) );
  INVERT_E U68 ( .A(n58), .Z(n56) );
  INVERT_L U69 ( .A(n75), .Z(n76) );
  NAND4_C U70 ( .A(n65), .B(n68), .C(n44), .D(n70), .Z(n16) );
  AO2222_F U71 ( .A1(n76), .A2(n85), .B1(N19), .B2(n74), .C1(n72), .C2(
        jump_destination_q[4]), .D1(N9), .D2(n59), .Z(n23) );
  XOR2_B U72 ( .A(n85), .B(n124), .Z(N9) );
  XOR2_B U73 ( .A(n79), .B(n125), .Z(N10) );
  AND2_H U74 ( .A(n124), .B(n85), .Z(n125) );
  INVERT_I U75 ( .A(n98), .Z(n101) );
  INVERT_E U76 ( .A(n94), .Z(n126) );
  AND2_H U77 ( .A(n21), .B(n70), .Z(n14) );
  INVERT_D U78 ( .A(n14), .Z(n62) );
  XNOR2_C U79 ( .A(n123), .B(n94), .Z(N8) );
  NOR2_E U80 ( .A(n126), .B(n123), .Z(n124) );
  NAND3_E U81 ( .A(n104), .B(n101), .C(n89), .Z(n123) );
  INVERT_H U82 ( .A(n9), .Z(n63) );
  INVERT_D U83 ( .A(n63), .Z(n64) );
  INVERT_F U84 ( .A(n63), .Z(n65) );
  INVERT_H U85 ( .A(n129), .Z(n67) );
  INVERT_I U86 ( .A(n67), .Z(n68) );
  INVERT_F U87 ( .A(n128), .Z(n69) );
  INVERT_I U88 ( .A(n69), .Z(n70) );
  INVERT_H U89 ( .A(n32), .Z(n71) );
  INVERT_K U90 ( .A(n71), .Z(n72) );
  INVERT_H U91 ( .A(n33), .Z(n73) );
  INVERT_K U92 ( .A(n73), .Z(n74) );
  INVERT_H U93 ( .A(n31), .Z(n75) );
  INVERT_H U94 ( .A(n20), .Z(n77) );
  INVERT_K U95 ( .A(n82), .Z(n78) );
  INVERT_F U96 ( .A(n78), .Z(n79) );
  INVERT_O U97 ( .A(n78), .Z(mem_addr[7]) );
  INVERT_H U98 ( .A(n81), .Z(n82) );
  INVERT_O U99 ( .A(n83), .Z(mem_addr[6]) );
  INVERT_H U100 ( .A(n86), .Z(n87) );
  INVERT_K U101 ( .A(n92), .Z(n88) );
  INVERT_O U102 ( .A(n88), .Z(mem_addr[4]) );
  INVERT_H U103 ( .A(n91), .Z(n92) );
  INVERT_K U104 ( .A(n97), .Z(n93) );
  INVERT_O U105 ( .A(n93), .Z(mem_addr[5]) );
  INVERT_H U106 ( .A(n96), .Z(n97) );
  INVERT_L U107 ( .A(n102), .Z(n98) );
  INVERT_F U108 ( .A(n98), .Z(n99) );
  INVERT_O U109 ( .A(n98), .Z(mem_addr[2]) );
  BUFFER_J U110 ( .A(n132), .Z(n102) );
  INVERT_L U111 ( .A(n107), .Z(n103) );
  INVERT_F U112 ( .A(n103), .Z(n104) );
  INVERT_O U113 ( .A(n103), .Z(mem_addr[3]) );
  INVERT_I U114 ( .A(n103), .Z(n106) );
  BUFFER_J U115 ( .A(n131), .Z(n107) );
  AND2_I U116 ( .A(n66), .B(n19), .Z(n9) );
  INVERT_J U117 ( .A(n133), .Z(n110) );
  INVERT_O U118 ( .A(n110), .Z(mem_addr[1]) );
  INVERT_J U119 ( .A(n134), .Z(n112) );
  INVERT_O U120 ( .A(n112), .Z(mem_addr[0]) );
  INVERT_F U121 ( .A(n61), .Z(n127) );
  INVERT_E U122 ( .A(n59), .Z(n128) );
  INVERT_E U123 ( .A(n22), .Z(n129) );
  INVERT_J U124 ( .A(n120), .Z(n119) );
  INVERT_H U125 ( .A(rst_n), .Z(n121) );
  INVERT_K U126 ( .A(n118), .Z(n117) );
  INVERT_K U127 ( .A(n118), .Z(n116) );
  INVERT_K U128 ( .A(n119), .Z(n115) );
  INVERT_K U129 ( .A(n119), .Z(n114) );
  INVERT_D U130 ( .A(n17), .Z(n130) );
endmodule

