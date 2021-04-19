`timescale 1ns / 1ps

module Top(
    input Clk, Reset,
    input [7:0] AN,
    output [7:0] display,
    output [7:0] Anode
    );
    
    wire Slow_Clk_Divider;                 //Output of Clock_Divider, connects to Counter , 'CLk' input
    wire [3:0] Counter_Output;             //Output of Counter, connects to Bin_7Segment, 'Bin' input

    Clock_Divider (.Clk(Clk), .Reset(Reset), .Slow_Clock(Slow_Clk_Divider) );
    Counter (.Clk(Slow_Clk_Divider), .Reset(Reset), .Q(Counter_Output));
    Bin_7Segment(.Bin(Counter_Output), .Seven_Segment(display));
    
    assign Anode = AN;                  //Activates the appropriate anodes for the 7 segment display

    
endmodule
