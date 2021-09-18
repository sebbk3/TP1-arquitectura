`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: input_options_ALU
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


module input_options_ALU
  #(
    parameter N_SWITCH    = 6,
    parameter N_BUTTONS   = 3 
    )
   (
    output wire [N_SWITCH - 1 : 0]      LEDS,
    input wire  [N_SWITCH - 1 : 0]      switches,
    input wire  [N_BUTTONS - 1 : 0]     buttons,
    input wire                          clock
    );

    reg [N_SWITCH - 1 : 0] Data_A;
    reg [N_SWITCH - 1 : 0] Data_B;
    reg [N_SWITCH - 1 : 0] Op;
    
    always @(posedge clock) begin
        case(buttons) 
        3'b100:
            Data_A = switches;
        3'b010:
            Data_B = switches;
        3'b001:
            Op = switches;
        endcase          
    end

ALU instance_ALU(
    .LEDS(LEDS), 
    .Data_A (Data_A), 
    .Data_B (Data_B), 
    .Op(Op)
);
endmodule
