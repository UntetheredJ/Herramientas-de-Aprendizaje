/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Logica;

import java.util.List;


/**
 *
 * @author MIGUEL HENAO
 */
public interface InterfaceRopa {

    public Ropa getRopa();
    public List<Ropa> listarRopa();
    public boolean guardarRopa();
    public boolean actualizarRopa();
    public boolean eliminarRopa();
    public List<Ropa> consultarPorNombre(String nombre);
}