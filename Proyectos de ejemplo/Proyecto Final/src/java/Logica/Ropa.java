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
public class Ropa implements InterfaceRopa {
    
    private int id_ropa;
    private String nombre;
    private String imagen;
    private Marca marca;
    private int id_marca;
    private Talla talla;
    private int id_talla;
    private Tipo tipo;
    private int id_tipo;
    private double precio;
    private String descripcion;
    private int numero_ventas;

    public Ropa(int id_ropa, String nombre, String imagne, int id_marca, int id_talla, int id_tipo, double precio, String descripcion, int numero_ventas) {
        this.id_ropa = id_ropa;
        this.nombre = nombre;
        this.imagen = imagne;
        this.id_marca = id_marca;
        this.id_talla = id_talla;
        this.id_tipo = id_tipo;
        this.precio = precio;
        this.descripcion = descripcion;
        this.numero_ventas = numero_ventas;
    }

    public Ropa() {
    }

    public Ropa(int id_ropa) {
        this.id_ropa = id_ropa;
    }

    public String getImagne() {
        return imagen;
    }

    public void setImagne(String imagne) {
        this.imagen = imagne;
    }
    
    public int getId_ropa() {
        return id_ropa;
    }

    public void setId_ropa(int id_ropa) {
        this.id_ropa = id_ropa;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }

    public int getId_talla() {
        return id_talla;
    }

    public void setId_talla(int id_talla) {
        this.id_talla = id_talla;
    }

    public int getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(int id_tipo) {
        this.id_tipo = id_tipo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getNumero_ventas() {
        return numero_ventas;
    }

    public void setNumero_ventas(int numero_ventas) {
        this.numero_ventas = numero_ventas;
    }

    public Marca getMarca() {
        return marca;
    }

    public void setMarca(Marca marca) {
        this.marca = marca;
    }

    public Talla getTalla() {
        return talla;
    }

    public void setTalla(Talla talla) {
        this.talla = talla;
    }

    public Tipo getTipo() {
        return tipo;
    }

    public void setTipo(Tipo tipo) {
        this.tipo = tipo;
    }
    
    @Override
    public Ropa getRopa() {
        String sql = "SELECT * FROM ropa WHERE id_ropa="+this.id_ropa+";";
        ConexionBD conexion = new ConexionBD();
        
        try {
            ResultSet rs = conexion.consultarBD(sql);
            if (rs.next()) {
                this.id_ropa = rs.getInt("id_ropa");
                this.nombre = rs.getString("nombre");
                this.imagen = rs.getString("imagen");
                this.id_marca = rs.getInt("id_marca");
                this.id_talla = rs.getInt("id_talla");
                this.id_tipo = rs.getInt("id_tipo");
                this.precio = rs.getDouble("precio");
                this.descripcion = rs.getString("descripcion");
                this.numero_ventas = rs.getInt("numero_ventas");
            }
        } catch (SQLException ex) {
        } finally {
            conexion.cerrarConexion();
        }
        return this;
    }
    
    @Override
    public String toString() {
        return "Ropa{" + "id_ropa" + id_ropa + "nombre" + nombre + "imagen" + imagen + "id_marca" + id_marca + "id_talla" + id_talla + "id_tipo" + id_tipo + "precio" + precio + "descripcion" + descripcion + "numero_ventas" + numero_ventas +"}";
    }
    
    @Override
    public List<Ropa> listarRopa() {
        List<Ropa> listaRopa = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM ropa;";
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
                listaRopa.add(r);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaRopa;
    }
    
    @Override
    public boolean guardarRopa() {
        boolean exito = false;
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO ropa\n"
                + "(id_ropa, nombre, imagen, id_marca, id_talla, id_tipo, precio, descripcion, numero_ventas)\n"
                + "VALUES(" + this.id_ropa + ",'" + this.nombre + "','" + this.imagen + "'," + this.id_marca + "," + this.id_talla + "," + this.id_tipo + "," + this.precio + ""
                + ",'" + this.descripcion + "'," + this.numero_ventas + ");";
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
    public boolean actualizarRopa() {
        boolean exito = false;
        String sql = "UPDATE ropa SET nombre='" + this.nombre + "',imagen='" + this.imagen
                + "',id_marca=" + this.id_marca + ",id_talla=" + this.id_talla + ",id_tipo=" + this.id_tipo
                + ",precio=" + this.precio + ",descripcion='" + this.descripcion + "',numero_ventas=" + this.numero_ventas + " "
                + "WHERE id_ropa=" + this.id_ropa + ";";
        ConexionBD conexion = new ConexionBD();
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
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
    public boolean eliminarRopa() {
        boolean exito = false;
        String sql = "DELETE FROM ropa\n"
                + "WHERE id_ropa=" + this.id_ropa + ";";
        ConexionBD conexion = new ConexionBD();
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
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
    
    public List<Ropa> consultarPorNombre(String nombre) {
        List<Ropa> listaRopa = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from ropa where nombre like '%" + nombre + "%';";
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
                listaRopa.add(r);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaRopa;
    }
    
    public List<Ropa> consultarPorPrecio(int precioMin, int precioMax) {
        List<Ropa> listaRopa = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from ropa where precio >= " + precioMin + " and precio <= " + precioMax + ";";
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
                listaRopa.add(r);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaRopa;
    }
    
    public List<Ropa> consultarPorMarca(int id_marca) {
        List<Ropa> listaRopa = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from ropa where id_marca = " + id_marca + ";";
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
                listaRopa.add(r);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaRopa;
    }
    
    public List<Ropa> consultarPorTalla(int id_talla) {
        List<Ropa> listaRopa = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from ropa where id_talla = " + id_talla + ";";
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
                listaRopa.add(r);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaRopa;
    }
    
    public List<Ropa> consultarPorTipo(int id_tipo) {
        List<Ropa> listaRopa = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "select * from ropa where id_tipo = " + id_tipo + ";";
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
                listaRopa.add(r);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listaRopa;
    }
    
}
