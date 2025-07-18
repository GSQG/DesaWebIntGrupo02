<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String accion = request.getParameter("accion");
    if (accion == null) accion = "insertar";

    String idModelo = request.getParameter("idModelo") != null ? request.getParameter("idModelo") : "";
    String nombre = request.getParameter("nombre") != null ? request.getParameter("nombre") : "";
    String anio = request.getParameter("anio") != null ? request.getParameter("anio") : "";
    String descripcion = request.getParameter("descripcion") != null ? request.getParameter("descripcion") : "";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= accion.equalsIgnoreCase("edit") ? "Editar Modelo" : "Nuevo Modelo" %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="fondo-principal">
<div class="container">
    <h1><%= accion.equalsIgnoreCase("edit") ? "Editar Modelo" : "Nuevo Modelo" %></h1>
    <form action="Modelo.do" method="post">
        <input type="hidden" name="accion" value="<%= accion.equalsIgnoreCase("edit") ? "actualizar" : "insertar" %>">
        <% if(accion.equalsIgnoreCase("edit")) { %>
        <input type="hidden" name="idModelo" value="<%= idModelo %>">
        <% } %>
        <div class="mb-3">
            <label class="form-label">Nombre del Modelo</label>
            <input type="text" name="nombre" class="form-control" required value="<%= nombre %>">
            <% if(nombre.isEmpty()) { %>
                <small class="text-danger">Este campo es obligatorio</small>
            <% } %>
        </div>
        <div class="mb-3">
            <label class="form-label">Año</label>
            <input type="number" name="anio" class="form-control" value="<%= anio %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Descripción</label>
            <input type="text" name="descripcion" class="form-control" value="<%= descripcion %>">
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>
</body>
</html>