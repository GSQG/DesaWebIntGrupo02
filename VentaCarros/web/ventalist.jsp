<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List, BusinessEntity.VentaBE, BusinessLogic.VentaBL" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Ventas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
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
        .table th, .table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <!-- ... (igual que en carrolist.jsp) ... -->
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
                    <th>Medio Pago</th>
                </tr>
            </thead>
            <tbody>
                <%
                VentaBL ventaBL = new VentaBL();
                List<VentaBE> ventas = ventaBL.listar();

                if (ventas.isEmpty()) {
                %>
                    <tr>
                        <td colspan="6" class="text-center">No hay ventas registradas</td>
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