<%-- 
    Document   : peticionesRopa
    Created on : 10/09/2022, 5:54:19 p. m.
    Author     : Daniel Perez
--%>

<%@page import="Logica.Ropa"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%
    String respuesta = "{";

    List<String> tareas = Arrays.asList(new String[]{
        "guardar",
        "eliminar",
        "actualizar",
        "listar",
        "consultarPorNombre",
        "consultarPorPrecio",
        "consultarPorMarca",
        "consultarPorTalla",
        "consultarPorTipo"
    });

    String proceso = "" + request.getParameter("proceso");

    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";
        if (proceso.equals("guardar")) {
            String id_ropa = request.getParameter("id_ropa");
            String nombre = request.getParameter("nombre");
            String imagen = request.getParameter("imagen");
            String id_marca = request.getParameter("id_marca");
            String id_talla = request.getParameter("id_talla");
            String id_tipo = request.getParameter("id_tipo");
            String precio = request.getParameter("precio");
            String descripcion = request.getParameter("descripcion");
            String numero_ventas = request.getParameter("numero_ventas");
            Ropa r = new Ropa(Integer.parseInt(id_ropa), nombre, imagen, Integer.parseInt(id_marca), Integer.parseInt(id_talla), Integer.parseInt(id_tipo), Double.parseDouble(precio), descripcion, Integer.parseInt(numero_ventas));
            if (r.guardarRopa()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        } else if (proceso.equals("eliminar")) {
            String id_ropa = request.getParameter("id_ropa");
            Ropa r = new Ropa(Integer.parseInt(id_ropa));

            if (r.eliminarRopa()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        } else if (proceso.equals("actualizar")) {
            String id_ropa = request.getParameter("id_ropa");
            String nombre = request.getParameter("nombre");
            String imagen = request.getParameter("imagen");
            String id_marca = request.getParameter("id_marca");
            String id_talla = request.getParameter("id_talla");
            String id_tipo = request.getParameter("id_tipo");
            String precio = request.getParameter("precio");
            String descripcion = request.getParameter("descripcion");
            String numero_ventas = request.getParameter("numero_ventas");
            Ropa r = new Ropa(Integer.parseInt(id_ropa), nombre, imagen, Integer.parseInt(id_marca), Integer.parseInt(id_talla), Integer.parseInt(id_tipo), Double.parseDouble(precio), descripcion, Integer.parseInt(numero_ventas));

            if (r.actualizarRopa()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        }  else if (proceso.equals("listar")) {
            try {
                List<Ropa> lista = new Ropa().listarRopa();
                respuesta += "\"" + proceso + "\": true,\"Ropas\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Ropas\":[]";
                Logger.getLogger(Ropa.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultarPorNombre")) {
            try {
                String nombre = request.getParameter("nombre");
                List<Ropa> lista = new Ropa().consultarPorNombre(nombre);
                respuesta += "\"" + proceso + "\": true,\"Ropas\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Ropas\":[]";
                Logger.getLogger(Ropa.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultarPorMarca")) {
            try {
                String id_marca = request.getParameter("id_marca");
                List<Ropa> lista = new Ropa().consultarPorMarca(Integer.parseInt(id_marca));
                respuesta += "\"" + proceso + "\": true,\"Ropas\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Ropas\":[]";
                Logger.getLogger(Ropa.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultarPorPrecio")) {
            try {
                String precioMin = request.getParameter("precioMin");
                String precioMax = request.getParameter("precioMax");
                List<Ropa> lista = new Ropa().consultarPorPrecio(Integer.parseInt(precioMin), Integer.parseInt(precioMax));
                respuesta += "\"" + proceso + "\": true,\"Ropas\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Ropas\":[]";
                Logger.getLogger(Ropa.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultarPorTalla")) {
            try {
                String id_talla = request.getParameter("id_talla");
                List<Ropa> lista = new Ropa().consultarPorTalla(Integer.parseInt(id_talla));
                respuesta += "\"" + proceso + "\": true,\"Ropas\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Ropas\":[]";
                Logger.getLogger(Ropa.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (proceso.equals("consultarPorTipo")) {
            try {
                String id_tipo = request.getParameter("id_tipo");
                List<Ropa> lista = new Ropa().consultarPorTipo(Integer.parseInt(id_tipo));
                respuesta += "\"" + proceso + "\": true,\"Ropas\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Ropas\":[]";
                Logger.getLogger(Ropa.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    } else {
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
    }
    respuesta += "}";
    response.setContentType("application/json;charset=iso-8859-1");
    out.print(respuesta);
%>