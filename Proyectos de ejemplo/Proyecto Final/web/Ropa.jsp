<%-- 
    Document   : ropa
    Created on : 10/09/2022, 8:13:27 p. m.
    Author     : USUARIO
--%>

<%@page import="Logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Talla</th>
                                <th scope="col">Marca</th>
                                <th scope="col">Tipo</th>
                                <th scope="col">precio</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat=" r in b1.Ropas">
                                <td>{{r.id_ropa}}</td>
                                <td>{{r.nombre}}</td>
                                <td>{{r.talla.nombre}}</td>
                                <td>{{r.marca.nombre}}</td>
                                <td>{{r.tipo.nombre}}</td>
                                <td>{{r.precio}}</td>
                            </tr>
                            </div>
                        </tbody>
                    </table>
                </div>
                <div class="col-6">
                    <h3>Agregar</h3>
                    <div class="row">
                        <div class="col-6"> 
                            <label>Id ropa</label>
                            <input type="text" class="form-control" placeholder="id_ropa" ng-model="b1.id_ropa">
                        </div>
                        <div class="col-6">
                            <label>nombre</label>
                            <input type="text" class="form-control" placeholder="nombre" ng-model="b1.nombre">

                        </div>
                        <div class="col-6">
                            <label>Imagen</label>
                            <input type="text" class="form-control" placeholder="imagen" ng-model="b1.imagen">
                        </div>
                        <div class="col-6"><label>Id marca</label>
                            <select class="form-control" ng-model="b1.id_marca"> 
                                <option ng-repeat="m in b1.Marcas" value="{{m.id_marca}}">{{m.nombre}}</option>
                            </select>
                        </div>
                        <div class="col-6"><label>Id talla</label>
                            <select class="form-control" ng-model="b1.id_talla"> 
                                <option ng-repeat="t in b1.Tallas" value="{{t.id_talla}}">{{t.nombre}}</option>
                            </select>
                        </div>
                        <div class="col-6"><label>Descripcion</label>
                            <input type="text" class="form-control" placeholder="descripcion" ng-model="b1.descripcion" >
                        </div>
                        <div class="col-6"><label>Id tipo</label>
                            <select class="form-control" ng-model="b1.id_tipo"> 
                                <option ng-repeat="t in b1.Tipos" value="{{t.id_tipo}}">{{t.nombre}}</option>
                            </select>
                        </div>
                        <div class="col-6"><label>Numero ventas</label>
                            <input type="text" class="form-control" placeholder="numero_ventas" ng-model="b1.numero_ventas" >
                        </div>
                        <div class="col-6"><label>Precio</label>
                            <input type="text" class="form-control" placeholder="Precio" ng-model="b1.precio" >
                        </div>
                        <div class="row" style="margin-top: 2%;">
                            <div class="col-3"><button type="button" class="btn btn-outline-success" ng-click="b1.guardar()">Guardar</button></div>
                            <div class="col-3"><button type="button" class="btn btn-outline-primary" ng-click="b1.listar()">Consultar</button></div>
                            <div class="col-3"><button type="button" class="btn btn-outline-warning" ng-click="b1.actualizar()">Actualizar</button></div>
                            <div class="col-3"><button type="button" class="btn btn-outline-danger" ng-click="b1.eliminar()">Eliminar</button></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var app = angular.module('demoB1', []);
            app.controller('b1Controller', ['$http', controladorB1]);
            function controladorB1($http) {
                var b1 = this;
                consultarTalla = function () {
                    var parametros = {proceso: 'listar'};
                    $http({
                        method: 'POST',
                        url: 'PeticionesTalla.jsp',
                        params: parametros
                    }).then(function (res) {
                        b1.Tallas = res.data.Tallas;
                    });
                };
                consultarTalla();
                consultarMarca = function () {
                    var parametros = {proceso: 'listar'};
                    $http({
                        method: 'POST',
                        url: 'PeticionesMarca.jsp',
                        params: parametros
                    }).then(function (res) {
                        b1.Marcas = res.data.Marcas;
                    });
                };
                consultarMarca();
                consultarTipo = function () {
                    var parametros = {proceso: 'listar'};
                    $http({
                        method: 'POST',
                        url: 'peticionesTipo.jsp',
                        params: parametros
                    }).then(function (res) {
                        b1.Tipos = res.data.Tipos;
                    });
                };
                consultarTipo();
                b1.listar = function () {
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesRopa.jsp',
                        params: parametros
                    }).then(function (res) {
                        b1.Ropas = res.data.Ropas;
                    });
                };
                b1.guardar = function () {
                    var parametros = {
                        proceso: 'guardar',
                        id_ropa: b1.id_ropa,
                        nombre: b1.nombre,
                        imagen: b1.imagen,
                        id_marca: b1.id_marca,
                        id_talla: b1.id_talla,
                        id_tipo: b1.id_tipo,
                        precio: b1.precio,
                        descripcion: b1.descripcion,
                        numero_ventas: b1.numero_ventas
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesRopa.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data.guardar === true) {
                                alert('Guardó');
                            } else {
                                alert('No Guardó');
                            }
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
                b1.actualizar = function () {
                    var parametros = {
                        proceso: 'actualizar',
                        id_ropa: b1.id_ropa,
                        nombre: b1.nombre,
                        imagen: b1.imagen,
                        id_marca: b1.id_marca,
                        id_talla: b1.id_talla,
                        id_tipo: b1.id_tipo,
                        precio: b1.precio,
                        descripcion: b1.descripcion,
                        numero_ventas: b1.numero_ventas
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesRopa.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data.actualizar === true) {
                                alert('Actualizó');
                            } else {
                                alert('No actualizo');
                            }

                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
                b1.eliminar = function () {
                    var parametros = {
                        proceso: 'eliminar',
                        id_ropa: b1.id_ropa

                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesRopa.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data.eliminar === true) {
                                alert('Elimino');
                            } else {
                                alert('No elimino');
                            }

                        } else {
                            alert(res.data.errorMsg);
                        }
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
            }
            ;
        </script>
        <%} else {%>
    <center><a href="index.html">No se ha iniciado sesion o la sesión caducó, click acá para ingresar</a></center>
        <%}%>
</body>
</html>
