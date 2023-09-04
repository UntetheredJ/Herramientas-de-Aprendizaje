<%-- 
    Document   : Compra
    Created on : 18/09/2022, 5:56:02 p. m.
    Author     : USUARIO
--%>

<%@page import="Logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <title>Agregar Ropa</title>
        <style>
        </style>
    </head>
    <body>
        <%
            Usuario u = (Usuario) session.getAttribute("usr");
            if (u != null) {
        %>
        <div style="display: none;">
            <label id="id_usuario"><%out.print(u.getid_Usuario());%></label>
        </div>
        <div class="container-fluid" ng-app="demoB1" ng-controller="b1Controller as b1" style="padding: 0">
            <header class="p-3 text-bg-dark" style="height: 8%; width: 100%;">
                <div class="container">
                    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                            <li><a href="BuscarRopa.jsp" class="nav-link px-2 text-white" >Catálogo</a></li>
                            <li><a href="Ropa.jsp" class="nav-link px-2 text-white">Agregar Ropa</a></li>
                            <li><a href="Compra.jsp" class="nav-link px-2 text-white">Historial Compras</a></li>
                        </ul>
                        <div class="text-end">
                            <button type="button" class="btn btn-outline-light me-2" ng-click="b1.cerrarSesion()">Cerrar Sesion</button>
                        </div>
                    </div>
                </div>
            </header>
            <div class="row" style="padding: 1%; width: 98%">
                <div class="col-6">
                    <h1>Historial Compras</h1>
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col"># Factura</th>
                                <th scope="col">Id Usuario</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Total</th>
                                <th scope="col">Prodcutos</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat=" c in b1.Compras">
                                <td>{{c.id_compra}}</td>
                                <td>{{c.id_usuario}}</td>
                                <td>{{c.fecha}}</td>
                                <td>{{c.total}}</td>
                                <td><button type="button" class="btn btn-success" ng-click="b1.listarPorId(c.id_compra)">Ver</button></td>
                            </tr>
                            </div>
                        </tbody>
                    </table>
                </div>
                <div class="col-6">
                    <h1>Productos de la Compra</h1>
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Id Compra</th>
                                <th scope="col">Ropa</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Cantidad</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat=" rc in b1.Ropas_compra">
                                <td>{{rc.id_compra}}</td>
                                <td>{{rc.ropa.nombre}}</td>
                                <td>{{rc.ropa.precio}}</td>
                                <td>{{rc.cantidad}}</td>
                            </tr>
                            </div>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            var app = angular.module('demoB1', []);
            app.controller('b1Controller', ['$http', controladorB1]);
            function controladorB1($http) {
                var b1 = this;
                b1.listar = function () {
                    var id_usuario = document.getElementById('id_usuario').innerHTML;
                    var parametros = {
                        proceso: 'listar',
                        id_usuario: id_usuario
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCompra.jsp',
                        params: parametros
                    }).then(function (res) {
                        b1.Compras = res.data.Compras;
                    });
                };
                window.onload = b1.listar;
                b1.cerrarSesion = function () {
                    var parametros = {
                        proceso: 'cerrarSesion'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuario.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            window.location.href = "index.html";
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
                b1.listarPorId = function (id) {
                    var parametros = {
                        proceso: 'listar',
                        id_compra: id
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesRopa_Compra.jsp',
                        params: parametros
                    }).then(function (res) {
                        b1.Ropas_compra = res.data.Ropas_compra;
                    });
                };
            }
            ;
        </script>
        <%} else {%>
    <center><a href="index.html">No se ha iniciado sesion o la sesión caducó, click acá para ingresar</a></center>
        <%}%>
</body>
</html>

