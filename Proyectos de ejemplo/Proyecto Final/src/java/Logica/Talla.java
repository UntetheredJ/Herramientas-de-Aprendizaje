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
 * @author Eduar Ortiz
 */
public class Talla implements InterfaceTalla {

    private int id_talla;
    private String nombre;

    public Talla(int id_talla, String nombre) {
        this.id_talla = id_talla;
        this.nombre = nombre;
    }

    public Talla(int id_talla) {
        this.id_talla = id_talla;
    }

    public Talla() {

    }

    public int getId_talla() {
        return id_talla;

    }

    public void setId_talla(int Id_talla) {
        this.id_talla = Id_talla;
    }

    public String getnombre() {
        return nombre;
    }

    public void Setnombre(String nombre) {
        this.nombre = nombre;
    }

    public String toString() {
        return "Ropa{" + "id_talla" + id_talla + "nombre" + nombre + "imagen" + "}";
    }
    
    @Override
    public Talla getTalla() {
        String sql = "SELECT * FROM talla WHERE id_talla="+this.id_talla+";";
        ConexionBD conexion = new ConexionBD();
        
        try {
            ResultSet rs = conexion.consultarBD(sql);
            if (rs.next()) {
                this.id_talla = rs.getInt("id_talla");
                this.nombre = rs.getString("nombre");
            }
        } catch (SQLException ex) {
        } finally {
            conexion.cerrarConexion();
        }
        return this;
    }

    @Override
    public List<Talla> listarTalla() {
        List<Talla> listaTalla = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM talla;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Talla t;
            while (rs.next()) {
                t = new Talla();
                t.setId_talla(rs.getInt("id_talla"));
                t.Setnombre(rs.getString("nombre"));
                listaTalla.add(t);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaTalla;
    }
}
