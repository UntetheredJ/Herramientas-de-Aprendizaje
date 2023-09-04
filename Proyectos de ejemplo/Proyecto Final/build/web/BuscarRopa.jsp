<%-- 
    Document   : BuscarRopa
    Created on : 10/09/2022, 6:39:56 p. m.
    Author     : USUARIO
--%>

<%@page import="Logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catálogo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/StyleNavegacion.css">
        <link rel="stylesheet" href="CSS/StyleComprarRopa.css">
    </head>
    <body>
        <%
            Usuario u = (Usuario) session.getAttribute("usr");
            if (u != null) {
        %>
        <div ng-app="demoB1" ng-controller="b1Controller as b1">
            <header class="p-3 text-bg-dark" style="height: 8%;">
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
            <div id="Busqueda" style="height: 92.5%;">
                <div class="d-flex flex-column flex-shrink-0 p-0 text-bg-dark" style="width: 16%; display: flex; flex-direction: column">
                    <hr>
                    <ul class="nav nav-pills flex-column mb-auto">
                        <li>
                            <div class="BarraBusqueda">
                                <a class="nav-link text-white">
                                    <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                                    Quitar Filtro
                                </a>
                                <button style="margin-left: 5px" type="button" class="btn btn-primary" ng-click="b1.listar()">B</button>
                            </div>
                        </li>
                        <li>
                            <a class="nav-link text-white">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                                Nombre
                            </a>
                            <div class="BarraBusqueda">
                                <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-1" role="search" style="width: 80%">
                                    <input type="Buscar" class="form-control form-control-dark text-bg-dark" placeholder="Buscar..." aria-label="Buscar" ng-model="b1.nombre" >
                                </form>
                                <button style="margin-left: 5px" type="button" class="btn btn-primary" ng-click="b1.consultarPorNombre()">B</button>
                            </div>
                        </li>
                        <li>
                            <a class="nav-link text-white">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                                Marca
                            </a>
                            <div class="BarraBusqueda">
                                <select class="form-select" aria-label="Default select example" ng-model="b1.id_marca" style="width: 80%; margin-right: 8px">
                                    <option ng-repeat="m in b1.Marcas" value="{{m.id_marca}}">{{m.nombre}}</option>
                                </select>
                                <button type="button" class="btn btn-primary" ng-click="b1.consultarPorMarca()">B</button>
                            </div>
                        </li>
                        <li>
                            <a class="nav-link text-white">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                                Talla
                            </a>
                            <div class="BarraBusqueda">
                                <select class="form-select" aria-label="Default select example" ng-model="b1.id_talla" style="width: 80%; margin-right: 8px">
                                    <option ng-repeat="t in b1.Tallas" value="{{t.id_talla}}">{{t.nombre}}</option>
                                </select>
                                <button type="button" class="btn btn-primary" ng-click="b1.consultarPorTalla()">B</button>
                            </div>
                        </li>
                        <li>
                            <a class="nav-link text-white">
                                <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                                Tipo
                            </a>
                            <div class="BarraBusqueda">
                                <select class="form-select" aria-label="Default select example" ng-model="b1.id_tipo" style="width: 80%; margin-right: 8px;">
                                    <option ng-repeat="t in b1.Tipos" value="{{t.id_tipo}}">{{t.nombre}}</option>
                                </select>
                                <button type="button" class="btn btn-primary" ng-click="b1.consultarPorTipo()">B</button>
                            </div>
                        </li>
                        <li style="display: flex;">
                            <div>
                                <a class="nav-link text-white">
                                    <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                                    Precio Maximo
                                </a>
                                <div class="BarraBusqueda">
                                    <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-1" role="search" style="width: 100%">
                                        <input type="Buscar" class="form-control form-control-dark text-bg-dark" placeholder="Buscar..." aria-label="Buscar" ng-model="b1.precioMax">
                                    </form>
                                </div>
                                <a class="nav-link text-white">
                                    <svg class="bi pe-none me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
                                    Precio Minimo
                                </a>
                                <div class="BarraBusqueda">
                                    <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-1" role="search" style="width: 100%">
                                        <input type="Buscar" class="form-control form-control-dark text-bg-dark" placeholder="Buscar..." aria-label="Buscar" ng-model="b1.precioMin">
                                    </form>
                                </div>
                            </div>
                            <button style="margin: auto; height: 25%;"
                                    type="button" class="btn btn-primary" ng-click="b1.consultarPorPrecio()">B</button>
                        </li>
                    </ul>
                    <hr>
                </div>
                <div class="div-ropas" style="overflow-y: scroll">
                    <div class="card" ng-repeat=" r in b1.Ropas">
                        <img class="card-img-top" src="{{r.imagen}}" alt="Imagen Ropa">
                        <div class="card-body">
                            <h5 class="card-title">{{r.nombre}} {{r.tipo.nombre}}</h5>
                            <p class="card-text" > <b>Marca:</b> {{r.marca.nombre}}</p>
                            <p class="card-text" ><b>Talla:</b> {{r.talla.nombre}}</p>
                            <div style="display: flex;">
                                <a href="#" class="btn btn-primary" style="margin-right: 28%" ng-click="b1.comprar(r.id_ropa)">Comprar</a>
                                <p class="card-text">$ {{r.precio}}</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-flex flex-column flex-shrink-0 p-0 text-bg-dark" style="height: auto; overflow-y: scroll">
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th scope="col">Producto</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="c in b1.compras">
                                <th><img class="imagenCarrito" style="width: 50px; height: 50px"src="{{c.imagen}}"></th>
                                <td style="text-align: center">{{c.precio}}</td>
                                <td style="text-align: center">{{c.cantidad}}</td>
                                <td><button type="button" class="btn btn-danger" ng-click="b1.borrar(c.id_ropa)">x</button></td>
                        </tbody>
                    </table>
                    <div style="display: flex">
                        <p style="padding: 10px 25px;">Total</p>
                        <p style="padding: 10px 25px;">{{b1.total}}</p>
                    </div>
                    <button id="abrir" style="margin: 10px" type="button" class="btn btn-primary" ng-click="b1.FinalizaCompra()">Comprar</button>
                </div>
            </div>
            <div style="display: none;">
                <label id="id_usuario"><%out.print(u.getid_Usuario());%></label>
                <label id="nombre"><%out.print(u.getNombre());%></label>
                <label id="direccion"><%out.print(u.getDireccion());%></label>
            </div>
        </div>
        <script>
            var app = angular.module('demoB1', []);
            app.controller('b1Controller', ['$http', controladorB1]);
            function controladorB1($http) {
                var b1 = this;
                let comprasRealizadas = [];
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
                b1.consultarPorNombre = function () {
                    var parametros = {
                        proceso: 'consultarPorNombre',
                        nombre: b1.nombre
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesRopa.jsp',
                        params: parametros
                    }).then(function (res) {
                        b1.Ropas = res.data.Ropas;
                    });
                };
                b1.consultarPorPrecio = function () {
                    var parametros = {
                        proceso: 'consultarPorPrecio',
                        precioMax: b1.precioMax,
                        precioMin: b1.precioMin
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesRopa.jsp',
                        params: parametros
                    }).then(function (res) {
                        b1.Ropas = res.data.Ropas;
                    });
                };
                b1.consultarPorMarca = function () {
                    var parametros = {
                        proceso: 'consultarPorMarca',
                        id_marca: b1.id_marca
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesRopa.jsp',
                        params: parametros
                    }).then(function (res) {
                        b1.Ropas = res.data.Ropas;
                    });
                };
                b1.consultarPorTalla = function () {
                    var parametros = {
                        proceso: 'consultarPorTalla',
                        id_talla: b1.id_talla
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesRopa.jsp',
                        params: parametros
                    }).then(function (res) {
                        b1.Ropas = res.data.Ropas;
                    });
                };
                b1.consultarPorTipo = function () {
                    var parametros = {
                        proceso: 'consultarPorTipo',
                        id_tipo: b1.id_tipo
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesRopa.jsp',
                        params: parametros
                    }).then(function (res) {
                        b1.Ropas = res.data.Ropas;
                    });
                };
                b1.comprar = function (id) {
                    var parametros = {
                        proceso: 'comprar',
                        id: id
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuario.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.Ropa.id_marca !== 0) {
                            ropa = res.data.Ropa;
                            var existe = false;
                            if (comprasRealizadas.length === 0) {
                                ropa['cantidad'] = 1;
                                comprasRealizadas.push(ropa);
                            } else {
                                for (j = 0; j < comprasRealizadas.length; j++) {
                                    if (comprasRealizadas[j].id_ropa === ropa.id_ropa) {
                                        comprasRealizadas[j].cantidad = comprasRealizadas[j].cantidad + 1;
                                        existe = true;
                                    }
                                }
                                if (existe === false) {
                                    ropa['cantidad'] = 1;
                                    comprasRealizadas.push(ropa);
                                }
                            }
                            var total = 0;
                            for (i = 0; i < comprasRealizadas.length; i++) {
                                total = total + (comprasRealizadas[i].cantidad * comprasRealizadas[i].precio);
                            }
                            b1.total = total;
                        }
                        ;
                    });
                    b1.listarCompras();
                };
                b1.FinalizaCompra = function () {
                    var id_usuario = document.getElementById('id_usuario').innerHTML;
                    var direccion = document.getElementById('direccion').innerHTML;
                    var nombre = document.getElementById('nombre').innerHTML;
                    var today = new Date();
                    today = today.toDateString();
                    if (b1.total === undefined || b1.total === 0) {
                        alert("No hay productos");
                    } else {
                        var totalFinal = b1.total;
                        alert("El pedido se ha realizado a la direccion " + direccion + " a nombre de " + nombre + " por un total de " + totalFinal);
                        var id_compra = generarGuid(10);
                        relizarCompra(id_compra, id_usuario, today, totalFinal);
                        for (i = 0; i < comprasRealizadas.length; i++) {
                            guardar(id_compra, comprasRealizadas[i].id_ropa, comprasRealizadas[i].cantidad);
                        }
                        comprasRealizadas = [];
                        b1.listarCompras();
                        b1.total = 0;
                    }
                };
                b1.listarCompras = function () {
                    b1.compras = comprasRealizadas;
                };
                b1.borrar = function (id) {
                    for (j = 0; j < comprasRealizadas.length; j++) {
                        if (comprasRealizadas[j].id_ropa === id) {
                            comprasRealizadas.splice(j, 1);
                        }
                    }
                    var total = 0;
                    for (i = 0; i < comprasRealizadas.length; i++) {
                        total = total + (comprasRealizadas[i].cantidad * comprasRealizadas[i].precio);
                    }
                    b1.total = total;
                };
                relizarCompra = function (id_compra, id_usuario, fecha, totalFinal) {
                    var parametros = {
                        proceso: 'guardar',
                        id_compra: id_compra,
                        id_usuario: id_usuario,
                        fecha: fecha,
                        total: totalFinal
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesCompra.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data.guardar === true) {
                                console.log("Correcto");
                            } else {
                                console.log("Error");
                            }
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
                function generarGuid(longitud) {
                    const ALFABETO = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
                    let resultado = [];

                    for (let i = 0; i < longitud; i++) {
                        resultado.push(ALFABETO.charAt(Math.floor(Math.random() * ALFABETO.length)));
                    }

                    return resultado.join('');
                };
                guardar = function (id_compra, id_ropa, cantidad) {
                    var parametros = {
                        proceso: 'guardar',
                        id_compra: id_compra,
                        id_ropa: id_ropa,
                        cantidad: cantidad
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesRopa_Compra.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data.guardar === true) {
                                console.log("Correcto");
                            } else {
                                console.log("Error");
                            }
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
                window.onload = b1.listar;
            }
            ;
        </script>
        <%} else {%>
    <center><a href="index.html">No se ha iniciado sesion o la sesión caducó, click acá para ingresar</a></center>
        <%}%>
</body>
</html>