<%-- 
    Document   : peticionesCompra
    Created on : 18/09/2022, 5:10:20 p. m.
    Author     : USUARIO
--%>

<%@page import="Logica.Compra"%>
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
        "guardar",
        "listar"
    });

    String proceso = "" + request.getParameter("proceso");
    if (tareas.contains(proceso)) {
        respuesta += "\"ok\": true,";

        if (proceso.equals("guardar")) {
            String id_compra = request.getParameter("id_compra");
            String id_usuario = request.getParameter("id_usuario");
            String fecha = request.getParameter("fecha");
            String total = request.getParameter("total");
            Compra c = new Compra(id_compra, Integer.parseInt(id_usuario), fecha, Integer.parseInt(total));
            if (c.guardarCompra()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        } else if (proceso.equals("listar")) {
            String id_usuario = request.getParameter("id_usuario");
            try {
                List<Compra> lista = new Compra().listarCompras(Integer.parseInt(id_usuario));
                respuesta += "\"" + proceso + "\": true,\"Compras\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Compras\":[]";
                Logger.getLogger(Compra.class.getName()).log(Level.SEVERE, null, ex);
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