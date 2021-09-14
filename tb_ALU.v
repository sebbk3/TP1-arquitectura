`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: tb_ALU
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

module tb_ALU;
  reg [5 : 0] A;
  reg [5 : 0] B;
  reg [5 : 0] OP;
  reg clock;
  wire [5 : 0] LEDS;

  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    
    clock = 0;
    A = 0;
    B = 0;
    OP = 0;
    
    #10
    A = 15;
    B = 20;
    OP = 6'b100000; //ADD
    //Resultado esperado: D.35 - 0x23 - 10 0011
    
    #10
    A = 20;
    B = 15;
    OP = 6'b100010; //SUB
    //Resultado esperado: 5 - 00 0101
    
    #10
    A = 15; //00 1111
    B = 20; //01 0100
    OP = 6'b100100; //AND
    //Resultado esperado: 4 - 00 0100

    #10
    A = 15; //00 1111
    B = 20; //01 0100
    OP = 6'b100101; //OR
    //Resultado esperado: D.31 - 0x1F - 01 1111
    
    #10
    A = 15; //00 1111
    B = 20; //01 0100
    OP = 6'b100110; //XOR
    //Resultado esperado: D.27 - 0x1B - 01 1011
    
    #10
    A = 20; //01 0100
    B = 3;
    OP = 6'b000011; //SRA
    //Resultado esperado: D.58 - ox3A - 11 1010, pero como tengo signo, se llena con 0 y espero 2 - 00 0010
    
    #10
    A = 15; //00 1111
    B = 3;
    OP = 6'b000010; //SRL
    //Resultado esperado: 1 - 00 0001
    
    #10
    A = 15; //00 1111
    B = 20; //01 0100
    OP = 6'b100111; //NOR
    //Resultado esperado: D.32 - 0x20 - 10 0000
    
    #10
    A = 0;
    B = 0;
    OP = 0;

  end
  
  always #5 clock = ~clock;
   
  ALU instance_ALU(
        .LEDS(LEDS), 
        .Data_A(A), 
        .Data_B(B), 
        .Op(OP),
        .clock(clock)
  );
  
   endmodule