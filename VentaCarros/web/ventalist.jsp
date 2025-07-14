<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List, BusinessEntity.VentaBE, BusinessLogic.VentaBL" %>
<%
    String usuarioLogueado = (String) session.getAttribute("usuarioLogueado");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Ventas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <style>
        body { background-color: #f8f9fa; }
        .container {
            max-width: 1200px;
            margin-top: 50px;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .navbar { margin-bottom: 20px; }
        .table th, .table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Deluxe Drive</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="carrolist.jsp">Carros</a></li>
                <li class="nav-item"><a class="nav-link active" href="ventalist.jsp">Ventas</a></li>
                <li class="nav-item"><a class="nav-link" href="usuariolist.jsp">Usuarios</a></li>
                <li class="nav-item"><a class="nav-link" href="sedelist.jsp">Sedes</a></li>
                <li class="nav-item"><a class="nav-link" href="comprarrepuesto.jsp">Comprar Repuestos</a></li>
                <li class="nav-item"><a class="nav-link" href="repuestolist.jsp">Listado de Repuestos</a></li>
                <li class="nav-item"><a class="nav-link" href="respuestasRapidas.jsp">Atención al cliente</a></li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <span class="navbar-text text-light me-2">Hola, <%= usuarioLogueado %></span>
                </li>
                <li class="nav-item">
                    <a class="btn btn-outline-light" href="<%= request.getContextPath() %>/LogoutServlet">Cerrar sesión</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h1 class="text-center mb-4">Listado de Ventas</h1>

    <table class="table table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID Venta</th>
                <th>Fecha</th>
                <th>Cliente</th>
                <th>Modelo</th>
                <th>Precio</th>
                <th>Medio de Pago</th>
            </tr>
        </thead>
        <tbody>
            <%
                VentaBL ventaBL = new VentaBL();
                List<VentaBE> ventas = ventaBL.listar();

                if (ventas.isEmpty()) {
            %>
                <tr>
                    <td colspan="6" class="text-center text-danger">No hay ventas registradas</td>
                </tr>
            <%
                } else {
                    for (VentaBE venta : ventas) {
            %>
                <tr>
                    <td><%= venta.getIdVenta() %></td>
                    <td><%= venta.getFechaVenta() %></td>
                    <td><%= venta.getNombreCliente() %></td>
                    <td><%= venta.getModeloCarro() %></td>
                    <td>S/. <%= venta.getPrecioVenta() %></td>
                    <td><%= venta.getMedioPago() %></td>
                </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
