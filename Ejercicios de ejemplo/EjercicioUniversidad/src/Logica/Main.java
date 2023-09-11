/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

import java.util.Scanner;

/**
 *
 * @author Daniel Pérez
 */
public class Main {

    public class EjercicioUniversidad {

        public static Scanner opcion = new Scanner(System.in);
        public static Universidad u1 = new Universidad("UIS");

        public static void main(String[] args) {
            int op;
            boolean sw = true;
            do {
                System.out.println("===================="
                        + "\n1.Agregar Facultad"
                        + "\n2.Agregar Escuela"
                        + "\n3.Agregar Estudiante"
                        + "\n4.Mostra Facultades"
                        + "\n5.Mostra Escuela"
                        + "\n6.Mostra Estudiante"
                        + "\n0.Salir"
                        + "\n====================");
                op = opcion.nextInt();
                switch (op) {
                    case 0:
                        sw = false;
                        break;
                    case 1:
                        registrarFacultad();
                        break;
                    case 2:
                        registrarEscuela();
                        break;
                    case 3:
                        registrarEstudiante();
                        break;
                    case 4:
                        u1.mostrarFacultades();
                        break;
                    case 5:
                        System.out.println("Facultades");
                        u1.mostrarFacultades();
                        System.out.println("Elegir Facultad");
                        int opF = opcion.nextInt();
                        opcion.reset();
                        System.out.println("Escuelas");
                        u1.mostrarEscuelaPorId(opF);
                        break;
                    case 6:
                        System.out.println("Facultades");
                        u1.mostrarFacultades();
                        System.out.println("Elegir Facultad");
                        int opFa = opcion.nextInt();
                        opcion.reset();
                        System.out.println("Escuelas");
                        u1.mostrarEscuelaPorId(opFa);
                        break;
                    default:
                        System.out.println("Opcion invalida");
                }
                opcion.reset();
            } while (sw);
        }

        public static void registrarFacultad() {
            System.out.println("=======Registro Facultad=======");
            System.out.println("=======Nombre de facultad =====");
            String nombre = opcion.next();
            opcion.reset();
            Facultad f = new Facultad(nombre);
            u1.agregarFacultad(f);
        }

        public static void registrarEscuela() {
            System.out.println("=======Registro Escuela=======");
            System.out.println("Facultades");
            u1.mostrarFacultades();
            System.out.println("Elegir Facultad");
            int opF = opcion.nextInt();
            opcion.reset();
            System.out.println("=======Nombre de Escuela======");
            String nombreE = opcion.next();
            opcion.reset();
            Escuela e = new Escuela(nombreE);
            u1.agregarEscuela(opF, e);
        }

        public static void registrarEstudiante() {
            System.out.println("=======Registro Estudiante=======");
            System.out.println("Facultades");
            u1.mostrarFacultades();
            System.out.println("Elegir Facultad");
            int opF = opcion.nextInt();
            opcion.reset();
            System.out.println("Escuelas");
            u1.mostrarEscuelaPorId(opF);
            System.out.println("Elegir Escuela");
            int opE = opcion.nextInt();
            opcion.reset();
            Estudiante est = new Estudiante("n", 1, 1);
            u1.agregarEstudiantePorId(opF, opE, est);
        }

    }
}
