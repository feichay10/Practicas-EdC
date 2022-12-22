/*
-Práctica 02 Estructura de Computadores
-Objetivo: Simulación de la Unidad de Control de una CPU simple
-Alumno: Cheuk Kelly Ng Pante
-Correo: alu0101364544@ull.edu.es
-Curso 2020-2021
-Compilacion: iverilog -o Practica02 componentes.v alu.v memprog.v microc.v microc_tb.v
-Simulación: vvp Practica02
*/

// Testbench para modulo microc.v
`timescale 1 ns / 10 ps
module microc_tb;
//Declaracion de las señales
wire t_z;
reg t_reset, t_clk;
reg t_wez, t_we3, t_s_inm, t_s_inc, t_s_abs;
reg [2:0] t_op; 
wire [5:0] t_opcode;

always 
begin
    t_clk = 1;
    #15;
    t_clk = 0;
    #15;
end

microc tb_microc(t_clk, t_reset, t_s_abs, t_s_inc, t_s_inm, t_we3, t_wez, t_op, t_z, t_opcode);

initial
begin
    $dumpfile("microc_tb.vcd");
    $dumpvars;
    t_reset = 1;
    #5
    t_reset = 0;
end

initial
begin
    //Primer flanco - Instruccion 0
    #15 // primera mitad
    t_s_abs=0;
    t_s_inc=1;
    t_s_inm=1;
    t_we3=1; 
    t_wez=0;
    t_op=0;
    #15 // segunda mitad

    //Segundo flanco - Instruccion 1
    #15 // primera mitad
    t_s_abs=0;
    t_s_inc=1;
    t_s_inm=1;
    t_we3=1; 
    t_wez=0;
    t_op=0;
    #15 // segunda mitad

    //Tercer flanco - Instruccion 2
    #15
    t_s_abs=0;
    t_s_inc=1;
    t_s_inm=1;
    t_we3=1; 
    t_wez=0;
    t_op=0;
    #15

    //Cuarto flanco - Instruccion 3
    #15 // primera mitad
    t_s_abs=1;
    t_s_inc=0;
    t_s_inm=0;
    t_we3=0; 
    t_wez=0;
    t_op=1;
    #15 // segunda mitad

    //Quinto flanco - Instruccion 4
    #15 // primera mitad
    t_s_abs=1;
    t_s_inc=0;
    t_s_inm=0;
    t_we3=0; 
    t_wez=0;
    t_op=0;
    #15 // segunda mitad

    $finish;
end

endmodule