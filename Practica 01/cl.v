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

// === OBJETIVO 2 ===

// Modulo de la Celda logica
module cl(output wire out, input wire a, b, input wire [1:0] s);
    wire sa, so, sx, sn; 

    //Creamos las puertas logicas
    and and1 (sa, a, b);
    or or1  (so, a, b);
    xor xor1 (sx, a, b);
    not not1 (sn, a);

    //Instanciamos el mux4_1 al modulo de la celda logica
    mux4_1 mux1 (out, sa, so, sx, sn, s);
endmodule