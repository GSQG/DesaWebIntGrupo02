<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="BusinessEntity.PagoBE" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Pagos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Listado de Pagos</h1>
    <a href="pagoform.jsp?accion=insertar" class="btn btn-success mb-3">Nuevo Pago</a>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Acciones</th>
            <th>ID Pago</th>
            <th>ID Venta</th>
            <th>ID Método</th>
            <th>Monto</th>
            <th>Referencia de Pago</th>
            <th>Fecha de Pago</th>
            <th>Estado</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<PagoBE> listaPagos = (List<PagoBE>) request.getAttribute("listaPagos");
            if(listaPagos != null) {
                for(PagoBE p : listaPagos) {
        %>
        <tr>
            <td>
                <a href="Pago.do?accion=delete&id=<%= p.getIdPago() %>" class="btn btn-danger btn-sm">Eliminar</a>
                <a href="pagoform.jsp?accion=edit&id=<%= p.getIdPago() %>" class="btn btn-primary btn-sm">Editar</a>
            </td>
            <td><%= p.getIdPago() %></td>
            <td><%= p.getIdVenta() %></td>
            <td><%= p.getIdMetodo() %></td>
            <td><%= p.getMonto() %></td>
            <td><%= p.getReferenciaPago() %></td>
            <td><%= p.getFechaPago() != null ? p.getFechaPago() : "" %></td>
            <td><%= p.getEstado() %></td>
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