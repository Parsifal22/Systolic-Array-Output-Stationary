`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TalTech
// Engineer: Nikita Budovey
// 
// Create Date: 02/27/2023 06:23:17 PM 
// Module Name: PE
// Project Name: Systolic Array
// Target Devices: Artix 7 cpg236
// Tool Versions: Vivado 2022.1.2
// Description: Computational unit that sums and multiplies input values.
//
//////////////////////////////////////////////////////////////////////////////////


module PE
#(parameter        DATA_WIDTH = 16,
  parameter        MATRIX_SIZE = 2)
(           
          input [7:0]        number_iterations,
          input                         rstn,
          input                         clk,
          input                         weights_data_ready,
          input                         inputs_data_ready,                  
          input reg     signed  [DATA_WIDTH-1:0]   weights, 
          input reg     signed  [DATA_WIDTH-1:0]   inputs, 
          output        signed   [DATA_WIDTH-1:0]   next_pe_weights,
          output        signed   [DATA_WIDTH-1:0]   next_pe_inputs,
          output        signed   [DATA_WIDTH-1:0]   accumulator_result);
      
      
      //INNER VARIAVLES
      logic signed [DATA_WIDTH-1:0] mult_result,
                         sum_in_wh,
                         inner_next_pe_inputs,
                         inner_next_pe_weights;
  
      logic start_accumulating;
      

      Multiplier #(.DATA_WIDTH(DATA_WIDTH)) multiplyer( 
            .A(weights), 
            .B(inputs), 
            .O(mult_result)); 
    
    
     Accumulator #(.DATA_WIDTH(DATA_WIDTH)) contaioner(
        .number_iterations                   (number_iterations),   
        .rstn                                (rstn),
        .clk                                 (clk),
        .start_accumulating                         (start_accumulating),
        .input_data                          (mult_result),
        .result                              (sum_in_wh));
        

      //After receiving a signal that the data is ready, 
      //it starts loading them into the multiplication module.        
       always_ff @ (posedge clk) begin
            if (!rstn) begin
                inner_next_pe_inputs <= 0;
                inner_next_pe_weights <= 0;
                start_accumulating <= 0;         
            end
            else if (weights_data_ready && inputs_data_ready) begin
               start_accumulating   <= 1; 
               inner_next_pe_inputs <= inputs;
               inner_next_pe_weights <= weights;
            end
       end
    
    assign next_pe_weights= inner_next_pe_weights;
    assign next_pe_inputs= inner_next_pe_inputs;
    assign accumulator_result= sum_in_wh;
    
endmodule