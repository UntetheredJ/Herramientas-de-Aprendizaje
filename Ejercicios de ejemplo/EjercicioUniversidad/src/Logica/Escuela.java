/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

import java.util.ArrayList;

/**
 *
 * @author Daniel Pérez
 */
public class Escuela{
    private String nombre;
    private ArrayList<Estudiante> estudiantes;

    public Escuela(String nombre){
        this.nombre=nombre;
        estudiantes=new ArrayList<Estudiante>();
    }

    public void agregarEstudiante(Estudiante est){
        estudiantes.add(est);
    }

    public void imprimirEscuela(){
        System.out.println("$$$$$$$$$$$$$$$$$");
        System.out.println("Escuela = "+getNombreE());
        System.out.println("$$$$$$$$$$$$$$$$$");
        for(int i=0; i<estudiantes.size(); i++){
            Estudiante est = estudiantes.get(i);
            System.out.println("=====================");
            System.out.println("Estudiante #"+(i));
            est.imprimirEstudiante();
            System.out.println("=====================");
        }
    }

    public String getNombreE(){
        return nombre;
    }
}
