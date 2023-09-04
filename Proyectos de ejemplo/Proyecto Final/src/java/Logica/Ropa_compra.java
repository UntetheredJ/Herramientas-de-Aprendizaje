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
 * @author MIGUEL HENAO
 */
public class Ropa_compra implements InterfaceRopa_compra {

    private int id_ropa_compra;
    private String id_compra;
    private int id_ropa;
    private Ropa ropa;
    private int cantidad;

    public Ropa_compra(String id_compra, int id_ropa, int cantidad) {
        this.id_compra = id_compra;
        this.id_ropa = id_ropa;
        this.cantidad = cantidad;
    }

    public Ropa_compra() {

    }

    public Ropa getRopa() {
        return ropa;
    }

    public void setRopa(Ropa ropa) {
        this.ropa = ropa;
    }

    public int getId_ropa_compra() {
        return id_ropa_compra;
    }

    public void setId_ropa_compra(int id_ropa_compra) {
        this.id_ropa_compra = id_ropa_compra;
    }

    public String getId_compra() {
        return id_compra;
    }

    public void setId_compra(String id_compra) {
        this.id_compra = id_compra;
    }

    public int getId_ropa() {
        return id_ropa;
    }

    public void setId_ropa(int id_ropa) {
        this.id_ropa = id_ropa;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    

    @Override
    public Ropa_compra getRopa_compra() {
        return this;
    }
    
    public boolean guardarCantidadCompra() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO ropa_compra (id_compra,id_ropa,cantidad)\n"
                + "VALUES('"+ this.id_compra +"',"+ this.id_ropa +", "+ this.cantidad +");";
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

    public List<Ropa_compra> listarComprasPorId(String id_compra) {
        List<Ropa_compra> listaRopa_compra = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM ropa_compra WHERE id_compra='"+ id_compra +"';";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Ropa_compra c;
            while (rs.next()) {
                c = new Ropa_compra();
                c.setId_ropa_compra(rs.getInt("id_ropa_compra"));
                c.setId_compra(rs.getString("id_compra"));
                c.setId_ropa(rs.getInt("id_ropa"));
                c.setCantidad(rs.getInt("cantidad"));
                Ropa r = new Ropa(c.getId_ropa()).getRopa();
                c.setRopa(r);
                listaRopa_compra.add(c);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaRopa_compra;
    }
}