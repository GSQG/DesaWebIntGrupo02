<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="BusinessEntity.MarcaBE" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Marcas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="fondo-principal">
<div class="container">
    <h1>Listado de Marcas</h1>
    <a href="marcaform.jsp?accion=insertar" class="btn btn-success mb-3">Nueva Marca</a>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Acciones</th>
            <th>ID Marca</th>
            <th>Nombre</th>
            <th>País de Origen</th>
            <th>Sitio Web</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<MarcaBE> listaMarcas = (List<MarcaBE>) request.getAttribute("listaMarcas");
            if(listaMarcas != null) {
                for(MarcaBE marca : listaMarcas) {
        %>
        <tr>
            <td>
                <a href="Marca.do?accion=delete&id=<%= marca.getIdMarca() %>" class="btn btn-danger btn-sm">Eliminar</a>
                <a href="marcaform.jsp?accion=edit&id=<%= marca.getIdMarca() %>" class="btn btn-primary btn-sm">Editar</a>
            </td>
            <td><%= marca.getIdMarca() %></td>
            <td><%= marca.getNombre() %></td>
            <td><%= marca.getPaisOrigen() %></td>
            <td><%= marca.getSitioWeb() %></td>
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