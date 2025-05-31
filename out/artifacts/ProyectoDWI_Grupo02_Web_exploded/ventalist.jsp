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
    </head>
    <body>
        <div class="container">
            <h1>Listado de Ventas</h1>
            <table class="table table-striped table-hover">
                <thead>
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
                    <% for(VentaBE venta : listaVentas) { %>
                    <tr>
                        <td>
                            <a href="Venta.do?accion=delete&id=<%=venta.getIdVenta()%>" class="btn btn-danger">
                                <i class="fa fa-trash"></i>
                            </a>
                            <a href="Venta.do?accion=edit&id=<%=venta.getIdVenta()%>" class="btn btn-primary">
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
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>