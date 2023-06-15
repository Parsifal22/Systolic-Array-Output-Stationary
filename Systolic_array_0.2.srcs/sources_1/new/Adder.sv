`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TalTech
// Engineer: Nikita Budovey
// 
// Create Date: 03/08/2023 03:35:12 PM
// Modules Name: Adder, carry_look_ahead_4bit
// Project Name: Systolic Array
// Target Devices: Artix 7 cpg236
// Tool Versions: Vivado 2022.1.2
// Description: Adds 2 numbers
//////////////////////////////////////////////////////////////////////////////////


module Adder
#(parameter        DATA_WIDTH = 16)
(
    input   signed      [DATA_WIDTH-1:0]   a,b,
    input                       cin,
    output  signed      [DATA_WIDTH-1:0]   sum,
    output                      cout
    );
    
    //INNER VARIABLE
    wire     c [DATA_WIDTH/4:0];
    
    //The input value is assigned to the first value of the register. 
    //Latest to the output value.
    assign    c[0] = cin;
    assign cout = c[DATA_WIDTH/4];
    
    // Generates 4 bits carry look ahead adder. 
    //The input Data is divided into parts of 4 bits. 
    //All divided parts are interconnected 
    //using an array of carrier bits c.
    genvar i;
                   
    generate 
        for (i = 0; i < DATA_WIDTH/4; i++) begin
            carry_look_ahead_4bit cla (
            .a(a[4*(i+1)-1:4*i]), 
            .b(b[4*(i+1)-1:4*i]), 
            .cin(c[i]), 
            .sum(sum[4*(i+1)-1:4*i]), 
            .cout(c[i+1]));
        end
    endgenerate
    
    
    
endmodule


module carry_look_ahead_4bit(a,b, cin, sum,cout);
input signed [3:0] a,b;
input cin;
output signed [3:0] sum;
output cout;

wire [3:0] p,g,c;

assign p=a^b;//propagate
assign g=a&b; //generate

//carry=gi + Pi.ci

assign c[0]=cin;
assign c[1]= g[0]|(p[0]&c[0]);
assign c[2]= g[1] | (p[1]&g[0]) | p[1]&p[0]&c[0];
assign c[3]= g[2] | (p[2]&g[1]) | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&c[0];
assign cout= g[3] | (p[3]&g[2]) | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&g[0] | p[3]&p[2]&p[1]&p[0]&c[0];
assign sum=p^c;

endmodule
