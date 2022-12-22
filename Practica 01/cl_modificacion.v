/*
-Práctica 01 Estructura de Computadores
-Objetivo: Realizar una ALU de 4 bits capaz de realizar sumas y restas en C2 
y generar los bits de flags asociados, así como varias operaciones lógicas
-Alumno: Cheuk Kelly Ng Pante
-Correo: alu0101364544@ull.edu.es
-Curso 2020-2021
-Compilacion (para la modificacion): iverilog -o Practica01_mod alu_tb.v ALU.v cal.v compl1.v mux2_1.v mux2_4.v cl_modificacion.v fa.v
-Simulación: vvp Practica01_mod
*/

// === OBJETIVO 2 ===

//MODIFICACION - Crear el modulo del mux4_1 en este modulo, no instanciar

// Modulo de la Celda logica
module cl(output reg out, input wire a, b, input wire [1:0] s);
    //wire sa, so, sx, sn; 

    //Creamos las puertas logicas
    /*
    and and1 (sa, a, b);
    or or1  (so, a, b);
    xor xor1 (sx, a, b);
    not not1 (sn, a);
    */

    //Instanciamos el mux4_1 al modulo de la celda logica
    //mux4_1 mux1 (out, sa, so, sx, sn, s);

    //MODIFICACION 
    always @(a,b)
    begin
        case(s)
        2'b00 : out = a & b;   
        2'b01 : out = a | b;
        2'b10 : out = a ^ b;
        2'b11 : out = ~a;
        default out = 'bx;
        endcase
    end

endmodule