<%@page import="java.util.List"%>
<%@page import="BusinessEntity.ModeloBE"%>
<%@page import="BusinessLogic.ModeloBL"%>
<%
    ModeloBL modeloBL = new ModeloBL();
    List<ModeloBE> listaModelos = modeloBL.listar();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Modelos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body>
<div class="container">
    <h1>Listado de Modelos</h1>
    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>Acciones</th>
            <th>ID Modelo</th>
            <th>ID Marca</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Año Lanzamiento</th>
            <th>Segmento</th>
        </tr>
        </thead>
        <tbody>
        <% for(ModeloBE modelo : listaModelos) { %>
        <tr>
            <td>
                <a href="Modelo.do?accion=delete&id=<%= modelo.getIdModelo() %>" class="btn btn-danger">
                    <i class="fa fa-trash"></i>
                </a>
                <a href="Modelo.do?accion=edit&id=<%= modelo.getIdModelo() %>" class="btn btn-primary">
                    <i class="fa fa-pencil"></i>
                </a>
            </td>
            <td><%= modelo.getIdModelo() %></td>
            <td><%= modelo.getIdMarca() %></td>
            <td><%= modelo.getNombre() %></td>
            <td><%= modelo.getDescripcion() %></td>
            <td><%= modelo.getAnoLanzamiento() %></td>
            <td><%= modelo.getSegmento() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>