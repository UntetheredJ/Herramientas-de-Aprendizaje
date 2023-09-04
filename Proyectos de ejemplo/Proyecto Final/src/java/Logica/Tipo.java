/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import Persistencia.ConexionBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;




/**
 *
 * @author Eduar Ortiz
 */
public class Tipo implements InterfaceTipo {

    private int id_tipo;
    private String nombre;
   

    public Tipo(int id_tipo, String nombre) {
        this.id_tipo = id_tipo;
        this.nombre = nombre;
    }

    public Tipo() {
    }

    public Tipo(int id_tipo) {
        this.id_tipo = id_tipo;
    }

    public int getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(int id_tipo) {
        this.id_tipo = id_tipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String toString() {
        return "Ropa{" + "id_tipo" + id_tipo + "nombre" + nombre + "imagen" + "}";
    }
    
    @Override
    public Tipo getTipo() {
        String sql = "SELECT * FROM tipo WHERE id_tipo="+this.id_tipo+";";
        ConexionBD conexion = new ConexionBD();
        
        try {
            ResultSet rs = conexion.consultarBD(sql);
            if (rs.next()) {
                this.id_tipo = rs.getInt("id_tipo");
                this.nombre = rs.getString("nombre");
            }
        } catch (SQLException ex) {
        } finally {
            conexion.cerrarConexion();
        }
        return this;
    }

    @Override
    public List<Tipo> listarTipo() {
        List<Tipo> listaTipo = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM tipo;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Tipo t;
            while (rs.next()) {
                t = new Tipo();
                t.setId_tipo(rs.getInt("id_tipo"));
                t.setNombre(rs.getString("nombre"));
                listaTipo.add(t);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaTipo;
    }
    
}
