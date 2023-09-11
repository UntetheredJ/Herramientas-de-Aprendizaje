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
public class Facultad{
    private String nombre;
    private ArrayList<Escuela> escuelas;

    public Facultad(String nombre){
        this.nombre=nombre;
        escuelas = new ArrayList<Escuela>();
    }

    public void agregarEscuela(Escuela esc){
        escuelas.add(esc);
    }

    public void imprimirFacultad(){
        System.out.println("*******************");
        System.out.println("Facultad: "+getNombreFacultad());
        System.out.println("*******************");
        for(int i=0; i<escuelas.size(); i++){
            Escuela esc = escuelas.get(i);
            esc.imprimirEscuela();
        }
    }
    
    public void mostrarEscuelas(){
        for(int i=0; i<escuelas.size(); i++){
            Escuela es = escuelas.get(i);
            System.out.println((i)+" Escuela: "+es.getNombreE());
        }
    }
    
    public String getNombreFacultad(){
        return nombre;
    }
    
    public void agregarEstudiantePorId(int id, Estudiante est){
        escuelas.get(id).agregarEstudiante(est);
    }
}