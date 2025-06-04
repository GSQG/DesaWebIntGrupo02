<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String accion = request.getParameter("accion");
    if (accion == null) accion = "insertar";

    String idMetodo = request.getParameter("idMetodo") != null ? request.getParameter("idMetodo") : "";
    String nombre = request.getParameter("nombre") != null ? request.getParameter("nombre") : "";
    String descripcion = request.getParameter("descripcion") != null ? request.getParameter("descripcion") : "";
    String inflacionApplicable = request.getParameter("inflacionApplicable") != null ? "checked" : "";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= accion.equalsIgnoreCase("edit") ? "Editar" : "Nuevo" %> Método de Pago</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1><%= accion.equalsIgnoreCase("edit") ? "Editar" : "Nuevo" %> Método de Pago</h1>
    <form action="MetodoPago.do" method="post">
        <input type="hidden" name="accion" value="<%= accion.equalsIgnoreCase("edit") ? "actualizar" : "insertar" %>">
        <% if(accion.equalsIgnoreCase("edit")) { %>
        <input type="hidden" name="idMetodo" value="<%= idMetodo %>">
        <% } %>
        <div class="mb-3">
            <label class="form-label">Nombre</label>
            <input type="text" name="nombre" class="form-control" required value="<%= nombre %>">
            <% if(nombre.isEmpty()) { %>
                <small class="text-danger">Este campo es obligatorio</small>
            <% } %>
        </div>
        <div class="mb-3">
            <label class="form-label">Descripción</label>
            <input type="text" name="descripcion" class="form-control" value="<%= descripcion %>">
        </div>
        <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" name="inflacionApplicable" id="inflacionApplicable" <%= inflacionApplicable %>>
            <label class="form-check-label" for="inflacionApplicable">
                Inflación Aplicable
            </label>
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>
</body>
</html>