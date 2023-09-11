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
public class Universidad{
    private String nombre;
    private ArrayList<Facultad> facultades;

    public Universidad(String nombre){
        this.nombre=nombre;
        facultades = new ArrayList<Facultad>();
    }
    
    public Universidad() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public ArrayList<Facultad> getFacultades() {
        return facultades;
    }

    public void setFacultades(ArrayList<Facultad> facultades) {
        this.facultades = facultades;
    }

    public void agregarFacultad(Facultad fac){
        facultades.add(fac);
    }

    public void imprimirU(){
        System.out.println("**************************");
        System.out.println("Universidad: "+getNombre());
        System.out.println("**************************");
        for(int i=0; i<facultades.size(); i++){
            Facultad fac = facultades.get(i);
            fac.imprimirFacultad();
        }
    }

    public void mostrarFacultades(){
        for(int i=0; i<facultades.size(); i++){
            Facultad fac = facultades.get(i);
            System.out.println((i)+" Facultad: "+fac.getNombre());
        }
    }
    
    public void agregarEscuela(int id,Escuela esc){
        facultades.get(id).agregarEscuela(esc);
    }
    
    public void mostrarEscuelaPorId(int id){
        facultades.get(id).mostrarEscuelas();
    }
    
    public void agregarEstudiantePorId(int idF,int idE, Estudiante es){
        facultades.get(idE).agregarEstudiantePorId(idE,es);
    }
}
