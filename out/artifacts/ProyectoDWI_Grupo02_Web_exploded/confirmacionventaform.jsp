<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String accion = request.getParameter("accion");
    if (accion == null) accion = "insertar";

    String idConfirmacion = request.getParameter("idConfirmacion") != null ? request.getParameter("idConfirmacion") : "";
    String idVenta = request.getParameter("idVenta") != null ? request.getParameter("idVenta") : "";
    String fechaConfirmacion = request.getParameter("fechaConfirmacion") != null ? request.getParameter("fechaConfirmacion") : "";
    String estado = request.getParameter("estado") != null ? request.getParameter("estado") : "";
    String observaciones = request.getParameter("observaciones") != null ? request.getParameter("observaciones") : "";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= accion.equalsIgnoreCase("edit") ? "Editar" : "Nueva" %> Confirmación de Venta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1><%= accion.equalsIgnoreCase("edit") ? "Editar" : "Nueva" %> Confirmación de Venta</h1>
    <form action="ConfirmacionVenta.do" method="post">
        <input type="hidden" name="accion" value="<%= accion.equalsIgnoreCase("edit") ? "actualizar" : "insertar" %>">
        <% if (accion.equalsIgnoreCase("edit")) { %>
        <input type="hidden" name="idConfirmacion" value="<%= idConfirmacion %>">
        <% } %>
        <div class="mb-3">
            <label class="form-label">ID Venta</label>
            <input type="number" name="idVenta" class="form-control" required value="<%= idVenta %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Fecha Confirmación (yyyy-MM-dd HH:mm:ss)</label>
            <input type="text" name="fechaConfirmacion" class="form-control" value="<%= fechaConfirmacion %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Estado</label>
            <select name="estado" class="form-control">
                <option value="PENDIENTE" <%= "PENDIENTE".equals(estado) ? "selected" : "" %>>PENDIENTE</option>
                <option value="CONFIRMADA" <%= "CONFIRMADA".equals(estado) ? "selected" : "" %>>CONFIRMADA</option>
                <option value="CANCELADA" <%= "CANCELADA".equals(estado) ? "selected" : "" %>>CANCELADA</option>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Observaciones</label>
            <textarea name="observaciones" class="form-control"><%= observaciones %></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>
</body>
</html>