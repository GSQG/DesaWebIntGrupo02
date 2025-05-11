<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String accion = request.getParameter("accion");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= accion.equalsIgnoreCase("edit") ? "Editar" : "Nuevo" %> Detalle de Venta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1><%= accion.equalsIgnoreCase("edit") ? "Editar" : "Nuevo" %> Detalle de Venta</h1>
    <form action="DetalleVenta.do" method="post">
        <input type="hidden" name="accion" value="<%= accion.equalsIgnoreCase("edit") ? "actualizar" : "insertar" %>">
        <% if(accion.equalsIgnoreCase("edit")) { %>
        <input type="hidden" name="idDetalle" value="<%= request.getParameter("id") %>">
        <% } %>
        <div class="mb-3">
            <label class="form-label">ID Venta</label>
            <input type="number" name="idVenta" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">ID Carro</label>
            <input type="number" name="idCarro" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Precio Unitario</label>
            <input type="text" name="precioUnitario" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Cantidad</label>
            <input type="number" name="cantidad" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Comentario</label>
            <input type="text" name="comentarioLinea" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Talla</label>
            <input type="text" name="talla" class="form-control">
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>
</body>
</html>