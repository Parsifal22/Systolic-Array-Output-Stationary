`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TalTech
// Engineer: Nikita Budovey
// 
// Create Date: 03/01/2023 05:57:28 PM
// Module Name: tb_PE
// Project Name: Systolic Array
// Target Devices: Artix 7 cpg236
// Tool Versions: Vivado 2022.1.2
// Description: Test PE module
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_PE;
  logic clk, rstn;
  logic [7:0] weights;
  logic [7:0] inputs;
  logic [7:0] nex_pe_weights;
  logic [7:0] next_pe_inputs;

       
    PE uut (
       .rstn                (rstn),
       .clk                 (clk),
       .weights             (weights),
       .inputs              (inputs),
       .next_pe_weights     (nex_pe_weights),
       .next_pe_inputs      (next_pe_inputs)); 
  
    
  initial begin
  clk = 0;
  
    forever begin
        #5 clk = ~clk;
    end 
  end
  
  initial begin
  
      rstn <= 0;
      repeat (1) @ (posedge clk);
      weights <= 1; inputs <= 2;
      rstn <= 1;
      repeat (1) @ (posedge clk);
        
      weights <= 2; inputs <= 4;
      repeat (1) @ (posedge clk);
      
      weights <= 3; inputs <= 6;
      repeat (1) @ (posedge clk);
      
      weights <= -2; inputs <= 4;
  end 
     
endmodule
