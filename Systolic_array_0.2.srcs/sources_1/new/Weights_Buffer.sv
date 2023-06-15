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
// Description: Module for storing weight data
// 
//////////////////////////////////////////////////////////////////////////////////


module Weights_Buffer
#(parameter     MATRIX_SIZE = 2,
  parameter     DATA_WIDTH = 16)
(
    input    signed [DATA_WIDTH-1:0]   input_data,                                              
    input                               rstn,
    input                               clk,
    input                               inputs_data_ready,
    input                               writing_signal,
    output                              data_ready, 
    output   signed [DATA_WIDTH-1:0]   colum_array [MATRIX_SIZE-1:0]
);
    //INNER VARIABLES
    logic signed [DATA_WIDTH-1:0] weights_matrix [MATRIX_SIZE - 1:0][(MATRIX_SIZE + MATRIX_SIZE)-2:0];
    logic signed [DATA_WIDTH-1:0]  prepared_output_data [MATRIX_SIZE-1:0];
    logic [7:0]                                 row, colum;
    logic                                       inner_data_ready, start_fetching;
    
    
    always_ff @ (posedge clk) begin
    
        if(!rstn) begin
            row <= 0;
            colum <= 0;
            inner_data_ready <= 0;
            for (int i = 0; i < MATRIX_SIZE; i++) begin
                 prepared_output_data[i] <= 0;
            end
            
            for (int i=0; i < MATRIX_SIZE; i++) begin
                for (int j=0; j < (MATRIX_SIZE + MATRIX_SIZE)-1; j++) begin
                    weights_matrix[i][j] <= 0;
                end
            end
                    
        end
        else if (colum == MATRIX_SIZE) begin
            inner_data_ready <= 1;
            if (inputs_data_ready) begin
                for (int i = 0; i < MATRIX_SIZE; i++) begin
                     prepared_output_data[i] <= weights_matrix[i][row];
                end 
                row += 1;
           end 
        end 

        else if (writing_signal) begin 
            if (row == MATRIX_SIZE-1) begin
                colum <= colum + 1;
                row <= 0;
            end
        
            weights_matrix[row][colum + row] <= input_data;
            row += 1;
        end      
    end
    
    assign colum_array = prepared_output_data;
    assign data_ready = inner_data_ready; 
    
endmodule
