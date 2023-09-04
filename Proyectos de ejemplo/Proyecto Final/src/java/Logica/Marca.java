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
public class Marca implements InterfaceMarca {

    private int id_marca;
    private String nombre;
   

    public Marca(int id_marca, String nombre) {
        this.id_marca = id_marca;
        this.nombre = nombre;
    }

    public Marca() {
    }

    public Marca(int id_marca) {
        this.id_marca = id_marca;
    }

    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
        @Override
    public String toString() {
        return "Ropa{" + "id_marca" + id_marca + "nombre" + nombre + "}";
    }
    
    @Override
    public Marca getMarca() {
        String sql = "SELECT * FROM marca WHERE id_marca="+this.id_marca+";";
        ConexionBD conexion = new ConexionBD();
        
        try {
            ResultSet rs = conexion.consultarBD(sql);
            if (rs.next()) {
                this.id_marca = rs.getInt("id_marca");
                this.nombre = rs.getString("nombre");
            }
        } catch (SQLException ex) {
        } finally {
            conexion.cerrarConexion();
        }
        return this;
    }

    @Override
    public List<Marca> listarMarca() {
        List<Marca> listaMarca = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM marca;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Marca m;
            while (rs.next()) {
                m = new Marca();
                m.setId_marca(rs.getInt("id_marca"));
                m.setNombre(rs.getString("nombre"));
                listaMarca.add(m);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaMarca;
    }
    
}
