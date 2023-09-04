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
public class Compra implements InterfaceCompra {

    private String id_compra;
    private int id_usuario;
    private String fecha;
    private int total;

    public Compra(String id_compra, int id_usuario, String fecha, int total) {
        this.id_compra = id_compra;
        this.id_usuario = id_usuario;
        this.fecha = fecha;
        this.total = total;
    }

    public Compra(int id_usuario, String fecha, int total) {
        this.id_usuario = id_usuario;
        this.fecha = fecha;
        this.total = total;
    }

    public Compra(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public Compra() {
    }

    
    public String getId_compra() {
        return id_compra;
    }

    public void setId_compra(String id_compra) {
        this.id_compra = id_compra;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public Compra getCompra() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public boolean guardarCompra() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO compra (id_compra, id_usuario, fecha, total)\n"
                + "VALUES('"+ this.id_compra+"',"+ this.id_usuario +",'"+ this.fecha +"', "+ this.total +");";
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
    
    public List<Compra> listarCompras(int id_usuario) {
        List<Compra> listaCompra = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM compra WHERE id_usuario="+ id_usuario +";";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Compra c;
            while (rs.next()) {
                c = new Compra();
                c.setId_compra(rs.getString("id_compra"));
                c.setId_usuario(rs.getInt("id_usuario"));
                c.setFecha(rs.getString("fecha"));
                c.setTotal(rs.getInt("total"));
                listaCompra.add(c);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaCompra;
    }

}
