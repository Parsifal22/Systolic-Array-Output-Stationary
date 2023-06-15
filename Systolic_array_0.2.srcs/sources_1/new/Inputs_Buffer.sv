`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TalTech
// Engineer: Nikita Budovey
// 
// Create Date: 04/05/2023 04:39:07 PM
// Module Name: Inputs_Buffer
// Project Name: Systolic Array
// Target Devices: Artix 7 cpg236
// Tool Versions: Vivado 2022.1.2 
// Description: Module for storing input data
// 
//////////////////////////////////////////////////////////////////////////////////


module Inputs_Buffer
#(parameter     MATRIX_SIZE = 2,
  parameter     DATA_WIDTH = 16)
(
    input    signed [DATA_WIDTH-1:0]   input_data,                                              
    input                               rstn,
    input                               clk,
    input                               writing_signal,
    input                               weights_data_ready,
    output                              data_ready, 
    output   signed [DATA_WIDTH-1:0]   row_array [MATRIX_SIZE-1:0]
);
    //INNER VARIABLES
    logic signed [DATA_WIDTH-1:0] inputs_matrix [(MATRIX_SIZE + MATRIX_SIZE)-2:0][MATRIX_SIZE - 1:0];
    logic signed [DATA_WIDTH-1:0]  prepared_output_data [MATRIX_SIZE-1:0];
    logic [7:0]                                 row, colum;
    logic                                       inner_data_ready, start_fetching;
    
    
    //Loads the data until it fills the matrix completely. 
    //After that, it sends a signal about the readiness to load data.
    always_ff @ (posedge clk) begin
    
    
        if(!rstn) begin
            row <= 0;
            colum <= 0;
            inner_data_ready <= 0;
            
            for (int i = 0; i < MATRIX_SIZE; i++) begin
                 prepared_output_data[i] <= 0;
            end
            
            for (int i=0; i < (MATRIX_SIZE + MATRIX_SIZE)-1; i++) begin
                for (int j=0; j < MATRIX_SIZE; j++) begin
                    inputs_matrix[i][j] <= 0;
                end
            end
        end
        
        else if (row == MATRIX_SIZE) begin
            inner_data_ready <= 1;
            if (weights_data_ready) begin
                for (int i = 0; i < MATRIX_SIZE; i++) begin
                     prepared_output_data[i] <= inputs_matrix[colum][i];
                end 
                colum += 1;
             end 
        end
        else if (writing_signal) begin
            if (colum == MATRIX_SIZE-1) begin
                row <= row + 1;
                colum <= 0;
            end
            // The data is immediately shifted to the right position.
            inputs_matrix[colum + row][colum] <= input_data;
            colum += 1; 
       end     
    end
    
    assign row_array = prepared_output_data;
    assign data_ready = inner_data_ready; 
    
endmodule