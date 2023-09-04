<%-- 
    Document   : peticionesUsuarios
    Created on : 16/09/2022, 7:10:38 p. m.
    Author     : USUARIO
--%>

<%@page import="Logica.Ropa"%>
<%@page import="Logica.Usuario"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.google.gson.Gson"%> <%--Libreria para convertir objetos java a formato JSON--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/json;charset=iso-8859-1" language="java" pageEncoding="iso-8859-1" session="true"%>

<%
    String respuesta = "{";

    List<String> tareas = Arrays.asList(new String[]{
        "iniciarSesion",
        "cerrarSesion",
        "guardarUsuario",
        "comprar",
        "carrito"
    });

    String proceso = "" + request.getParameter("proceso");
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";

        if (proceso.equals("iniciarSesion")) {
            String nombre_usuario = request.getParameter("nombre_usuario");
            String contrasenna = request.getParameter("contrasenna");
            Usuario u = new Usuario(nombre_usuario, contrasenna).validarUsuario();
            if (u != null) {
                session.setAttribute("usr", u);
                respuesta += "\"" + proceso + "\": true";
            } else {
                session.invalidate();
                respuesta += "\"" + proceso + "\": false";
            }

        } else if (proceso.equals("cerrarSesion")) {
            session.invalidate();
            respuesta += "\"" + proceso + "\": true";

        } else if (proceso.equals("guardarUsuario")) {
            String id_usuario = request.getParameter("id_usuario");
            String nombre = request.getParameter("nombre");
            String nombre_usuario = request.getParameter("nombre_usuario");
            String contrasenna = request.getParameter("contrasenna");
            String direccion = request.getParameter("direccion");
            Usuario r = new Usuario(Integer.parseInt(id_usuario), nombre, nombre_usuario, contrasenna, direccion);
            if (r.guardarUsuario()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        } else if (proceso.equals("cerrarSesion")) {
            session.invalidate();
            respuesta += "\"" + proceso + "\": true";
        } else if (proceso.equals("comprar")) {
            String id = request.getParameter("id");
            Ropa r = null;
            try {
                r = new Ropa(Integer.parseInt(id)).getRopa();
                respuesta += "\"" + proceso + "\": true,\"Ropa\":" + new Gson().toJson(r);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": false,\"Ropa\":" + new Gson().toJson(r);
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