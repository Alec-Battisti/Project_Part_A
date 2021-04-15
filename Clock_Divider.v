`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2021 05:32:41 AM
// Design Name: 
// Module Name: Clock_Divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Clock_Divider(
    input Clk, Reset,
    output reg Slow_Clock
    );
    
    localparam const = 50000000;
    
    reg [31:0] counter;
    
    always@(posedge(Clk),posedge(Reset))
    begin
        if(Reset)
            counter <= 32'b0;
        else if(counter == const - 1)
            counter <= 32'b0;
        else
            counter <= counter + 1;
        end
        
    always@(posedge(Clk),posedge(Reset))
    begin
        if(Reset)
            Slow_Clock <= 1'b0;
        else if(counter == const - 1)
            Slow_Clock <= ~Slow_Clock;
        else
            Slow_Clock <= Slow_Clock;
        end
    //// write a Verilog code to slow down the clock from 100 MHz to 1 Hz

  
    
    
endmodule
