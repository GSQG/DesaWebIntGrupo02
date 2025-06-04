<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="BusinessEntity.ConfirmacionVentaBE" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Confirmaciones de Venta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Listado de Confirmaciones de Venta</h1>
    <a href="confirmacionventaform.jsp?accion=insertar" class="btn btn-success mb-3">Nueva Confirmación</a>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Acciones</th>
            <th>ID Confirmación</th>
            <th>ID Venta</th>
            <th>Fecha Confirmación</th>
            <th>Estado</th>
            <th>Observaciones</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<ConfirmacionVentaBE> listaConf = (List<ConfirmacionVentaBE>) request.getAttribute("listaConfirmaciones");

            if (listaConf == null || listaConf.isEmpty()) {
        %>
            <tr>
                <td colspan="6" class="text-center text-warning">No hay confirmaciones registradas</td>
            </tr>
        <%
            } else {
                for (ConfirmacionVentaBE c : listaConf) {
        %>
            <tr>
                <td>
                    <a href="ConfirmacionVenta.do?accion=delete&id=<%=c.getIdConfirmacion()%>" class="btn btn-danger btn-sm">Eliminar</a>
                    <a href="confirmacionventaform.jsp?accion=edit&id=<%=c.getIdConfirmacion()%>" class="btn btn-primary btn-sm">Editar</a>
                </td>
                <td><%= c.getIdConfirmacion() %></td>
                <td><%= c.getIdVenta() %></td>
                <td><%= c.getFechaConfirmacion() != null ? c.getFechaConfirmacion() : "No disponible" %></td>
                <td><%= c.getEstado() %></td>
                <td><%= c.getObservaciones() %></td>
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