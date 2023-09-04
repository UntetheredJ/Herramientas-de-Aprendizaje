<%-- 
    Document   : CrearUsuario
    Created on : 16/09/2022, 7:40:12 p. m.
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <title>Crear Usuario</title>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <link rel="stylesheet" href="CSS/StyleCrearUsuario.css">
    </head>
    <body>
        <div id="div-principal" ng-app="demoB1" ng-controller="b1Controller as b1">
            <h1> Crear Usuario </h1>
            <div class="input-group mb-3">
                <span class="input-group-text">#</span>
                <input type="text" class="form-control" placeholder="Id" aria-label="Id" ng-model="b1.id_usuario" required>
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon2">Nombre</span>
                <input type="text" class="form-control" placeholder="Nombre" aria-label="Nombre" aria-describedby="basic-addon2" ng-model="b1.nombre_usuario">
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">@</span>
                <input type="email" class="form-control" placeholder="Correo" aria-label="Correo" aria-describedby="basic-addon1" ng-model="b1.nombre">
            </div><div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Direccion" aria-label="Direccion" aria-describedby="basic-addon1" ng-model="b1.direccion">
            </div>
            <div class="input-group mb-3">
                <span class="input-group-text" id="basic-addon1">*</span>
                <input type="text" class="form-control" placeholder="Contraseña" aria-label="Contraseña" aria-describedby="basic-addon1" ng-model=" b1.contrasenna">
            </div>
            <div class="Botton-crear">
                <button type="button" class="btn btn-primary" ng-click="b1.validar()">Terminar</button>
            </div>
        </div>
        <script>
            var app = angular.module('demoB1', []);
            app.controller('b1Controller', ['$http', controladorB1]);
            function controladorB1($http) {
                var b1 = this;
                guardar = function () {
                    var parametros = {
                        proceso: 'guardarUsuario',
                        id_usuario: b1.id_usuario,
                        nombre: b1.nombre,
                        nombre_usuario: b1.nombre_usuario,
                        contrasenna: b1.contrasenna,
                        direccion: b1.direccion
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesUsuario.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            if (res.data.guardarUsuario === true) {
                                alert('Guardó Correctamente');
                                window.location.href = "index.html";
                            } else {
                                alert('No Guardó');
                            }
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
                
                b1.validar = function () {
                    if (b1.id_usuario === undefined || b1.nombre === undefined || b1.nombre_usuario === undefined || b1.contrasenna === undefined || b1.direccion === undefined) {
                        alert('Llenar todos los campos');
                    } else {
                        guardar();
                    }
                };
            }
        </script>
    </body>
</html>
