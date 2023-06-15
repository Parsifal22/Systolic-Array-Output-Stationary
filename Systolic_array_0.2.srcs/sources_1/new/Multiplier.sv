`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TalTech
// Engineer: -
// 
// Create Date: 04/04/2023 14:11:16 PM
// Module Name: Multiplier
// Project Name: Systolic Array
// Target Devices: Artix 7 cpg236
// Tool Versions: Vivado 2022.1.2
// Description: Multiplication using Wallace tree. The code was generated using Perl code
//////////////////////////////////////////////////////////////////////////////////


module Multiplier 
#(parameter        DATA_WIDTH = 8)
(A, B, O); 
input signed [DATA_WIDTH-1:0] A; 
input signed [DATA_WIDTH-1:0] B; 
output signed [DATA_WIDTH-1:0] O; 

wire PROD_0_0; 
wire PROD_1_0; 
wire PROD_2_0; 
wire PROD_3_0; 
wire PROD_4_0; 
wire PROD_5_0; 
wire PROD_6_0; 
wire PROD_7_0; 
wire PROD_0_1; 
wire PROD_1_1; 
wire PROD_2_1; 
wire PROD_3_1; 
wire PROD_4_1; 
wire PROD_5_1; 
wire PROD_6_1; 
wire PROD_7_1; 
wire PROD_0_2; 
wire PROD_1_2; 
wire PROD_2_2; 
wire PROD_3_2; 
wire PROD_4_2; 
wire PROD_5_2; 
wire PROD_6_2; 
wire PROD_7_2; 
wire PROD_0_3; 
wire PROD_1_3; 
wire PROD_2_3; 
wire PROD_3_3; 
wire PROD_4_3; 
wire PROD_5_3; 
wire PROD_6_3; 
wire PROD_7_3; 
wire PROD_0_4; 
wire PROD_1_4; 
wire PROD_2_4; 
wire PROD_3_4; 
wire PROD_4_4; 
wire PROD_5_4; 
wire PROD_6_4; 
wire PROD_7_4; 
wire PROD_0_5; 
wire PROD_1_5; 
wire PROD_2_5; 
wire PROD_3_5; 
wire PROD_4_5; 
wire PROD_5_5; 
wire PROD_6_5; 
wire PROD_7_5; 
wire PROD_0_6; 
wire PROD_1_6; 
wire PROD_2_6; 
wire PROD_3_6; 
wire PROD_4_6; 
wire PROD_5_6; 
wire PROD_6_6; 
wire PROD_7_6; 
wire PROD_0_7; 
wire PROD_1_7; 
wire PROD_2_7; 
wire PROD_3_7; 
wire PROD_4_7; 
wire PROD_5_7; 
wire PROD_6_7; 
wire PROD_7_7; 
wire COMP1_SUM; 
wire COMP1_CARRY; 
wire COMP2_SUM; 
wire COMP2_CARRY; 
wire COMP3_SUM; 
wire COMP3_CARRY; 
wire COMP4_SUM; 
wire COMP4_CARRY; 
wire COMP5_SUM; 
wire COMP5_CARRY; 
wire COMP6_SUM; 
wire COMP6_CARRY; 
wire COMP7_SUM; 
wire COMP7_CARRY; 
wire COMP8_SUM; 
wire COMP8_CARRY; 
wire COMP9_SUM; 
wire COMP9_CARRY; 
wire COMP10_SUM; 
wire COMP10_CARRY; 
wire COMP11_SUM; 
wire COMP11_CARRY; 
wire COMP12_SUM; 
wire COMP12_CARRY; 
wire COMP13_SUM; 
wire COMP13_CARRY; 
wire COMP14_SUM; 
wire COMP14_CARRY; 
wire COMP15_SUM; 
wire COMP15_CARRY; 
wire COMP16_SUM; 
wire COMP16_CARRY; 
wire COMP17_SUM; 
wire COMP17_CARRY; 
wire COMP18_SUM; 
wire COMP18_CARRY; 
wire COMP19_SUM; 
wire COMP19_CARRY; 
wire COMP20_SUM; 
wire COMP20_CARRY; 
wire COMP21_SUM; 
wire COMP21_CARRY; 
wire COMP22_SUM; 
wire COMP22_CARRY; 
wire COMP23_SUM; 
wire COMP23_CARRY; 
wire COMP24_SUM; 
wire COMP24_CARRY; 
wire COMP25_SUM; 
wire COMP25_CARRY; 
wire COMP26_SUM; 
wire COMP26_CARRY; 
wire COMP27_SUM; 
wire COMP27_CARRY; 
wire COMP28_SUM; 
wire COMP28_CARRY; 
wire COMP29_SUM; 
wire COMP29_CARRY; 
wire COMP30_SUM; 
wire COMP30_CARRY; 
wire COMP31_SUM; 
wire COMP31_CARRY; 
wire COMP32_SUM; 
wire COMP32_CARRY; 
wire COMP33_SUM; 
wire COMP33_CARRY; 
wire COMP34_SUM; 
wire COMP34_CARRY; 
wire COMP35_SUM; 
wire COMP35_CARRY; 
wire COMP36_SUM; 
wire COMP36_CARRY; 
wire COMP37_SUM; 
wire COMP37_CARRY; 
wire COMP38_SUM; 
wire COMP38_CARRY; 
wire COMP39_SUM; 
wire COMP39_CARRY; 
wire COMP40_SUM; 
wire COMP40_CARRY; 
wire COMP41_SUM; 
wire COMP41_CARRY; 
wire COMP42_SUM; 
wire COMP42_CARRY; 
wire COMP43_SUM; 
wire COMP43_CARRY; 

// Generating the products 
assign PROD_0_0 = A[0] && B[0]; 
assign PROD_1_0 = A[1] && B[0]; 
assign PROD_2_0 = A[2] && B[0]; 
assign PROD_3_0 = A[3] && B[0]; 
assign PROD_4_0 = A[4] && B[0]; 
assign PROD_5_0 = A[5] && B[0]; 
assign PROD_6_0 = A[6] && B[0]; 
assign PROD_7_0 = !(A[7] && B[0]); 
assign PROD_0_1 = A[0] && B[1]; 
assign PROD_1_1 = A[1] && B[1]; 
assign PROD_2_1 = A[2] && B[1]; 
assign PROD_3_1 = A[3] && B[1]; 
assign PROD_4_1 = A[4] && B[1]; 
assign PROD_5_1 = A[5] && B[1]; 
assign PROD_6_1 = A[6] && B[1]; 
assign PROD_7_1 = !(A[7] && B[1]); 
assign PROD_0_2 = A[0] && B[2]; 
assign PROD_1_2 = A[1] && B[2]; 
assign PROD_2_2 = A[2] && B[2]; 
assign PROD_3_2 = A[3] && B[2]; 
assign PROD_4_2 = A[4] && B[2]; 
assign PROD_5_2 = A[5] && B[2]; 
assign PROD_6_2 = A[6] && B[2]; 
assign PROD_7_2 = !(A[7] && B[2]); 
assign PROD_0_3 = A[0] && B[3]; 
assign PROD_1_3 = A[1] && B[3]; 
assign PROD_2_3 = A[2] && B[3]; 
assign PROD_3_3 = A[3] && B[3]; 
assign PROD_4_3 = A[4] && B[3]; 
assign PROD_5_3 = A[5] && B[3]; 
assign PROD_6_3 = A[6] && B[3]; 
assign PROD_7_3 = !(A[7] && B[3]); 
assign PROD_0_4 = A[0] && B[4]; 
assign PROD_1_4 = A[1] && B[4]; 
assign PROD_2_4 = A[2] && B[4]; 
assign PROD_3_4 = A[3] && B[4]; 
assign PROD_4_4 = A[4] && B[4]; 
assign PROD_5_4 = A[5] && B[4]; 
assign PROD_6_4 = A[6] && B[4]; 
assign PROD_7_4 = !(A[7] && B[4]); 
assign PROD_0_5 = A[0] && B[5]; 
assign PROD_1_5 = A[1] && B[5]; 
assign PROD_2_5 = A[2] && B[5]; 
assign PROD_3_5 = A[3] && B[5]; 
assign PROD_4_5 = A[4] && B[5]; 
assign PROD_5_5 = A[5] && B[5]; 
assign PROD_6_5 = A[6] && B[5]; 
assign PROD_7_5 = !(A[7] && B[5]); 
assign PROD_0_6 = A[0] && B[6]; 
assign PROD_1_6 = A[1] && B[6]; 
assign PROD_2_6 = A[2] && B[6]; 
assign PROD_3_6 = A[3] && B[6]; 
assign PROD_4_6 = A[4] && B[6]; 
assign PROD_5_6 = A[5] && B[6]; 
assign PROD_6_6 = A[6] && B[6]; 
assign PROD_7_6 = !(A[7] && B[6]); 
assign PROD_0_7 = !(A[0] && B[7]); 
assign PROD_1_7 = !(A[1] && B[7]); 
assign PROD_2_7 = !(A[2] && B[7]); 
assign PROD_3_7 = !(A[3] && B[7]); 
assign PROD_4_7 = !(A[4] && B[7]); 
assign PROD_5_7 = !(A[5] && B[7]); 
assign PROD_6_7 = !(A[6] && B[7]); 
assign PROD_7_7 = A[7] && B[7]; 

// Compressing the Products 
FULLADDER comp3_ins_1(.A(PROD_2_0), .B(PROD_1_1), .Cin(PROD_0_2), .S(COMP1_SUM), .Cout(COMP1_CARRY)); 
FULLADDER comp3_ins_2(.A(PROD_3_0), .B(PROD_2_1), .Cin(PROD_1_2), .S(COMP2_SUM), .Cout(COMP2_CARRY)); 
FULLADDER comp3_ins_3(.A(PROD_4_0), .B(PROD_3_1), .Cin(PROD_2_2), .S(COMP3_SUM), .Cout(COMP3_CARRY)); 
FULLADDER comp3_ins_4(.A(PROD_5_0), .B(PROD_4_1), .Cin(PROD_3_2), .S(COMP4_SUM), .Cout(COMP4_CARRY)); 
FULLADDER comp3_ins_5(.A(PROD_2_3), .B(PROD_1_4), .Cin(PROD_0_5), .S(COMP5_SUM), .Cout(COMP5_CARRY)); 
FULLADDER comp3_ins_6(.A(PROD_6_0), .B(PROD_5_1), .Cin(PROD_4_2), .S(COMP6_SUM), .Cout(COMP6_CARRY)); 
FULLADDER comp3_ins_7(.A(PROD_3_3), .B(PROD_2_4), .Cin(PROD_1_5), .S(COMP7_SUM), .Cout(COMP7_CARRY)); 
FULLADDER comp3_ins_8(.A(PROD_7_0), .B(PROD_6_1), .Cin(PROD_5_2), .S(COMP8_SUM), .Cout(COMP8_CARRY)); 
FULLADDER comp3_ins_9(.A(PROD_4_3), .B(PROD_3_4), .Cin(PROD_2_5), .S(COMP9_SUM), .Cout(COMP9_CARRY)); 
FULLADDER comp3_ins_10(.A(PROD_1_6), .B(PROD_0_7), .Cin(1'b1), .S(COMP10_SUM), .Cout(COMP10_CARRY)); 
FULLADDER comp3_ins_11(.A(PROD_7_1), .B(PROD_6_2), .Cin(PROD_5_3), .S(COMP11_SUM), .Cout(COMP11_CARRY)); 
FULLADDER comp3_ins_12(.A(PROD_4_4), .B(PROD_3_5), .Cin(PROD_2_6), .S(COMP12_SUM), .Cout(COMP12_CARRY)); 
FULLADDER comp3_ins_13(.A(PROD_7_2), .B(PROD_6_3), .Cin(PROD_5_4), .S(COMP13_SUM), .Cout(COMP13_CARRY)); 
FULLADDER comp3_ins_14(.A(PROD_4_5), .B(PROD_3_6), .Cin(PROD_2_7), .S(COMP14_SUM), .Cout(COMP14_CARRY)); 
FULLADDER comp3_ins_15(.A(PROD_7_3), .B(PROD_6_4), .Cin(PROD_5_5), .S(COMP15_SUM), .Cout(COMP15_CARRY)); 
FULLADDER comp3_ins_16(.A(PROD_7_4), .B(PROD_6_5), .Cin(PROD_5_6), .S(COMP16_SUM), .Cout(COMP16_CARRY)); 
FULLADDER comp3_ins_17(.A(PROD_7_5), .B(PROD_6_6), .Cin(PROD_5_7), .S(COMP17_SUM), .Cout(COMP17_CARRY)); 
FULLADDER comp3_ins_18(.A(COMP1_CARRY), .B(COMP2_SUM), .Cin(PROD_0_3), .S(COMP18_SUM), .Cout(COMP18_CARRY)); 
FULLADDER comp3_ins_19(.A(COMP2_CARRY), .B(COMP3_SUM), .Cin(PROD_1_3), .S(COMP19_SUM), .Cout(COMP19_CARRY)); 
FULLADDER comp3_ins_20(.A(COMP3_CARRY), .B(COMP4_SUM), .Cin(COMP5_SUM), .S(COMP20_SUM), .Cout(COMP20_CARRY)); 
FULLADDER comp3_ins_21(.A(COMP4_CARRY), .B(COMP5_CARRY), .Cin(COMP6_SUM), .S(COMP21_SUM), .Cout(COMP21_CARRY)); 
FULLADDER comp3_ins_22(.A(COMP6_CARRY), .B(COMP7_CARRY), .Cin(COMP8_SUM), .S(COMP22_SUM), .Cout(COMP22_CARRY)); 
FULLADDER comp3_ins_23(.A(COMP9_SUM), .B(COMP10_SUM), .Cin(1'b1), .S(COMP23_SUM), .Cout(COMP23_CARRY)); 
FULLADDER comp3_ins_24(.A(COMP8_CARRY), .B(COMP9_CARRY), .Cin(COMP10_CARRY), .S(COMP24_SUM), .Cout(COMP24_CARRY)); 
FULLADDER comp3_ins_25(.A(COMP11_SUM), .B(COMP12_SUM), .Cin(PROD_1_7), .S(COMP25_SUM), .Cout(COMP25_CARRY)); 
FULLADDER comp3_ins_26(.A(COMP11_CARRY), .B(COMP12_CARRY), .Cin(COMP13_SUM), .S(COMP26_SUM), .Cout(COMP26_CARRY)); 
FULLADDER comp3_ins_27(.A(COMP13_CARRY), .B(COMP14_CARRY), .Cin(COMP15_SUM), .S(COMP27_SUM), .Cout(COMP27_CARRY)); 
FULLADDER comp3_ins_28(.A(COMP15_CARRY), .B(COMP16_SUM), .Cin(PROD_4_7), .S(COMP28_SUM), .Cout(COMP28_CARRY)); 
FULLADDER comp3_ins_29(.A(COMP17_CARRY), .B(PROD_7_6), .Cin(PROD_6_7), .S(COMP29_SUM), .Cout(COMP29_CARRY)); 
FULLADDER comp3_ins_30(.A(COMP18_CARRY), .B(COMP19_SUM), .Cin(PROD_0_4), .S(COMP30_SUM), .Cout(COMP30_CARRY)); 
FULLADDER comp3_ins_31(.A(COMP20_CARRY), .B(COMP21_SUM), .Cin(COMP7_SUM), .S(COMP31_SUM), .Cout(COMP31_CARRY)); 
FULLADDER comp3_ins_32(.A(COMP21_CARRY), .B(COMP22_SUM), .Cin(COMP23_SUM), .S(COMP32_SUM), .Cout(COMP32_CARRY)); 
FULLADDER comp3_ins_33(.A(COMP22_CARRY), .B(COMP23_CARRY), .Cin(COMP24_SUM), .S(COMP33_SUM), .Cout(COMP33_CARRY)); 
FULLADDER comp3_ins_34(.A(COMP24_CARRY), .B(COMP25_CARRY), .Cin(COMP26_SUM), .S(COMP34_SUM), .Cout(COMP34_CARRY)); 
FULLADDER comp3_ins_35(.A(COMP26_CARRY), .B(COMP27_SUM), .Cin(PROD_4_6), .S(COMP35_SUM), .Cout(COMP35_CARRY)); 
FULLADDER comp3_ins_36(.A(COMP28_CARRY), .B(COMP16_CARRY), .Cin(COMP17_SUM), .S(COMP36_SUM), .Cout(COMP36_CARRY)); 
FULLADDER comp3_ins_37(.A(COMP30_CARRY), .B(COMP19_CARRY), .Cin(COMP20_SUM), .S(COMP37_SUM), .Cout(COMP37_CARRY)); 
FULLADDER comp3_ins_38(.A(COMP32_CARRY), .B(COMP33_SUM), .Cin(COMP25_SUM), .S(COMP38_SUM), .Cout(COMP38_CARRY)); 
FULLADDER comp3_ins_39(.A(COMP33_CARRY), .B(COMP34_SUM), .Cin(COMP14_SUM), .S(COMP39_SUM), .Cout(COMP39_CARRY)); 
FULLADDER comp3_ins_40(.A(COMP34_CARRY), .B(COMP35_SUM), .Cin(PROD_3_7), .S(COMP40_SUM), .Cout(COMP40_CARRY)); 
FULLADDER comp3_ins_41(.A(COMP35_CARRY), .B(COMP27_CARRY), .Cin(COMP28_SUM), .S(COMP41_SUM), .Cout(COMP41_CARRY)); 
FULLADDER comp3_ins_42(.A(COMP37_CARRY), .B(COMP31_SUM), .Cin(PROD_0_6), .S(COMP42_SUM), .Cout(COMP42_CARRY)); 
FULLADDER comp3_ins_43(.A(COMP42_CARRY), .B(COMP31_CARRY), .Cin(COMP32_SUM), .S(COMP43_SUM), .Cout(COMP43_CARRY)); 

// Adding the Final Two Products 
CLA20 cla_ins ( 
  .Cin(1'b0), 
  .A0(PROD_0_0), 
  .B0(1'b0), 
  .A1(PROD_1_0), 
  .B1(PROD_0_1), 
  .A2(COMP1_SUM), 
  .B2(1'b0), 
  .A3(COMP18_SUM), 
  .B3(1'b0), 
  .A4(COMP30_SUM), 
  .B4(1'b0), 
  .A5(COMP37_SUM), 
  .B5(1'b0), 
  .A6(COMP42_SUM), 
  .B6(1'b0), 
  .A7(COMP43_SUM), 
  .B7(1'b0), 
  .A8(COMP43_CARRY), 
  .B8(COMP38_SUM), 
  .A9(COMP38_CARRY), 
  .B9(COMP39_SUM), 
  .A10(COMP39_CARRY), 
  .B10(COMP40_SUM), 
  .A11(COMP40_CARRY), 
  .B11(COMP41_SUM), 
  .A12(COMP41_CARRY), 
  .B12(COMP36_SUM), 
  .A13(COMP36_CARRY), 
  .B13(COMP29_SUM), 
  .A14(COMP29_CARRY), 
  .B14(PROD_7_7), 
  .A15(1'b1), 
  .B15(1'b0), 
  .A16(1'b0), 
  .B16(1'b0), 
  .A17(1'b0), 
  .B17(1'b0), 
  .A18(1'b0), 
  .B18(1'b0), 
  .A19(1'b0), 
  .B19(1'b0), 
  .S0(O[0]), 
  .S1(O[1]), 
  .S2(O[2]), 
  .S3(O[3]), 
  .S4(O[4]), 
  .S5(O[5]), 
  .S6(O[6]), 
  .S7(O[7]), 
  .S8(), 
  .S9(), 
  .S10(), 
  .S11(), 
  .S12(), 
  .S13(), 
  .S14(), 
  .S15(), 
  .S16(), 
  .S17(), 
  .S18(), 
  .S19(), 
  .Cout()); 

endmodule 

module FULLADDER (A, B, Cin, S, Cout);
input A, B, Cin; 
output S, Cout;

assign S = A ^ B ^ Cin;
assign Cout = (A && B) || (A && Cin) || (B && Cin);

endmodule

module GENCARRY4 (C0, G0, G1, G2, G3, P0, P1, P2, P3, C1, C2, C3, C4); 
input C0; 
input G0, G1, G2, G3; 
input P0, P1, P2, P3; 
output C1, C2, C3, C4; 

// Functions for the Carry Signals 
assign C1 = (G0) || (C0 && P0); 
assign C2 = (G1) || (G0 && P1) || (C0 && P1 && P0); 
assign C3 = (G2) || (G1 && P2) || (G0 && P2 && P1) || (C0 && P2 && P1 && P0); 
assign C4 = (G3) || (G2 && P3) || (G1 && P3 && P2) || (G0 && P3 && P2 && P1) || (C0 && P3 && P2 && P1 && P0); 

endmodule 

module CLA20 (Cin, A0, B0, A1, B1, A2, B2, A3, B3, A4, B4, A5, B5, A6, B6, A7, B7, A8, B8, A9, B9, A10, B10, A11, B11, A12, B12, A13, B13, A14, B14, A15, B15, A16, B16, A17, B17, A18, B18, A19, B19, S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19, Cout); 
input Cin; 
input A0, A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15, A16, A17, A18, A19; 
input B0, B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11, B12, B13, B14, B15, B16, B17, B18, B19; 
output S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19; 
output Cout; 

//Carry, Propagate, and Generate Signals 
wire C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20; 
wire P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19; 
wire G0, G1, G2, G3, G4, G5, G6, G7, G8, G9, G10, G11, G12, G13, G14, G15, G16, G17, G18, G19; 

//Functions for the Propagate and Generate Signals 
assign P0 = A0 ^ B0; 
assign P1 = A1 ^ B1; 
assign P2 = A2 ^ B2; 
assign P3 = A3 ^ B3; 
assign P4 = A4 ^ B4; 
assign P5 = A5 ^ B5; 
assign P6 = A6 ^ B6; 
assign P7 = A7 ^ B7; 
assign P8 = A8 ^ B8; 
assign P9 = A9 ^ B9; 
assign P10 = A10 ^ B10; 
assign P11 = A11 ^ B11; 
assign P12 = A12 ^ B12; 
assign P13 = A13 ^ B13; 
assign P14 = A14 ^ B14; 
assign P15 = A15 ^ B15; 
assign P16 = A16 ^ B16; 
assign P17 = A17 ^ B17; 
assign P18 = A18 ^ B18; 
assign P19 = A19 ^ B19; 
assign G0 = A0 && B0; 
assign G1 = A1 && B1; 
assign G2 = A2 && B2; 
assign G3 = A3 && B3; 
assign G4 = A4 && B4; 
assign G5 = A5 && B5; 
assign G6 = A6 && B6; 
assign G7 = A7 && B7; 
assign G8 = A8 && B8; 
assign G9 = A9 && B9; 
assign G10 = A10 && B10; 
assign G11 = A11 && B11; 
assign G12 = A12 && B12; 
assign G13 = A13 && B13; 
assign G14 = A14 && B14; 
assign G15 = A15 && B15; 
assign G16 = A16 && B16; 
assign G17 = A17 && B17; 
assign G18 = A18 && B18; 
assign G19 = A19 && B19; 

//Functions for the Carry Signals 
GENCARRY4 gencarry4_ins1 (.C0(Cin), .G0(G0), .P0(P0), .G1(G1), .P1(P1), .G2(G2), .P2(P2), .G3(G3), .P3(P3), .C1(C1), .C2(C2), .C3(C3), .C4(C4)); 
GENCARRY4 gencarry4_ins2 (.C0(C4), .G0(G4), .P0(P4), .G1(G5), .P1(P5), .G2(G6), .P2(P6), .G3(G7), .P3(P7), .C1(C5), .C2(C6), .C3(C7), .C4(C8)); 
GENCARRY4 gencarry4_ins3 (.C0(C8), .G0(G8), .P0(P8), .G1(G9), .P1(P9), .G2(G10), .P2(P10), .G3(G11), .P3(P11), .C1(C9), .C2(C10), .C3(C11), .C4(C12)); 
GENCARRY4 gencarry4_ins4 (.C0(C12), .G0(G12), .P0(P12), .G1(G13), .P1(P13), .G2(G14), .P2(P14), .G3(G15), .P3(P15), .C1(C13), .C2(C14), .C3(C15), .C4(C16)); 
GENCARRY4 gencarry4_ins5 (.C0(C16), .G0(G16), .P0(P16), .G1(G17), .P1(P17), .G2(G18), .P2(P18), .G3(G19), .P3(P19), .C1(C17), .C2(C18), .C3(C19), .C4(C20)); 
assign Cout = C20; 

//Functions for the Sum Signals 
assign S0 = P0 ^ Cin; 
assign S1 = P1 ^ C1; 
assign S2 = P2 ^ C2; 
assign S3 = P3 ^ C3; 
assign S4 = P4 ^ C4; 
assign S5 = P5 ^ C5; 
assign S6 = P6 ^ C6; 
assign S7 = P7 ^ C7; 
assign S8 = P8 ^ C8; 
assign S9 = P9 ^ C9; 
assign S10 = P10 ^ C10; 
assign S11 = P11 ^ C11; 
assign S12 = P12 ^ C12; 
assign S13 = P13 ^ C13; 
assign S14 = P14 ^ C14; 
assign S15 = P15 ^ C15; 
assign S16 = P16 ^ C16; 
assign S17 = P17 ^ C17; 
assign S18 = P18 ^ C18; 
assign S19 = P19 ^ C19; 
 
endmodule 
