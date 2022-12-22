/*
-Práctica 01 Estructura de Computadores
-Objetivo: Realizar una ALU de 4 bits capaz de realizar sumas y restas en C2 
y generar los bits de flags asociados, así como varias operaciones lógicas
-Alumno: Cheuk Kelly Ng Pante
-Correo: alu0101364544@ull.edu.es
-Curso 2020-2021
-Compilacion: iverilog -o Practica01 alu_tb.v ALU.v cal.v compl1.v mux2_1.v mux2_4.v mux4_1.v cl.v fa.v
-Simulación: vvp Practica01
*/

// === OBJETIVO 2.3 ===

//Modulo celda aritmetico-logico
module cal(output wire out, c_out, input wire a, b, l, c_in, input wire [1:0] s);
    wire sum_out_fa, sum_out_cl;

    //Instanciamos los modulos de cl, fa y mux2_1 al modulo cal
    cl celda_logica (sum_out_cl, a, b, s);
    fa full_adder (c_out, sum_out_fa, a, b, c_in);
    mux2_1 mux2 (out, sum_out_fa, sum_out_cl, l);
endmodule