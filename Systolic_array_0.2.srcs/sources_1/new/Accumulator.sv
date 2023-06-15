`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TalTech
// Engineer: Nikita Budovey
// 
// Create Date: 03/29/2023 11:18:06 AM
// Module Name: Accumulator
// Project Name: Systolic Array
// Target Devices: Artix 7 cpg236
// Tool Versions: Vivado 2022.1.2
// Description: Module to summarize the validated data from the PE module.
//////////////////////////////////////////////////////////////////////////////////


module Accumulator
#(parameter       DATA_WIDTH = 4)
(   
    input [7:0]       number_iterations,
    input rstn,
    input clk,
    input start_accumulating,
    input signed [DATA_WIDTH-1:0] input_data,
    output signed [DATA_WIDTH-1:0] result
    );
    
    //INNER VARIABLES
    logic signed [DATA_WIDTH-1:0] mult_result, sum, sum_results;
    logic [7:0] counter;
    logic cout;
    
         Adder #(.DATA_WIDTH(DATA_WIDTH)) add(
        .a              (sum_results), 
        .b              (mult_result),
        .cin            (0),
        .sum            (sum),
        .cout           (cout));
      
      
      always_ff @ (posedge clk) begin
      
            if (!rstn) begin
                mult_result <= 0;
                sum_results <= 0;
                counter <= 0;     
            end

            else if (start_accumulating) begin
            
                if (counter == number_iterations+1) begin
                     
                     mult_result <= 0;
                     
                     //ReLu
                     if (sum[DATA_WIDTH-1] == 1) begin
                        sum_results <= 0;
                     end
                     else begin
                        sum_results <= sum;
                     end
                     sum_results <= sum;
                end
                else begin
                
                    mult_result <= input_data;
                    sum_results <= sum;
                    counter += 1;
                     
                end
                  
           end
            
      end 
        
    assign result = sum_results;   
    
endmodule
