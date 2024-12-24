/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sat Nov 30 19:41:05 2024
/////////////////////////////////////////////////////////////


module taillight_controller ( clk, rst_n, turn_right, turn_left, brake, 
        right_taillight_control, left_taillight_control );
  output [2:0] right_taillight_control;
  output [2:0] left_taillight_control;
  input clk, rst_n, turn_right, turn_left, brake;
  wire   \state_right[0] , n1, n2, n5, n7, n8, n9, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n51,
         n53, n54, n55, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215;
  wire   [3:0] count_left;
  wire   [3:0] count_right;
  wire   [1:0] state_left;
  wire   [2:0] left_taillight_control_next;
  wire   [2:0] right_taillight_control_next;
  wire   [2:0] count_next_left;
  wire   [2:0] count_next_right;
  wire   [1:0] state_next_left;
  wire   [1:0] state_next_right;

  NAND3_D U11 ( .A(n23), .B(n19), .C(n104), .Z(n32) );
  NOR2_D U28 ( .A(n114), .B(n118), .Z(n28) );
  NOR2_D U38 ( .A(n188), .B(n204), .Z(n42) );
  XNOR2_C U52 ( .A(n186), .B(n168), .Z(n33) );
  INVERT_D U84 ( .A(n58), .Z(n1) );
  INVERT_D U85 ( .A(n39), .Z(n2) );
  INVERT_D U88 ( .A(n51), .Z(n5) );
  INVERT_D U99 ( .A(n177), .Z(n18) );
  DFFR_E \left_taillight_control_reg[1]  ( .D(left_taillight_control_next[1]), 
        .CLK(clk), .RN(n109), .Q(left_taillight_control[1]) );
  DFFR_E \right_taillight_control_reg[1]  ( .D(right_taillight_control_next[1]), .CLK(clk), .RN(n110), .Q(right_taillight_control[1]) );
  DFFR_E \left_taillight_control_reg[2]  ( .D(left_taillight_control_next[2]), 
        .CLK(clk), .RN(n111), .Q(left_taillight_control[2]) );
  DFFR_E \left_taillight_control_reg[0]  ( .D(left_taillight_control_next[0]), 
        .CLK(clk), .RN(n109), .Q(left_taillight_control[0]) );
  DFFR_E \right_taillight_control_reg[2]  ( .D(right_taillight_control_next[2]), .CLK(clk), .RN(n110), .Q(right_taillight_control[2]) );
  DFFR_E \right_taillight_control_reg[0]  ( .D(right_taillight_control_next[0]), .CLK(clk), .RN(n111), .Q(right_taillight_control[0]) );
  DFFR_E \state_right_reg[0]  ( .D(state_next_right[0]), .CLK(clk), .RN(n109), 
        .Q(\state_right[0] ), .QBAR(n89) );
  DFFR_E \count_right_reg[2]  ( .D(count_next_right[2]), .CLK(clk), .RN(n110), 
        .Q(count_right[2]), .QBAR(n214) );
  DFFR_E \count_left_reg[2]  ( .D(count_next_left[2]), .CLK(clk), .RN(n111), 
        .Q(count_left[2]), .QBAR(n212) );
  DFFR_E \count_left_reg[1]  ( .D(count_next_left[1]), .CLK(clk), .RN(n109), 
        .Q(count_left[1]), .QBAR(n211) );
  DFFR_E \state_right_reg[1]  ( .D(state_next_right[1]), .CLK(clk), .RN(n110), 
        .QBAR(n93) );
  DFFR_E \count_left_reg[0]  ( .D(count_next_left[0]), .CLK(clk), .RN(n111), 
        .QBAR(n90) );
  DFFR_E \state_left_reg[0]  ( .D(state_next_left[0]), .CLK(clk), .RN(n108), 
        .Q(state_left[0]), .QBAR(n205) );
  DFFR_E \count_right_reg[0]  ( .D(count_next_right[0]), .CLK(clk), .RN(n108), 
        .Q(count_right[0]), .QBAR(n207) );
  DFFR_E \state_left_reg[1]  ( .D(state_next_left[1]), .CLK(clk), .RN(n108), 
        .Q(state_left[1]), .QBAR(n206) );
  DFFR_E \count_right_reg[1]  ( .D(count_next_right[1]), .CLK(clk), .RN(n108), 
        .Q(count_right[1]), .QBAR(n210) );
  INVERT_I U106 ( .A(n80), .Z(n197) );
  INVERT_E U107 ( .A(n45), .Z(n161) );
  INVERT_E U108 ( .A(n66), .Z(n191) );
  INVERT_I U109 ( .A(\state_right[0] ), .Z(n7) );
  INVERT_H U110 ( .A(n112), .Z(n117) );
  INVERT_J U111 ( .A(n107), .Z(n109) );
  AOI21_B U112 ( .A1(n53), .A2(n118), .B(n105), .Z(n88) );
  XNOR2_C U113 ( .A(n215), .B(n129), .Z(n68) );
  AOI21_B U114 ( .A1(n199), .A2(n51), .B(n54), .Z(n91) );
  INVERT_H U115 ( .A(n76), .Z(n21) );
  AO21_F U116 ( .A1(n199), .A2(n172), .B(n54), .Z(n92) );
  INVERT_E U117 ( .A(n162), .Z(n163) );
  INVERT_I U118 ( .A(n98), .Z(n101) );
  NAND2_I U119 ( .A(n101), .B(n23), .Z(n34) );
  NAND2BAL_E U120 ( .A(n209), .B(n118), .Z(n51) );
  INVERT_J U121 ( .A(turn_left), .Z(n94) );
  INVERT_I U122 ( .A(n94), .Z(n95) );
  INVERT_H U123 ( .A(n94), .Z(n96) );
  INVERT_I U124 ( .A(n94), .Z(n97) );
  INVERT_K U125 ( .A(turn_right), .Z(n98) );
  INVERT_H U126 ( .A(n98), .Z(n99) );
  INVERT_I U127 ( .A(n98), .Z(n100) );
  INVERT_L U128 ( .A(brake), .Z(n102) );
  INVERT_I U129 ( .A(n102), .Z(n103) );
  INVERT_J U130 ( .A(n102), .Z(n104) );
  INVERT_I U131 ( .A(n102), .Z(n105) );
  INVERT_I U132 ( .A(n102), .Z(n106) );
  INVERT_M U133 ( .A(rst_n), .Z(n107) );
  INVERT_J U134 ( .A(n107), .Z(n108) );
  INVERT_J U135 ( .A(n107), .Z(n110) );
  INVERT_J U136 ( .A(n107), .Z(n111) );
  INVERT_H U137 ( .A(n92), .Z(n112) );
  INVERT_H U138 ( .A(n93), .Z(n113) );
  INVERT_K U139 ( .A(n113), .Z(n114) );
  INVERT_C U140 ( .A(n115), .Z(right_taillight_control_next[2]) );
  NOR2_C U141 ( .A(n5), .B(n24), .Z(n116) );
  NOR2_C U142 ( .A(n116), .B(n117), .Z(n115) );
  INVERT_J U143 ( .A(n89), .Z(n118) );
  AOI21_B U144 ( .A1(n27), .A2(n118), .B(n172), .Z(n26) );
  OAI22_B U145 ( .A1(n25), .A2(n114), .B1(n174), .B2(n26), .Z(
        state_next_right[1]) );
  INVERT_E U146 ( .A(n91), .Z(n119) );
  INVERT_H U147 ( .A(n119), .Z(n120) );
  OAI21_C U148 ( .A1(n24), .A2(n127), .B(n120), .Z(
        right_taillight_control_next[0]) );
  OAI21_C U149 ( .A1(n24), .A2(n126), .B(n62), .Z(
        left_taillight_control_next[0]) );
  INVERT_C U150 ( .A(n121), .Z(count_next_left[2]) );
  NOR2_C U151 ( .A(n76), .B(n124), .Z(n122) );
  INVERT_D U152 ( .A(n153), .Z(n123) );
  NOR2_C U153 ( .A(n122), .B(n123), .Z(n121) );
  NAND2_F U154 ( .A(n48), .B(n49), .Z(n76) );
  AND2_H U155 ( .A(n160), .B(count_left[2]), .Z(n77) );
  INVERT_D U156 ( .A(n77), .Z(n124) );
  AND2_H U157 ( .A(count_right[1]), .B(n70), .Z(n71) );
  INVERT_D U158 ( .A(n71), .Z(n125) );
  NAND2BAL_E U159 ( .A(n215), .B(n70), .Z(n64) );
  AND2_H U160 ( .A(n205), .B(n188), .Z(n61) );
  INVERT_D U161 ( .A(n61), .Z(n126) );
  AND2_H U162 ( .A(n7), .B(n114), .Z(n55) );
  INVERT_D U163 ( .A(n55), .Z(n127) );
  AND2_H U164 ( .A(count_left[1]), .B(n208), .Z(n82) );
  INVERT_D U165 ( .A(n82), .Z(n128) );
  AND2_H U166 ( .A(n186), .B(count_right[1]), .Z(n69) );
  INVERT_D U167 ( .A(n69), .Z(n129) );
  INVERT_E U168 ( .A(n149), .Z(n130) );
  INVERT_H U169 ( .A(n130), .Z(n131) );
  BUFFER_F U170 ( .A(n81), .Z(n132) );
  OAI21_C U171 ( .A1(n1), .A2(n24), .B(n166), .Z(
        left_taillight_control_next[2]) );
  INVERT_C U172 ( .A(n133), .Z(state_next_right[0]) );
  NOR2_C U173 ( .A(n25), .B(n7), .Z(n134) );
  INVERT_D U174 ( .A(n30), .Z(n135) );
  NOR2_C U175 ( .A(n134), .B(n135), .Z(n133) );
  OA21_K U176 ( .A1(n174), .A2(n175), .B(n32), .Z(n25) );
  OAI21_C U177 ( .A1(n170), .A2(n84), .B(n131), .Z(count_next_left[0]) );
  OAI21_C U178 ( .A1(n184), .A2(n142), .B(n166), .Z(
        left_taillight_control_next[1]) );
  OAI21_C U179 ( .A1(n209), .A2(n88), .B(n112), .Z(
        right_taillight_control_next[1]) );
  INVERT_C U180 ( .A(n136), .Z(count_next_right[0]) );
  NOR2_C U181 ( .A(n63), .B(n73), .Z(n137) );
  INVERT_D U182 ( .A(n152), .Z(n138) );
  NOR2_C U183 ( .A(n137), .B(n138), .Z(n136) );
  NAND2BAL_E U184 ( .A(n186), .B(n70), .Z(n73) );
  INVERT_C U185 ( .A(n139), .Z(count_next_left[1]) );
  NOR2_C U186 ( .A(n180), .B(n84), .Z(n140) );
  INVERT_D U187 ( .A(n154), .Z(n141) );
  NOR2_C U188 ( .A(n140), .B(n141), .Z(n139) );
  NAND2_F U189 ( .A(n21), .B(n160), .Z(n84) );
  AO21_E U190 ( .A1(n46), .A2(n204), .B(n103), .Z(n59) );
  INVERT_D U191 ( .A(n59), .Z(n142) );
  NOR2_C U192 ( .A(n143), .B(n144), .Z(n45) );
  INVERT_D U193 ( .A(n204), .Z(n145) );
  INVERT_D U194 ( .A(n201), .Z(n143) );
  NOR2_C U195 ( .A(n145), .B(n20), .Z(n146) );
  INVERT_E U196 ( .A(n146), .Z(n144) );
  INVERT_E U197 ( .A(n178), .Z(n176) );
  AO22_F U198 ( .A1(n37), .A2(n205), .B1(n9), .B2(n156), .Z(n43) );
  INVERT_D U199 ( .A(n43), .Z(n147) );
  AO22_F U200 ( .A1(n37), .A2(n2), .B1(n9), .B2(n155), .Z(n36) );
  INVERT_D U201 ( .A(n36), .Z(n148) );
  OA21_F U202 ( .A1(n79), .A2(n197), .B(n170), .Z(n87) );
  INVERT_D U203 ( .A(n87), .Z(n149) );
  OA21_F U204 ( .A1(n192), .A2(n182), .B(n68), .Z(n65) );
  INVERT_D U205 ( .A(n65), .Z(n150) );
  OA21_F U206 ( .A1(n192), .A2(n182), .B(n163), .Z(n72) );
  INVERT_D U207 ( .A(n72), .Z(n151) );
  OA21_F U208 ( .A1(n192), .A2(n182), .B(n190), .Z(n74) );
  INVERT_D U209 ( .A(n74), .Z(n152) );
  OA21_F U210 ( .A1(n79), .A2(n197), .B(n132), .Z(n78) );
  INVERT_D U211 ( .A(n78), .Z(n153) );
  OA21_F U212 ( .A1(n79), .A2(n197), .B(n86), .Z(n85) );
  INVERT_D U213 ( .A(n85), .Z(n154) );
  OA21_F U214 ( .A1(n39), .A2(n201), .B(n41), .Z(n38) );
  INVERT_D U215 ( .A(n38), .Z(n155) );
  NAND3_D U216 ( .A(n201), .B(n34), .C(n184), .Z(n41) );
  OA21_F U217 ( .A1(n204), .A2(n201), .B(n161), .Z(n44) );
  INVERT_D U218 ( .A(n44), .Z(n156) );
  INVERT_F U219 ( .A(n200), .Z(n157) );
  INVERT_H U220 ( .A(n157), .Z(n158) );
  INVERT_H U221 ( .A(n83), .Z(n159) );
  INVERT_H U222 ( .A(n159), .Z(n160) );
  NOR2_D U223 ( .A(n20), .B(n46), .Z(n83) );
  INVERT_H U224 ( .A(n34), .Z(n20) );
  NOR2_D U225 ( .A(n209), .B(n29), .Z(n27) );
  NOR2_F U226 ( .A(n24), .B(n100), .Z(n54) );
  NOR2_C U227 ( .A(n22), .B(n148), .Z(state_next_left[1]) );
  NOR2_C U228 ( .A(n22), .B(n147), .Z(state_next_left[0]) );
  NAND3_E U229 ( .A(count_right[2]), .B(n190), .C(n162), .Z(n29) );
  INVERT_H U230 ( .A(n33), .Z(n162) );
  BUFFER_J U231 ( .A(n42), .Z(n164) );
  AOI21_D U232 ( .A1(n188), .A2(n204), .B(n164), .Z(n39) );
  INVERT_F U233 ( .A(n57), .Z(n165) );
  INVERT_H U234 ( .A(n165), .Z(n166) );
  INVERT_F U235 ( .A(n37), .Z(n9) );
  INVERT_F U236 ( .A(n210), .Z(n167) );
  INVERT_H U237 ( .A(n167), .Z(n168) );
  INVERT_H U238 ( .A(n90), .Z(n169) );
  INVERT_K U239 ( .A(n169), .Z(n170) );
  INVERT_H U240 ( .A(n28), .Z(n171) );
  INVERT_H U241 ( .A(n171), .Z(n172) );
  INVERT_E U242 ( .A(n18), .Z(n173) );
  INVERT_H U243 ( .A(n173), .Z(n174) );
  INVERT_H U244 ( .A(n29), .Z(n175) );
  NAND3_C U245 ( .A(n177), .B(n7), .C(n175), .Z(n30) );
  AOI21_B U246 ( .A1(n46), .A2(n58), .B(n60), .Z(n62) );
  NAND2BAL_E U247 ( .A(n184), .B(n204), .Z(n58) );
  INVERT_F U248 ( .A(n176), .Z(n177) );
  AND2_H U249 ( .A(n34), .B(n35), .Z(n31) );
  INVERT_D U250 ( .A(n31), .Z(n178) );
  INVERT_H U251 ( .A(n211), .Z(n179) );
  INVERT_I U252 ( .A(n179), .Z(n180) );
  INVERT_H U253 ( .A(n67), .Z(n181) );
  INVERT_I U254 ( .A(n181), .Z(n182) );
  AND2_I U255 ( .A(n199), .B(n75), .Z(n67) );
  INVERT_H U256 ( .A(state_left[1]), .Z(n183) );
  INVERT_I U257 ( .A(n183), .Z(n184) );
  INVERT_H U258 ( .A(count_right[0]), .Z(n185) );
  INVERT_I U259 ( .A(n185), .Z(n186) );
  INVERT_F U260 ( .A(n206), .Z(n187) );
  INVERT_I U261 ( .A(n187), .Z(n188) );
  NAND2_J U262 ( .A(n95), .B(n19), .Z(n70) );
  INVERT_I U263 ( .A(n99), .Z(n19) );
  INVERT_F U264 ( .A(n207), .Z(n189) );
  INVERT_I U265 ( .A(n189), .Z(n190) );
  NAND2BAL_H U266 ( .A(n35), .B(n49), .Z(n63) );
  OAI21_F U267 ( .A1(n100), .A2(n23), .B(n24), .Z(n49) );
  NAND2_F U268 ( .A(n101), .B(n106), .Z(n35) );
  CLKI_O U269 ( .A(n191), .Z(n192) );
  NOR2_C U270 ( .A(n193), .B(n194), .Z(n66) );
  INVERT_E U271 ( .A(n75), .Z(n195) );
  INVERT_H U272 ( .A(n104), .Z(n193) );
  NOR2_C U273 ( .A(n98), .B(n195), .Z(n196) );
  INVERT_E U274 ( .A(n196), .Z(n194) );
  NAND3_E U275 ( .A(n190), .B(n168), .C(n215), .Z(n75) );
  CLKI_O U276 ( .A(n47), .Z(n8) );
  NAND2BAL_E U277 ( .A(n46), .B(n47), .Z(n80) );
  NAND3_H U278 ( .A(n213), .B(n180), .C(n170), .Z(n47) );
  NOR2_F U279 ( .A(n47), .B(n48), .Z(n37) );
  NOR2_F U280 ( .A(n48), .B(n8), .Z(n79) );
  NAND2_I U281 ( .A(n96), .B(n106), .Z(n48) );
  INVERT_H U282 ( .A(n53), .Z(n198) );
  INVERT_I U283 ( .A(n198), .Z(n199) );
  NOR2_F U284 ( .A(n34), .B(n104), .Z(n53) );
  INVERT_E U285 ( .A(n202), .Z(n200) );
  INVERT_I U286 ( .A(n158), .Z(n201) );
  AND2_H U287 ( .A(n46), .B(n8), .Z(n40) );
  INVERT_D U288 ( .A(n40), .Z(n202) );
  INVERT_K U289 ( .A(n97), .Z(n23) );
  INVERT_H U290 ( .A(state_left[0]), .Z(n203) );
  INVERT_K U291 ( .A(n203), .Z(n204) );
  NOR2_I U292 ( .A(n70), .B(n103), .Z(n46) );
  INVERT_H U293 ( .A(n170), .Z(n208) );
  INVERT_I U294 ( .A(n114), .Z(n209) );
  INVERT_F U295 ( .A(n49), .Z(n22) );
  XOR2_B U296 ( .A(count_left[1]), .B(n208), .Z(n86) );
  INVERT_H U297 ( .A(n212), .Z(n213) );
  XNOR2_B U298 ( .A(count_left[2]), .B(n128), .Z(n81) );
  INVERT_I U299 ( .A(n214), .Z(n215) );
  NOR2_E U300 ( .A(n24), .B(n97), .Z(n60) );
  INVERT_M U301 ( .A(n105), .Z(n24) );
  AOI21_B U302 ( .A1(n164), .A2(n46), .B(n60), .Z(n57) );
  OAI21_B U303 ( .A1(n63), .A2(n64), .B(n150), .Z(count_next_right[2]) );
  OAI21_B U304 ( .A1(n63), .A2(n125), .B(n151), .Z(count_next_right[1]) );
endmodule

