<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String accion = request.getParameter("accion");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= accion.equalsIgnoreCase("edit") ? "Editar Venta" : "Nueva Venta" %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1><%= accion.equalsIgnoreCase("edit") ? "Editar Venta" : "Nueva Venta" %></h1>
    <form action="Venta.do" method="post">
        <input type="hidden" name="accion" value="<%= accion.equalsIgnoreCase("edit") ? "actualizar" : "insertar" %>">
        <% if(accion.equalsIgnoreCase("edit")) { %>
        <input type="hidden" name="idVenta" value="<%= request.getParameter("id") %>">
        <% } %>
        <div class="mb-3">
            <label class="form-label">ID Cliente</label>
            <input type="number" name="idCliente" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">ID Usuario</label>
            <input type="number" name="idUsuario" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Fecha de Venta (yyyy-MM-dd HH:mm:ss)</label>
            <input type="text" name="fechaVenta" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Total</label>
            <input type="text" name="total" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Estado</label>
            <select name="estado" class="form-control">
                <option value="PENDIENTE">PENDIENTE</option>
                <option value="COMPLETADA">COMPLETADA</option>
                <option value="CANCELADA">CANCELADA</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>
</body>
</html>