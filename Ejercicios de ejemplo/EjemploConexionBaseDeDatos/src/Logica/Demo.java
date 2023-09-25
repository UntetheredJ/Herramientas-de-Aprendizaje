/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

import java.util.List;
import java.util.Scanner;

/**
 *
 * @author Daniel Pérez
 */
public class Demo {

    /**
     * @param args the command line arguments
     */
    public static Scanner opcion = new Scanner(System.in);

    public static void main(String[] args) {

        int op;
        boolean sw = true;
        do {
            System.out.println("===================="
                    + "\n1.Agregar Tarea"
                    + "\n2.Listar Tareas"
                    + "\n0.Salir"
                    + "\n====================");
            op = opcion.nextInt();
            switch (op) {
                case 0:
                    sw = false;
                    break;
                case 1:
                    agregarTarea();
                    break;
                case 2:
                    listarTareas();
                    break;
                default:
                    System.out.println("Opcion invalida");
            }
            opcion.reset();
        } while (sw);
    }

    public static void agregarTarea() {
        Tarea tarea = new Tarea();
        System.out.println("=======Agregar id de la tarea=======");
        int id = opcion.nextInt();
        opcion.reset();
        System.out.println("=======Agregar descripcion de la tarea=======");
        String descripcion = opcion.next();
        opcion.reset();
        tarea.setId(id);
        tarea.setDescripcion(descripcion);
        boolean resultado = tarea.agregarTarea();
        if (resultado == true) {
            System.out.println("Se agrego correctamente");
        } else {
            System.out.println("No se pudo agregar");
        }
    }
    
    public static void listarTareas() {
        Tarea tarea = new Tarea();
        List<Tarea> listaTareas = tarea.listarTareas();
        for(int i=0; i<listaTareas.size(); i++){
            Tarea t = listaTareas.get(i);
            System.out.println("Id: " + t.getId()+ " Descripcion: " + t.getDescripcion());
        }
    }
}
