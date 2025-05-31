<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="BusinessEntity.MetodoPagoBE" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Métodos de Pago</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Listado de Métodos de Pago</h1>
    <a href="metodopagoform.jsp?accion=insertar" class="btn btn-success mb-3">Nuevo Método de Pago</a>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Acciones</th>
            <th>ID</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Inflación Aplicable</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<MetodoPagoBE> lista = (List<MetodoPagoBE>) request.getAttribute("listaMetodoPago");
            if(lista != null){
                for(MetodoPagoBE mp : lista){
        %>
        <tr>
            <td>
                <a href="MetodoPago.do?accion=delete&id=<%= mp.getIdMetodo() %>" class="btn btn-danger btn-sm">Eliminar</a>
                <a href="metodopagoform.jsp?accion=edit&id=<%= mp.getIdMetodo() %>" class="btn btn-primary btn-sm">Editar</a>
            </td>
            <td><%= mp.getIdMetodo() %></td>
            <td><%= mp.getNombre() %></td>
            <td><%= mp.getDescripcion() %></td>
            <td><%= mp.isInflacionApplicable() ? "Sí" : "No" %></td>
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