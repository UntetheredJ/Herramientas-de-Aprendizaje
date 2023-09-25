/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Logica;

import Persistencia.ConexionBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Daniel Pérez
 */
public class Tarea implements InterfaceTarea{
    private int id;
    private String descripcion;

    public Tarea(int id, String descripcion) {
        this.id = id;
        this.descripcion = descripcion;
    }

    public Tarea() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    @Override
    public boolean agregarTarea() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO tarea (id, descripcion) VALUES("+ this.id +",'"+ this.descripcion +"');";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.insertarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                exito = true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
            }
        } else {
            conexion.cerrarConexion();
        }
        return exito;
    }
    
    @Override
    public List<Tarea> listarTareas(){
        List<Tarea> listaTareas = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM tarea;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Tarea t;
            while (rs.next()) {
                t = new Tarea();
                t.setId(rs.getInt("id"));
                t.setDescripcion(rs.getString("descripcion"));
                listaTareas.add(t);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaTareas;
    }
    
}