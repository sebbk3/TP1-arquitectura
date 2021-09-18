`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: tb_auto_random
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


module tb_auto_random;
    
  reg [5 : 0] switches;
  reg [2 : 0] buttons;
  reg clock;
  wire [5 : 0] LEDS;
  reg [5 : 0] r_op[7 : 0];
  
  reg [5 : 0] a_aux;
  reg [5 : 0] b_aux;
  reg [5 : 0] res_aux;
  
  initial begin
  
    $dumpfile("dump.vcd"); $dumpvars;
    
    clock = 0;
    switches = 0;
    buttons = 0;
    a_aux = 0;
    b_aux = 0;
    res_aux = 0;
           
    r_op [0] = 6'b100000;  //ADD
    r_op [1] = 6'b100010;  //SUB
    r_op [2] = 6'b100100;  //AND
    r_op [3] = 6'b100101;  //OR
    r_op [4] = 6'b100110;  //XOR
    r_op [5] = 6'b000011;  //SRA
    r_op [6] = 6'b000010;  //SRL
    r_op [7] = 6'b100111;  //NOR
    
    end
//////////////////////////////////////////////////////////////////////////////////   
    always @(posedge clock) begin 
    
  //  ready = 0;
    
    #5
    switches = $urandom();
    a_aux = switches;
    buttons = 3'b100; //A

    #5
    switches = $urandom();
    b_aux = switches;
    buttons = 3'b010; //B

    #5
    switches = r_op[0]; 
    buttons = 3'b001; //ADD
    
    #4
    res_aux = (a_aux + b_aux);
    $display("Se realiza %d + %d = %d\n", a_aux, b_aux, res_aux);
    $display("El valor de la ALU es: %d\n", LEDS);
    if( res_aux != LEDS ) begin
        $error("Error en la operacion!");
        $display("#############   SUMA FALLO   ############\n");
        $finish();
        end
    else begin
        $display("############# SUMA CORRECTA  ############\n");    
        end
//////////////////////////////////////////////////////////////////////////////////  
    
    #5
    switches = $urandom();
    a_aux = switches;
    buttons = 3'b100; //A

    #5
    switches = $urandom();
    b_aux = switches;
    buttons = 3'b010; //B

    #5
    switches = r_op[1]; 
    buttons = 3'b001; //SUB
    
    #4
    res_aux = (a_aux - b_aux);
    $display("Se realiza %d - %d = %d\n", a_aux, b_aux, res_aux);
    $display("El valor de la ALU es: %d\n", LEDS);
    if( res_aux != LEDS ) begin
        $error("Error en la operacion!");
        $display("#############   RESTA FALLO   ############\n");
        $finish();
        end
    else begin
        $display("############# RESTA CORRECTA  ############\n");    
        end
        
//////////////////////////////////////////////////////////////////////////////////  
    
    #5
    switches = $urandom();
    a_aux = switches;
    buttons = 3'b100; //A

    #5
    switches = $urandom();
    b_aux = switches;
    buttons = 3'b010; //B

    #5
    switches = r_op[2]; 
    buttons = 3'b001; //AND
    
    #4
    res_aux = (a_aux & b_aux);
    $display("Se realiza %d & %d = %d\n", a_aux, b_aux, res_aux);
    $display("El valor de la ALU es: %d\n", LEDS);
    if( res_aux != LEDS ) begin
        $error("Error en la operacion!");
        $display("#############   AND FALLO   ############\n");
        $finish();
        end
    else begin
        $display("############# AND CORRECTA  ############\n");    
        end        
        
//////////////////////////////////////////////////////////////////////////////////  
    
    #5
    switches = $urandom();
    a_aux = switches;
    buttons = 3'b100; //A

    #5
    switches = $urandom();
    b_aux = switches;
    buttons = 3'b010; //B

    #5
    switches = r_op[3]; 
    buttons = 3'b001; //OR
    
    #4
    res_aux = (a_aux | b_aux);
    $display("Se realiza %d | %d = %d\n", a_aux, b_aux, res_aux);
    $display("El valor de la ALU es: %d\n", LEDS);
    if( res_aux != LEDS ) begin
        $error("Error en la operacion!");
        $display("#############   OR FALLO   ############\n");
        $finish();
        end
    else begin
        $display("############# OR CORRECTA  ############\n");    
        end
        
//////////////////////////////////////////////////////////////////////////////////  
    
    #5
    switches = $urandom();
    a_aux = switches;
    buttons = 3'b100; //A

    #5
    switches = $urandom();
    b_aux = switches;
    buttons = 3'b010; //B

    #5
    switches = r_op[4]; 
    buttons = 3'b001; //XOR
    
    #4
    res_aux = (a_aux ^ b_aux);
    $display("Se realiza %d ^ %d = %d\n", a_aux, b_aux, res_aux);
    $display("El valor de la ALU es: %d\n", LEDS);
    if( res_aux != LEDS ) begin
        $error("Error en la operacion!");
        $display("#############   XOR FALLO   ############\n");
        $finish();
        end
    else begin
        $display("############# XOR CORRECTA  ############\n");    
        end
        
//////////////////////////////////////////////////////////////////////////////////  
    
    #5
    switches = $urandom();
    a_aux = switches;
    buttons = 3'b100; //A

    #5
    switches = $urandom();
    b_aux = switches;
    buttons = 3'b010; //B

    #5
    switches = r_op[5]; 
    buttons = 3'b001; //SRA
    
    #4
    res_aux = (a_aux >>> b_aux);
    $display("Se realiza %d >>> %d = %d\n", a_aux, b_aux, res_aux);
    $display("El valor de la ALU es: %d\n", LEDS);
    if( res_aux != LEDS ) begin
        $error("Error en la operacion!");
        $display("#############   SRA FALLO   ############\n");
        $finish();
        end
    else begin
        $display("############# SRA CORRECTA  ############\n");    
        end
        
//////////////////////////////////////////////////////////////////////////////////  
    
    #5
    switches = $urandom();
    a_aux = switches;
    buttons = 3'b100; //A

    #5
    switches = $urandom();
    b_aux = switches;
    buttons = 3'b010; //B

    #5
    switches = r_op[6]; 
    buttons = 3'b001; //SRL
    
    #4
    res_aux = (a_aux >> b_aux);
    $display("Se realiza %d >> %d = %d\n", a_aux, b_aux, res_aux);
    $display("El valor de la ALU es: %d\n", LEDS);
    if( res_aux != LEDS ) begin
        $error("Error en la operacion!");
        $display("#############   SRL FALLO   ############\n");
        $finish();
        end
    else begin
        $display("############# SRL CORRECTA  ############\n");    
        end
        
//////////////////////////////////////////////////////////////////////////////////  
    
    #5
    switches = $urandom();
    a_aux = switches;
    buttons = 3'b100; //A

    #5
    switches = $urandom();
    b_aux = switches;
    buttons = 3'b010; //B

    #5
    switches = r_op[7]; 
    buttons = 3'b001; //NOR
    
    #4
    res_aux = ~(a_aux | b_aux);
    $display("Se realiza ~(%d | %d) = %d\n", a_aux, b_aux, res_aux);
    $display("El valor de la ALU es: %d\n", LEDS);
    if( res_aux != LEDS ) begin
        $error("Error en la operacion!");
        $display("#############   NOR FALLO   ############\n");
        $finish();
        end
    else begin
        $display("############# NOR CORRECTA  ############\n");    
        end
      
  end
  
  always #1 clock = ~clock;
   
  input_options_ALU instance_input_options_ALU(
        .LEDS(LEDS), 
        .switches(switches), 
        .buttons(buttons), 
        .clock(clock)
  );

endmodule
