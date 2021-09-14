`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: tb_input_options_ALU
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


module tb_input_options_ALU;
  reg [5 : 0] switches;
  reg [2 : 0] buttons;
  reg clock;
  wire [5 : 0] LEDS;

  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    
    clock = 0;
    switches = 0;
    buttons = 0;

//////////////////////////////////////////////////////////////////////////////////    
    #5
    switches = 15;
    buttons = 6'b100; //A
    
    #5
    switches = 20;
    buttons = 6'b010; //B
    
    #5
    switches = 6'b100000; //ADD
    buttons = 3'b001; //Op
    //Resultado esperado: D.35 - 0x23 - 10 0011
//////////////////////////////////////////////////////////////////////////////////    
    
    #5
    switches = 20;
    buttons = 6'b100; //A
    
    #5
    switches = 15;
    buttons = 6'b010; //B
    
    #5
    switches = 6'b100010; //SUB
    buttons = 3'b001; //Op
    //Resultado esperado: 5 - 00 0101    
//////////////////////////////////////////////////////////////////////////////////   
 
    #5
    switches = 15;
    buttons = 6'b100; //A
    
    #5
    switches = 20;
    buttons = 6'b010; //B
    
    #5
    switches = 6'b100100; //AND
    buttons = 3'b001; //Op
    //Resultado esperado: 4 - 00 0100
////////////////////////////////////////////////////////////////////////////////// 
    
    #5
    switches = 20;
    buttons = 6'b100; //A
    
    #5
    switches = 15;
    buttons = 6'b010; //B
    
    #5
    switches = 6'b100101; //OR
    buttons = 3'b001; //Op
    //Resultado esperado: D.31 - 0x1F - 01 1111
////////////////////////////////////////////////////////////////////////////////// 

    #5
    switches = 15;
    buttons = 6'b100; //A
    
    #5
    switches = 20;
    buttons = 6'b010; //B
    
    #5
    switches = 6'b100110; //XOR
    buttons = 3'b001; //Op
    //Resultado esperado: D.27 - 0x1B - 01 1011
//////////////////////////////////////////////////////////////////////////////////
    
    #5
    switches = 20;
    buttons = 6'b100; //A
    
    #5
    switches = 15;
    buttons = 6'b010; //B
    
    #5
    switches = 6'b100111; //NOR
    buttons = 3'b001; //Op
    //Resultado esperado: D.32 - 0x20 - 10 0000
//////////////////////////////////////////////////////////////////////////////////
    
    #5
    switches = 0;
    buttons = 0;

  end
  
  always #1 clock = ~clock;
   
  input_options_ALU instance_input_options_ALU(
        .LEDS(LEDS), 
        .switches(switches), 
        .buttons(buttons), 
        .clock(clock)
  );
endmodule
