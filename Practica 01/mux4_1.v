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

// === OBJETIVO 1 ===

//Modulo del Mux
module mux4_1(output reg out, input wire a, b, c, d, input wire [1:0] s);
    always @(a,b,c,d,s)
    begin
        case(s)
        2'b00 : out = a;     // 0 : out = a;
        2'b01 : out = b;    // 1 : out = b;
        2'b10 : out = c;    // 2: out = c;
        2'b11 : out = d;    // 3 : out = d;
        default: out = 'bx;   //default : out = x;
        endcase
    end
endmodule