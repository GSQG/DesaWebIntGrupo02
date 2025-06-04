<%@page import="java.util.List"%>
<%@page import="BusinessEntity.VentaBE"%>
<%@page import="BusinessLogic.VentaBL"%>
<%
    VentaBL ventaBL = new VentaBL();
    List<VentaBE> listaVentas = ventaBL.listar();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Listado de Ventas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .container {
                max-width: 900px;
                margin-top: 50px;
                background: #ffffff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            }
            .table {
                border-radius: 8px;
                overflow: hidden;
            }
            .btn {
                margin-right: 5px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="text-center">Listado de Ventas</h1>
            <a href="Venta.do?accion=insertar" class="btn btn-success mb-3">Nueva Venta</a>
            <table class="table table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Acciones</th>
                        <th>ID Venta</th>
                        <th>ID Cliente</th>
                        <th>ID Usuario</th>
                        <th>Fecha Venta</th>
                        <th>Total</th>
                        <th>Estado</th>
                        <th>Medio Venta</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (listaVentas == null || listaVentas.isEmpty()) {
                    %>
                    <tr>
                        <td colspan="8" class="text-center text-warning">No hay ventas registradas</td>
                    </tr>
                    <%
                        } else {
                            for (VentaBE venta : listaVentas) {
                    %>
                    <tr>
                        <td>
                            <a href="Venta.do?accion=delete&id=<%=venta.getIdVenta()%>" class="btn btn-danger btn-sm">
                                <i class="fa fa-trash"></i>
                            </a>
                            <a href="Venta.do?accion=edit&id=<%=venta.getIdVenta()%>" class="btn btn-primary btn-sm">
                                <i class="fa fa-pencil"></i>
                            </a>
                        </td>
                        <td><%=venta.getIdVenta()%></td>
                        <td><%=venta.getIdCliente()%></td>
                        <td><%=venta.getIdUsuario()%></td>
                        <td><%=venta.getFechaVenta()%></td>
                        <td><%=venta.getTotal()%></td>
                        <td><%=venta.getEstado()%></td>
                        <td><%=venta.getMedioVenta()%></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>