/*
-Práctica 02 Estructura de Computadores
-Objetivo: Simulación de la Unidad de Control de una CPU simple
-Alumno: Cheuk Kelly Ng Pante
-Correo: alu0101364544@ull.edu.es
-Curso 2020-2021
-Compilacion: iverilog -o Practica02 componentes.v alu.v memprog.v microc.v microc_tb.v
-Simulación: vvp Practica02
*/

module microc(input wire clk, reset, s_abs, s_inc, s_inm, we3, wez, input wire [2:0] op, output wire z, output wire [5:0] opcode);
//Microcontrolador sin memoria de datos de un solo ciclo

wire [9:0] DIR, sal_mux_pc, Ent_mux_sum, sal_sum;
wire [15:0] INST;
wire [7:0] RD1, RD2, WD3, sal_alu;
wire ZALU;
//wire UNO[9:0]; 

//Instanciar e interconectar pc, memprog, regfile, alu, sum, biestable Z y mux's
    registro #(10) PC(clk, reset, sal_mux_pc, DIR);
    memprog MPROG(clk,DIR, INST);
    regfile banco(clk, we3, INST[11:8], INST[7:4], INST[3:0], WD3, RD1, RD2);
    alu ALU(RD1, RD2, op, sal_alu, ZALU);
    sum SUM(Ent_mux_sum, DIR, sal_sum);
    ffd FFZ(clk, reset, wez, ZALU, z);
    mux2 #(10) MUX_pc(INST[9:0], sal_sum, s_abs, sal_mux_pc);             //Mux entrada PC
    mux2 #(10) MUX_sum(INST[9:0], 10'b0000000001, s_inc, Ent_mux_sum);    //Mux entrada SUM
    mux2 #(8) MUX_banco(sal_alu, INST[11:4], s_inm, WD3);                 //Mux entrada de Banco de registros

    assign opcode = INST[15:10];

endmodule
