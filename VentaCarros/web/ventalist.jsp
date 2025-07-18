<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List, BusinessEntity.VentaBE, BusinessLogic.VentaBL, BusinessEntity.VentaRepuestoBE, BusinessLogic.VentaRepuestoBL" %>
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
        .badge-carro { background-color: #0d6efd; }
        .badge-repuesto { background-color: #198754; }
    </style>
</head>
<body class="fondo-principal">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Deluxe Drive</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                 <li class="nav-item"><a class="nav-link" href="carrolist.jsp">Carros</a></li>
                 <li class="nav-item"><a class="nav-link" href="ventalist.jsp">Ventas</a></li>
                 <li class="nav-item"><a class="nav-link" href="usuariolist.jsp">Usuarios</a></li>
                 <li class="nav-item"><a class="nav-link" href="sedelist.jsp">Sedes</a></li>
                 <li class="nav-item"><a class="nav-link" href="comprarrepuesto.jsp">Comprar Repuestos</a></li>
                 <li class="nav-item"><a class="nav-link" href="repuestolist.jsp">Listado de Repuestos</a></li>
                 <li class="nav-item"><a class="nav-link" href="respuestasRapidas.jsp">Atencion al cliente</a></li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <span class="navbar-text text-light me-2">Hola, <%= usuarioLogueado %></span>
                </li>
                <li class="nav-item">
                    <a class="btn btn-outline-light" href="<%= request.getContextPath() %>/LogoutServlet">
                        Cerrar sesión
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h1 class="text-center mb-4">Listado de Ventas</h1>

    <ul class="nav nav-tabs mb-4" id="ventasTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="carros-tab" data-bs-toggle="tab" data-bs-target="#carros" type="button" role="tab">Ventas de Carros</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link" id="repuestos-tab" data-bs-toggle="tab" data-bs-target="#repuestos" type="button" role="tab">Ventas de Repuestos</button>
        </li>
    </ul>

    <div class="tab-content" id="ventasTabContent">
        <div class="tab-pane fade show active" id="carros" role="tabpanel">
            <table class="table table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID Venta</th>
                        <th>Fecha</th>
                        <th>Cliente</th>
                        <th>Modelo</th>
                        <th>Precio</th>
                        <th>Medio de Pago</th>
                        <th>Tipo</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        VentaBL ventaBL = new VentaBL();
                        List<VentaBE> ventasCarros = ventaBL.listar();

                        if (ventasCarros.isEmpty()) {
                    %>
                        <tr>
                            <td colspan="7" class="text-center text-danger">No hay ventas de carros registradas</td>
                        </tr>
                    <%
                        } else {
                            for (VentaBE venta : ventasCarros) {
                    %>
                        <tr>
                            <td><%= venta.getIdVenta() %></td>
                            <td><%= venta.getFechaVenta() %></td>
                            <td><%= venta.getNombreCliente() %></td>
                            <td><%= venta.getModeloCarro() %></td>
                            <td>S/. <%= venta.getPrecioVenta() %></td>
                            <td><%= venta.getMedioPago() %></td>
                            <td><span class="badge badge-carro">Carro</span></td>
                        </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>

        <div class="tab-pane fade" id="repuestos" role="tabpanel">
            <table class="table table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID Venta</th>
                        <th>Fecha</th>
                        <th>Cliente</th>
                        <th>Repuesto</th>
                        <th>Cantidad</th>
                        <th>Precio Total</th>
                        <th>Medio de Pago</th>
                        <th>Tipo</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        VentaRepuestoBL ventaRepuestoBL = new VentaRepuestoBL();
                        List<VentaRepuestoBE> ventasRepuestos = ventaRepuestoBL.listar();

                        if (ventasRepuestos.isEmpty()) {
                    %>
                        <tr>
                            <td colspan="8" class="text-center text-danger">No hay ventas de repuestos registradas</td>
                        </tr>
                    <%
                        } else {
                            for (VentaRepuestoBE venta : ventasRepuestos) {
                    %>
                        <tr>
                            <td><%= venta.getIdVenta() %></td>
                            <td><%= venta.getFechaVenta() %></td>
                            <td><%= venta.getNombreCliente() %></td>
                            <td><%= venta.getNombreRepuesto() %> (<%= venta.getMarcaRepuesto() %>)</td>
                            <td><%= venta.getCantidad() %></td>
                            <td>S/. <%= venta.getPrecioVenta() %></td>
                            <td><%= venta.getMedioPago() %></td>
                            <td><span class="badge bg-success">Repuesto</span></td>
                        </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>