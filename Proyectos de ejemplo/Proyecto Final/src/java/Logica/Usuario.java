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
public class Usuario implements InterfaceUsuario {

    private int id_usuario;
    private String nombre_usuario;
    private String nombre;
    private String contrasenna;
    private String direccion;
    private List<Ropa> carrito;

    public Usuario(int id_usuario, String nombre_usuario, String nombre, String contrasenna, String direccion) {
        this.id_usuario = id_usuario;
        this.nombre_usuario = nombre_usuario;
        this.nombre = nombre;
        this.contrasenna = contrasenna;
        this.direccion = direccion;
    }

    public Usuario() {
    }

    public Usuario(String nombre_usuario, String contrasenna) {
        this.nombre_usuario = nombre_usuario;
        this.contrasenna = contrasenna;
    }

    public Usuario(List<Ropa> carrito) {
        this.carrito = carrito;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getid_Usuario() {
        return id_usuario;

    }

    public void setid_Usuario(int id_Usuario) {
        this.id_usuario = id_Usuario;

    }

    public String getnombre_usuario() {
        return nombre_usuario;
    }

    public void setnombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;

    }

    public String getcontrasenna() {
        return contrasenna;

    }

    public void setcontrasenna(String contraseña) {
        this.contrasenna = contraseña;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setdireccion(String direccion) {
        this.direccion = direccion;
    }

    public List<Ropa> getCarrito() {
        return carrito;
    }

    public void setCarrito(List<Ropa> carrito) {
        this.carrito = carrito;
    }

    @Override
    public Usuario getUsuario() {
        return this;
    }

    public Usuario validarUsuario() {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT id_usuario,nombre,nombre_usuario,direccion FROM usuario WHERE nombre_usuario='" + this.nombre_usuario
                + "' AND contrasenna='" + this.contrasenna + "' ;";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            if (rs.next()) {
                this.contrasenna = "";
                this.nombre_usuario = rs.getString("nombre_usuario");
                this.nombre = rs.getString("nombre");
                this.direccion = rs.getString("direccion");
                this.id_usuario = rs.getInt("id_usuario");
            } else {
                return null;
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return this;
    }

    public boolean guardarUsuario() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO usuario\n"
                + "(id_usuario, nombre, nombre_usuario, contrasenna, direccion)\n"
                + "VALUES("+ this.id_usuario +",'"+ this.nombre +"', '"+ this.nombre_usuario +"', '"+ this.contrasenna +"', '"+ this.direccion +"');";
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
    
    public void agregarAlCarro(int id) {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM ropa WHERE id_ropa="+ id +";";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Ropa r;
            while (rs.next()) {
                r = new Ropa();
                r.setId_ropa(rs.getInt("id_ropa"));
                r.setNombre(rs.getString("nombre"));
                r.setImagne(rs.getString("imagen"));
                r.setId_marca(rs.getInt("id_marca"));
                r.setId_talla(rs.getInt("id_talla"));
                r.setId_tipo(rs.getInt("id_tipo"));
                r.setPrecio(rs.getDouble("precio"));
                r.setDescripcion(rs.getString("descripcion"));
                r.setNumero_ventas(rs.getInt("numero_ventas"));
                Marca m = new Marca(r.getId_marca()).getMarca();
                r.setMarca(m);
                Tipo ti = new Tipo(r.getId_tipo()).getTipo();
                r.setTipo(ti);
                Talla ta = new Talla(r.getId_talla()).getTalla();
                r.setTalla(ta);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
    }
}
