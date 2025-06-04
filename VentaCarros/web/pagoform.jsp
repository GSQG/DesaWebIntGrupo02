<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String accion = request.getParameter("accion");
    if (accion == null) accion = "insertar";

    String idPago = request.getParameter("idPago") != null ? request.getParameter("idPago") : "";
    String idVenta = request.getParameter("idVenta") != null ? request.getParameter("idVenta") : "";
    String idMetodo = request.getParameter("idMetodo") != null ? request.getParameter("idMetodo") : "";
    String monto = request.getParameter("monto") != null ? request.getParameter("monto") : "";
    String referenciaPago = request.getParameter("referenciaPago") != null ? request.getParameter("referenciaPago") : "";
    String estado = request.getParameter("estado") != null ? request.getParameter("estado") : "";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= accion.equalsIgnoreCase("edit") ? "Editar" : "Nuevo" %> Pago</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1><%= accion.equalsIgnoreCase("edit") ? "Editar" : "Nuevo" %> Pago</h1>
    <form action="Pago.do" method="post">
        <input type="hidden" name="accion" value="<%= accion.equalsIgnoreCase("edit") ? "actualizar" : "insertar" %>">
        <% if(accion.equalsIgnoreCase("edit")) { %>
        <input type="hidden" name="idPago" value="<%= idPago %>">
        <% } %>
        <div class="mb-3">
            <label class="form-label">ID Venta</label>
            <input type="number" name="idVenta" class="form-control" required value="<%= idVenta %>">
            <% if(idVenta.isEmpty()) { %>
                <small class="text-danger">Este campo es obligatorio</small>
            <% } %>
        </div>
        <div class="mb-3">
            <label class="form-label">ID Método de Pago</label>
            <input type="number" name="idMetodo" class="form-control" required value="<%= idMetodo %>">
            <% if(idMetodo.isEmpty()) { %>
                <small class="text-danger">Este campo es obligatorio</small>
            <% } %>
        </div>
        <div class="mb-3">
            <label class="form-label">Monto</label>
            <input type="text" name="monto" class="form-control" required value="<%= monto %>">
            <% if(monto.isEmpty()) { %>
                <small class="text-danger">Este campo es obligatorio</small>
            <% } %>
        </div>
        <div class="mb-3">
            <label class="form-label">Referencia de Pago</label>
            <input type="text" name="referenciaPago" class="form-control" value="<%= referenciaPago %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Estado</label>
            <select name="estado" class="form-control">
                <option value="PENDIENTE" <%= "PENDIENTE".equals(estado) ? "selected" : "" %>>PENDIENTE</option>
                <option value="COMPLETADO" <%= "COMPLETADO".equals(estado) ? "selected" : "" %>>COMPLETADO</option>
                <option value="RECHAZADO" <%= "RECHAZADO".equals(estado) ? "selected" : "" %>>RECHAZADO</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>
</body>
</html>