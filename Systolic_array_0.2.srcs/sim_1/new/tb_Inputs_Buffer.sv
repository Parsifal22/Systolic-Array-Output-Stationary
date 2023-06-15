`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TalTech
// Engineer: Nikita Budovey
// 
// Create Date: 04/04/2023 01:49:41 PM
// Module Name: Weights_Buffer
// Project Name: Systolic Array
// Target Devices: Artix 7 cpg236
// Tool Versions: Vivado 2022.1.2 
// Description: Test Inputs_Buffer
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_Inputs_Buffer;

    parameter MATRIX_SIZE = 3;
    parameter DATA_WIDTH = 8;
    
    logic rstn, clk, data_ready;
    logic signed [DATA_WIDTH-1:0] inputs;
    logic signed [DATA_WIDTH-1:0]  outputs [MATRIX_SIZE-1:0];
    
       Inputs_Buffer #(.MATRIX_SIZE(MATRIX_SIZE), .DATA_WIDTH((DATA_WIDTH))) uut (
       .rstn                (rstn),
       .clk                 (clk),
       .data_ready          (data_ready),
       .input_data          (inputs),
       .row_array         (outputs)); 
  
    
  initial begin
  clk = 0;
  
    forever begin
        #5 clk = ~clk;
    end 
  end
  
  initial begin
      rstn <= 0;
      repeat (1) @ (posedge clk);
      rstn <=1;
      inputs <= 1;
      repeat (1) @ (posedge clk);
      inputs <= 4;
      repeat (1) @ (posedge clk);
      inputs <= 7;
      repeat (1) @ (posedge clk);
      inputs <= 2;
      repeat (1) @ (posedge clk);
      inputs <= 5;
      repeat (1) @ (posedge clk);
      inputs <= 8;
      repeat (1) @ (posedge clk);
      inputs <= 3;
      repeat (1) @ (posedge clk);
      inputs <= 6;
      repeat (1) @ (posedge clk);
      inputs <= 9;     
      repeat (1) @ (posedge clk);
      inputs <= 0;      
         
  end 
endmodule
