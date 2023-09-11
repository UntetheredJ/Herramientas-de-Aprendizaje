/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

/**
 *
 * @author Daniel Pérez
 */
public class Estudiante{
    private String nombre;
    private int grado;
    private int promedio;
    
    public Estudiante(String nombre, int grado, int promedio){
        this.nombre=nombre;
        this.grado=grado;
        this.promedio=promedio;
    }
    
    public void imprimirEstudiante(){
        System.out.println("Nombre = "+nombre);
        System.out.println("Grado = "+grado);
        System.out.println("Promedio = "+promedio);
    }
}
