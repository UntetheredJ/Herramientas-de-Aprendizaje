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
        "ejemplo"
    });

    String proceso = "" + request.getParameter("proceso");
    
    if (tareas.contains(proceso)){
        respuesta += "\"ok\": true,";
        
        if (proceso.equals("ejemplo")) {
             respuesta += "\"" + proceso + "\": true";
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