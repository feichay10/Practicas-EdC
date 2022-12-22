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

// === OBJETIVO 3 ===

module compl1(output wire [3:0] Sal, input wire [3:0] Ent, input wire cpl);
    assign Sal = cpl ? (~Ent) : Ent;
endmodule