<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="BusinessEntity.RepuestosBE" %>
<%@ page import="BusinessLogic.RepuestosBL" %>
<%
    RepuestosBL repuestosBL = new RepuestosBL();
    List<RepuestosBE> listaRepuestos = repuestosBL.listar();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Repuestos Disponibles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 1000px;
            margin-top: 50px;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .navbar {
            margin-bottom: 20px;
        }
        .card {
            margin-bottom: 20px;
        }
        .btn-comprar {
            width: 100%;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Repuestos</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="carrolist.jsp">Carros</a></li>
                <li class="nav-item"><a class="nav-link" href="clientelist.jsp">Clientes</a></li>
                <li class="nav-item"><a class="nav-link" href="inventariolist.jsp">Inventario</a></li>
                <li class="nav-item"><a class="nav-link" href="ventalist.jsp">Ventas</a></li>
                <li class="nav-item"><a class="nav-link" href="usuariolist.jsp">Usuarios</a></li>
                <li class="nav-item"><a class="nav-link" href="sedelist.jsp">Sedes</a></li>
                <li class="nav-item"><a class="nav-link active" href="repuestolist.jsp">Repuestos</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h1 class="text-center">Listado de Repuestos</h1>
    <div class="row">
        <%
            if (listaRepuestos == null || listaRepuestos.isEmpty()) {
        %>
        <p class="text-center text-warning">No hay repuestos disponibles en este momento.</p>
        <%
            } else {
                for (RepuestosBE repuesto : listaRepuestos) {
        %>
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-body">
                    <i class="fa fa-cogs fa-3x mb-3"></i>
                    <h5 class="card-title"><%= repuesto.getNombre() %></h5>
                    <p class="card-text">Marca: <%= repuesto.getMarca() %></p>
                    <p class="card-text">Modelo Compatible: <%= repuesto.getCompatibilidad() %></p>
                    <p class="card-text">Precio: S/. <%= repuesto.getCosto() %></p>
                    <p class="card-text">Stock: <%= repuesto.getStock() %> unidades</p>
                    <a href="procesarCompraRepuesto.jsp?id=<%= repuesto.getIdRepuesto() %>" class="btn btn-success btn-comprar">Comprar</a>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
