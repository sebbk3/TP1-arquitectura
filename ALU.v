`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: ALU
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

module ALU
  #(
    parameter N_BITS = 6,
    parameter N_OPS  = 6
    )
   (
    output wire [N_BITS - 1 : 0] LEDS,
    input wire  [N_BITS - 1 : 0] Data_A,
    input wire  [N_BITS - 1 : 0] Data_B,
    input wire  [N_OPS  - 1 : 0] Op
    );
    reg [N_BITS - 1 : 0] auxLEDS; 

    always @(*) begin
        //auxLEDS = 0;
        case(Op) 
        6'b100000: //ADD
            auxLEDS = (Data_A + Data_B);
        6'b100010: //SUB
            auxLEDS = (Data_A - Data_B);
        6'b100100: //AND
            auxLEDS = (Data_A & Data_B);
        6'b100101: //OR
            auxLEDS = (Data_A | Data_B); 
        6'b100110: //XOR
            auxLEDS = (Data_A ^ Data_B);
        6'b000011: //SRA - mueve derecha y rellena con signo
            auxLEDS = (Data_A >>> Data_B);
        6'b000010: //SRL - mueve derecha y rellena con ceros
            auxLEDS = (Data_A >> Data_B);
        6'b100111: //NOR
            auxLEDS = ~(Data_A | Data_B);
        default:
            auxLEDS = 0;
        endcase                 
    end


assign LEDS = auxLEDS;

endmodule
