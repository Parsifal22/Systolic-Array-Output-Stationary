`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TalTech
// Engineer: Nikita Budovey
// 
// Create Date: 03/21/2023 02:29:48 PM
// Module Name: tb_Systolic_Array
// Project Name: Systolic Array
// Target Devices: Artix 7 cpg236
// Tool Versions: Vivado 2022.1.2 
// Description: 
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_Systolic_Array;
    
    parameter MATRIX_SIZE = 5;
    parameter DATA_WIDTH = 16;
    
    logic rstn, clk, writing_signal;
    logic signed [DATA_WIDTH-1:0] inputs;
    logic signed [DATA_WIDTH-1:0] weights;
     
    logic signed [DATA_WIDTH-1:0] matrix_weights [MATRIX_SIZE-1: 0][MATRIX_SIZE-1: 0] = '{'{10, -1, 2, 0, 6}, '{1, -5, 5, 0, 7}, '{-1, 3, 5, 13, -4}, '{8, -5, 13, 0, 10}, '{3, 1, 4, 11, 5}};
    logic signed [DATA_WIDTH-1:0] matrix_inputs  [MATRIX_SIZE-1: 0][MATRIX_SIZE-1: 0]  = '{'{14, 8, -3, 8, 6}, '{2, 2, 7, 14, 7}, '{5, 12, 14, 1, 6}, '{6, 12, 13, -3, 10}, '{9, -1, 3, 8, 12}};
    
    

   Systolic_Array #(.MATRIX_SIZE(MATRIX_SIZE), .DATA_WIDTH((DATA_WIDTH))) Systolic_Array (
   .rstn                (rstn),
   .clk                 (clk),
   .writing_signal     (writing_signal),
   .inputs              (inputs),
   .weights             (weights)); 
       

  initial begin
  clk = 0;
  
    forever begin
        #5 clk = ~clk;
    end 
  end
  
  initial begin
  
      rstn <= 0;
      #10
      rstn <= 1;
      #10;

      //Matrix 2x2 
      //weights = '{'{4, 3, 0}, '{0, 2, 1}}; 
      //inputs <= '{'{8, 0}, '{7, 6}, '{0, 5}};
      
      //Matrix 3x3
      //weights = '{'{1, 2, 3, 0, 0}, '{0, 4, 5, 6, 0}, '{0, 0, 7, 8, 9}}; 
      //inputs <= '{'{9, 0, 0}, '{8, 6, 0}, '{7, 5, 3}, '{0, 4, 2}, '{0, 0, 1}};
      for (int i=0; i<MATRIX_SIZE; i++) begin
        writing_signal <= 1;
        for(int j=0; j<MATRIX_SIZE; j++) begin
            weights <= matrix_weights[j][i];
            inputs <= matrix_inputs[i][j];
            #10;
            
        end
      end  
      
  end 
endmodule
