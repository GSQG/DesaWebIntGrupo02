<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="BusinessEntity.ClienteBE" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Listado de Clientes</h1>
    <a href="clienteform.jsp?accion=insertar" class="btn btn-success mb-3">Nuevo Cliente</a>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Acciones</th>
            <th>ID</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>Email</th>
            <th>Celular</th>
            <th>Dirección</th>
            <th>Preferencia de Contacto</th>
            <th>Observaciones</th>
            <th>Fecha Registro</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<ClienteBE> listaClientes = (List<ClienteBE>) request.getAttribute("listaClientes");
            if(listaClientes != null) {
                for(ClienteBE cli : listaClientes) {
        %>
        <tr>
            <td>
                <a href="Cliente.do?accion=delete&id=<%= cli.getIdCliente() %>" class="btn btn-danger btn-sm">Eliminar</a>
                <a href="clienteform.jsp?accion=edit&id=<%= cli.getIdCliente() %>" class="btn btn-primary btn-sm">Editar</a>
            </td>
            <td><%= cli.getIdCliente() %></td>
            <td><%= cli.getNombres() %></td>
            <td><%= cli.getApellidos() %></td>
            <td><%= cli.getEmail() %></td>
            <td><%= cli.getCelular() %></td>
            <td><%= cli.getDireccion() %></td>
            <td><%= cli.getPreferenciaContacto() %></td>
            <td><%= cli.getObservaciones() %></td>
            <td><%= cli.getFechaRegistro() != null ? cli.getFechaRegistro() : "" %></td>
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