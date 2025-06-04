<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String accion = request.getParameter("accion");
    if (accion == null) accion = "insertar";

    String idInventario = request.getParameter("idInventario") != null ? request.getParameter("idInventario") : "";
    String idCarro = request.getParameter("idCarro") != null ? request.getParameter("idCarro") : "";
    String cantidad = request.getParameter("cantidad") != null ? request.getParameter("cantidad") : "";
    String ubicacion = request.getParameter("ubicacion") != null ? request.getParameter("ubicacion") : "";
    String notas = request.getParameter("notas") != null ? request.getParameter("notas") : "";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= accion.equalsIgnoreCase("edit") ? "Editar Registro" : "Nuevo Registro" %> - Inventario</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1><%= accion.equalsIgnoreCase("edit") ? "Editar Registro de Inventario" : "Nuevo Registro de Inventario" %></h1>
    <form action="Inventario.do" method="post">
        <input type="hidden" name="accion" value="<%= accion.equalsIgnoreCase("edit") ? "actualizar" : "insertar" %>">
        <% if(accion.equalsIgnoreCase("edit")) { %>
        <input type="hidden" name="idInventario" value="<%= idInventario %>">
        <% } %>
        <div class="mb-3">
            <label class="form-label">ID Carro</label>
            <input type="number" name="idCarro" class="form-control" required value="<%= idCarro %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Cantidad</label>
            <input type="number" name="cantidad" class="form-control" required value="<%= cantidad %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Ubicación</label>
            <input type="text" name="ubicacion" class="form-control" value="<%= ubicacion %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Notas</label>
            <textarea name="notas" class="form-control"><%= notas %></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>
</body>
</html>