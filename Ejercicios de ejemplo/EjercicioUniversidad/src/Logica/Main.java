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
                        mostrarEscuela();
                        break;
                    case 6:
                        mostrarEstudiante();
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
            Facultad fac = u1.getFacultadById(opF);
            System.out.println("=======Nombre de Escuela======");
            String nombreE = opcion.next();
            opcion.reset();
            Escuela e = new Escuela(nombreE);
            fac.agregarEscuela(e);
        }

        public static void registrarEstudiante() {
            System.out.println("=======Registro Estudiante=======");
            System.out.println("Facultades");
            u1.mostrarFacultades();
            System.out.println("Elegir Facultad");
            int opF = opcion.nextInt();
            opcion.reset();
            Facultad fac = u1.getFacultadById(opF);
            System.out.println("Escuelas");
            fac.mostrarEscuelas();
            System.out.println("Elegir Escuela");
            int opE = opcion.nextInt();
            opcion.reset();
            Escuela es = fac.getEscuelaById(opE);
            System.out.println("Ingresar nombre");
            String nombre = opcion.next();
            System.out.println("Ingresar semestre");
            int grado = opcion.nextInt();
            System.out.println("Ingresar promedio");
            float promedio = opcion.nextFloat();
            Estudiante est = new Estudiante(nombre, grado, promedio);
            es.agregarEstudiante(est);
        }

        public static void mostrarEscuela() {
            System.out.println("Facultades");
            u1.mostrarFacultades();
            System.out.println("Elegir Facultad");
            int opF = opcion.nextInt();
            opcion.reset();
            Facultad fac = u1.getFacultadById(opF);
            System.out.println("Escuelas");
            fac.mostrarEscuelas();
        }

        public static void mostrarEstudiante() {
            System.out.println("Facultades");
            u1.mostrarFacultades();
            System.out.println("Elegir Facultad");
            int opFa = opcion.nextInt();
            Facultad fac1 = u1.getFacultadById(opFa);
            opcion.reset();
            System.out.println("Escuelas");
            fac1.mostrarEscuelas();
            System.out.println("Elegir Escuela");
            int opEs = opcion.nextInt();
            Escuela esc = fac1.getEscuelaById(opEs);
            esc.imprimirEscuela();
        }

    }
}
