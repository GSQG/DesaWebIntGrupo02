<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String accion = request.getParameter("accion");
    if (accion == null) accion = "insertar";

    String idMarca = request.getParameter("idMarca") != null ? request.getParameter("idMarca") : "";
    String nombre = request.getParameter("nombre") != null ? request.getParameter("nombre") : "";
    String paisOrigen = request.getParameter("paisOrigen") != null ? request.getParameter("paisOrigen") : "";
    String sitioWeb = request.getParameter("sitioWeb") != null ? request.getParameter("sitioWeb") : "";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= accion.equalsIgnoreCase("edit") ? "Editar" : "Nueva" %> Marca</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="fondo-principal">
<div class="container">
    <h1><%= accion.equalsIgnoreCase("edit") ? "Editar" : "Nueva" %> Marca</h1>
    <form action="Marca.do" method="post">
        <input type="hidden" name="accion" value="<%= accion.equalsIgnoreCase("edit") ? "actualizar" : "insertar" %>">
        <% if(accion.equalsIgnoreCase("edit")) { %>
        <input type="hidden" name="idMarca" value="<%= idMarca %>">
        <% } %>
        <div class="mb-3">
            <label class="form-label">Nombre</label>
            <input type="text" name="nombre" class="form-control" required value="<%= nombre %>">
        </div>
        <div class="mb-3">
            <label class="form-label">País de Origen</label>
            <input type="text" name="paisOrigen" class="form-control" value="<%= paisOrigen %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Sitio Web</label>
            <input type="text" name="sitioWeb" class="form-control" value="<%= sitioWeb %>">
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>
</body>
</html>