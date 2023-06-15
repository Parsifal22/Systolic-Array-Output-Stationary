`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TalTech
// Engineer: Nikita Budovey
// 
// Create Date: 03/08/2023 04:01:39 PM
// Module Name: tb_Summator
// Project Name: Systolic Array
// Target Devices: Artix 7 cpg236
// Tool Versions: Vivado 2022.1.2
// Description: Test Adder module
//////////////////////////////////////////////////////////////////////////////////


module tb_Adder;

parameter DATA_WIDTH = 1024;

reg signed [DATA_WIDTH-1:0] a,b;
reg cin;
wire signed [DATA_WIDTH-1:0] sum;
wire cout;

  Adder #(.DATA_WIDTH((DATA_WIDTH))) uut(.a(a), .b(b),.cin(cin),.sum(sum),.cout(cout));

initial begin
  a=2; b=14;        cin=0;       //16
  #10 a=-7; b=-7;   cin=0;       //-14
  #10 a=13; b=-1;   cin=0;       //12
  #10 a=0; b=-5;    cin=0;       //-5
  #10 a=-12; b=18;    cin=0;     //6
end

endmodule
