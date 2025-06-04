<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="BusinessEntity.InventarioBE" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Inventario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Listado de Inventario</h1>
    <a href="inventarioform.jsp?accion=insertar" class="btn btn-success mb-3">Nuevo Inventario</a>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Acciones</th>
            <th>ID Inventario</th>
            <th>ID Carro</th>
            <th>Cantidad</th>
            <th>Ubicación</th>
            <th>Notas</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<InventarioBE> listaInventario = (List<InventarioBE>) request.getAttribute("listaInventario");
            if(listaInventario == null || listaInventario.isEmpty()) {
        %>
            <tr>
                <td colspan="6" class="text-center text-warning">No hay registros de inventario</td>
            </tr>
        <%
            } else {
                for(InventarioBE i : listaInventario) {
        %>
            <tr>
                <td>
                    <a href="Inventario.do?accion=delete&id=<%= i.getIdInventario() %>" class="btn btn-danger btn-sm">Eliminar</a>
                    <a href="inventarioform.jsp?accion=edit&id=<%= i.getIdInventario() %>" class="btn btn-primary btn-sm">Editar</a>
                </td>
                <td><%= i.getIdInventario() %></td>
                <td><%= i.getIdCarro() %></td>
                <td><%= i.getCantidad() %></td>
                <td><%= i.getUbicacion() %></td>
                <td><%= i.getNotas() %></td>
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