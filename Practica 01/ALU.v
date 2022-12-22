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

// === OBJETIVO 4 ===

module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUOp, input wire L);
    wire [3:0] OP1, OP2, wire_C1, cout;
    wire OP1_A, OP2_B, cpl, cin;

    //Instanciamos los diferentes modulos al modulo ALU
    mux2_4 mux_ALU01 (OP1, 4'b0000, A, OP1_A);
    mux2_4 mux_ALU02 (wire_C1, A, B, OP2_B);
    compl1 C1_ALU (OP2, wire_C1, cpl);
    
    cal cal0 (R[0], cout[0], OP1[0], OP2[0], L, cin, ALUOp);
    cal cal1 (R[1], cout[1], OP1[1], OP2[1], L, cout[0], ALUOp);
    cal cal2 (R[2], cout[2], OP1[2], OP2[2], L, cout[1], ALUOp);
    cal cal3 (R[3], cout[3], OP1[3], OP2[3], L, cout[2], ALUOp);

    //Funciones logicas
    assign OP1_A = (~ALUOp[1])|L;    
    assign OP2_B = ((~ALUOp[1]))|((~L)&ALUOp[0])|(L&(~ALUOp[0]));
    assign cpl = ((~L)&ALUOp[0])|((~L)&ALUOp[1]);
    assign cin = cpl;

    assign sign = R[3]; // bit más significativo
    assign carry = cout[3]; 
    //assign zero = (~R[0])&(~R[1])&(~R[2])&(~R[3]);

    //MODIFICACION
    assign zero = ~(R[0]|R[1]|R[2]|R[3]);
endmodule