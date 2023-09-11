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
    private float promedio;
    
    public Estudiante(String nombre, int grado, float promedio){
        this.nombre=nombre;
        this.grado=grado;
        this.promedio=promedio;
    }
    
    public Estudiante() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getGrado() {
        return grado;
    }

    public void setGrado(int grado) {
        this.grado = grado;
    }

    public float getPromedio() {
        return promedio;
    }

    public void setPromedio(float promedio) {
        this.promedio = promedio;
    }
    
    public void imprimirEstudiante(){
        System.out.println("Nombre = "+nombre);
        System.out.println("Grado = "+grado);
        System.out.println("Promedio = "+promedio);
    }
}
