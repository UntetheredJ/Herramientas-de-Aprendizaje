<%-- 
    Document   : peticionesRopa_Compra
    Created on : 18/09/2022, 6:28:01 p. m.
    Author     : USUARIO
--%>

<%@page import="Logica.Ropa_compra"%>
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
            String id_ropa = request.getParameter("id_ropa");
            String cantidad = request.getParameter("cantidad");
            Ropa_compra c = new Ropa_compra(id_compra, Integer.parseInt(id_ropa), Integer.parseInt(cantidad));
            if (c.guardarCantidadCompra()) {
                respuesta += "\"" + proceso + "\": true";
            } else {
                respuesta += "\"" + proceso + "\": false";
            }
        } else if (proceso.equals("listar")) {
            String id_compra = request.getParameter("id_compra");
            try {
                List<Ropa_compra> lista = new Ropa_compra().listarComprasPorId(id_compra);
                respuesta += "\"" + proceso + "\": true,\"Ropas_compra\":" + new Gson().toJson(lista);
            } catch (Exception ex) {
                respuesta += "\"" + proceso + "\": true,\"Ropas_compra\":[]";
                Logger.getLogger(Ropa_compra.class.getName()).log(Level.SEVERE, null, ex);
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
