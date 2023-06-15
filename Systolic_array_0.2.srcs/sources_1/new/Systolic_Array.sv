`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TalTech
// Engineer: Nikita Budovey
// 
// Create Date: 03/17/2023 01:20:41 PM
// Module Name: Systolic_Array
// Project Name: Systolic Array
// Target Devices: Artix 7 cpg236
// Tool Versions: Vivado 2022.1.2 
// Description: Top module for a project that creates a matrix of PE modules and connects them to memory buffers.
// 
//////////////////////////////////////////////////////////////////////////////////


module Systolic_Array
#(  parameter           MATRIX_SIZE     =   2,
    parameter           DATA_WIDTH      =   8
    )
(
    input                               rstn,
    input                               clk,
    input                               writing_signal,
    input signed    [DATA_WIDTH-1:0]    inputs,
    input signed    [DATA_WIDTH-1:0]    weights,
    
    output          [DATA_WIDTH-1:0]    result 
    );
    
    //INNER VARIABLES
    logic signed    [DATA_WIDTH-1:0]    inner_result;
    logic           [7:0]               counter;          
    logic signed    [DATA_WIDTH-1:0]    next_inputs             [MATRIX_SIZE:0][MATRIX_SIZE - 1:0];
    logic signed    [DATA_WIDTH-1:0]    next_weights            [MATRIX_SIZE - 1:0][MATRIX_SIZE:0];
    logic signed    [DATA_WIDTH-1:0]    array_results           [MATRIX_SIZE - 1:0][MATRIX_SIZE - 1:0];
    logic                               weights_data_ready;  
    logic                               inputs_data_ready;
    logic signed    [DATA_WIDTH-1:0]    colum                   [MATRIX_SIZE - 1:0];
    logic signed    [DATA_WIDTH-1:0]    row                     [MATRIX_SIZE - 1:0];
    

    //Generate PE matrix
    genvar i, j;
                   
    generate 
        for (i = 0; i < MATRIX_SIZE; i++) begin
            for (j = 0; j < MATRIX_SIZE; j++) begin
                           
               PE #(.DATA_WIDTH(DATA_WIDTH)) pe (
               
                .number_iterations   (MATRIX_SIZE + j + (MATRIX_SIZE * i)),
                .rstn                (rstn),
                .clk                 (clk),
                .weights_data_ready  (weights_data_ready),
                .inputs_data_ready   (inputs_data_ready),
                .weights             (next_weights[i][j]),
                .inputs              (next_inputs[i][j]),
                .next_pe_weights     (next_weights[i][j+1]),
                .next_pe_inputs      (next_inputs[i+1][j]),
                .accumulator_result  (array_results[i][j])
                );
                            
            end  
          
        end
    endgenerate
    
  
    Weights_Buffer #(.MATRIX_SIZE(MATRIX_SIZE), .DATA_WIDTH((DATA_WIDTH))) weights_register (
       .rstn                (rstn),
       .clk                 (clk),
       .writing_signal      (writing_signal),
       .inputs_data_ready   (inputs_data_ready),
       .data_ready          (weights_data_ready),
       .input_data          (weights),
       .colum_array         (colum)); 
       
       
    Inputs_Buffer #(.MATRIX_SIZE(MATRIX_SIZE), .DATA_WIDTH((DATA_WIDTH))) inputs_register (
       .rstn                (rstn),
       .clk                 (clk),
       .writing_signal      (writing_signal),
       .weights_data_ready  (weights_data_ready),
       .data_ready          (inputs_data_ready),
       .input_data          (inputs),
       .row_array           (row)); 
       
 
       
          
    always_ff @ (posedge clk) begin
    
        if (!rstn) begin
            counter <= 0;
            for (int i=0; i<MATRIX_SIZE; i++) begin 
                next_inputs[0][i] <= 0;
                next_weights[i][0] <= 0;
             end
        end
        
        else if (counter == MATRIX_SIZE+MATRIX_SIZE) begin
            for (int i=0; i<MATRIX_SIZE; i++) begin 
                next_inputs[0][i] <= 0;
                next_weights[i][0] <= 0;
             end
             
        end
        
        //When both memory buffers are ready, we start loading data into the matrix.
        else if (weights_data_ready && inputs_data_ready) begin
        
            next_inputs[0][MATRIX_SIZE-1:0] <= row[MATRIX_SIZE-1:0];
            
            for (int i = 0; i < MATRIX_SIZE; i++) begin
                 next_weights[i][0] <= colum[i];
            end
            
            counter += 1;
                  
        end
    end
   
   
   assign result = array_results[1][1];

endmodule
