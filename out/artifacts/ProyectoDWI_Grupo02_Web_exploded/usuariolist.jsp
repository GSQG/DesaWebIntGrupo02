<%@page import="java.util.List"%>
<%@page import="BusinessEntity.UsuarioBE"%>
<%@page import="BusinessLogic.UsuarioBL"%>
<%
    UsuarioBL usuarioBL = new UsuarioBL();
    List<UsuarioBE> listaUsuarios = usuarioBL.listar();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body>
<div class="container">
    <h1>Listado de Usuarios</h1>
    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>Acciones</th>
            <th>ID Usuario</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>Email</th>
            <th>Celular</th>
            <th>Rol</th>
        </tr>
        </thead>
        <tbody>
        <% for(UsuarioBE usuario : listaUsuarios) { %>
        <tr>
            <td>
                <a href="Usuario.do?accion=delete&id=<%= usuario.getIdUsuario() %>" class="btn btn-danger">
                    <i class="fa fa-trash"></i>
                </a>
                <a href="Usuario.do?accion=edit&id=<%= usuario.getIdUsuario() %>" class="btn btn-primary">
                    <i class="fa fa-pencil"></i>
                </a>
            </td>
            <td><%= usuario.getIdUsuario() %></td>
            <td><%= usuario.getNombres() %></td>
            <td><%= usuario.getApellidos() %></td>
            <td><%= usuario.getEmail() %></td>
            <td><%= usuario.getCelular() %></td>
            <td><%= usuario.getRol() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>