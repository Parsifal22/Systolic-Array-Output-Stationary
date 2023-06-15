`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TalTech
// Engineer: Nikita Budovey
// 
// Create Date: 06/14/2023 09:50:57 PM
// Design Name: 
// Module Name: tb_Multiplier
// Project Name: Systolic Array
// Target Devices: Artix 7 cpg236
// Tool Versions: Vivado 2022.1.2
// Description: Test Multiplier module
//////////////////////////////////////////////////////////////////////////////////


module tb_Multiplier (); 
reg signed [7:0] A; 
reg signed [7:0] B; 
wire signed [15:0] O; 

initial begin 
  repeat(10000) begin 
    A = $random; 
    B = $random; 
    #10; 
    if (A*B !== O) begin 
      $display("[ERROR] Multiplication of %0d by %d is computed wrong!", A, B); $stop; 
    end 
  end 
  $display("[INFO] The multiplier has just been verified!"); 
  $stop; 
end 

Multiplier multiplier ( 
  .A(A), 
  .B(B), 
  .O(O)); 

endmodule 
