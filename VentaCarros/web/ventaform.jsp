<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String accion = request.getParameter("accion");
    if (accion == null) accion = "insertar";

    String idVenta = request.getParameter("idVenta") != null ? request.getParameter("idVenta") : "";
    String idCliente = request.getParameter("idCliente") != null ? request.getParameter("idCliente") : "";
    String idUsuario = request.getParameter("idUsuario") != null ? request.getParameter("idUsuario") : "";
    String fechaVenta = request.getParameter("fechaVenta") != null ? request.getParameter("fechaVenta") : "";
    String total = request.getParameter("total") != null ? request.getParameter("total") : "";
    String estado = request.getParameter("estado") != null ? request.getParameter("estado") : "";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= accion.equalsIgnoreCase("edit") ? "Editar Venta" : "Nueva Venta" %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            margin-top: 50px;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            width: 100%;
        }
    </style>
</head>
<body class="fondo-principal">
<div class="container">
    <h1 class="text-center"><%= accion.equalsIgnoreCase("edit") ? "Editar Venta" : "Nueva Venta" %></h1>
    <form action="Venta.do" method="post">
        <input type="hidden" name="accion" value="<%= accion.equalsIgnoreCase("edit") ? "actualizar" : "insertar" %>">
        <% if(accion.equalsIgnoreCase("edit")) { %>
        <input type="hidden" name="idVenta" value="<%= idVenta %>">
        <% } %>
        <div class="mb-3">
            <label class="form-label">ID Cliente</label>
            <input type="number" name="idCliente" class="form-control" required value="<%= idCliente %>">
            <% if(idCliente.isEmpty()) { %>
                <small class="text-danger">Este campo es obligatorio</small>
            <% } %>
        </div>
        <div class="mb-3">
            <label class="form-label">ID Usuario</label>
            <input type="number" name="idUsuario" class="form-control" required value="<%= idUsuario %>">
            <% if(idUsuario.isEmpty()) { %>
                <small class="text-danger">Este campo es obligatorio</small>
            <% } %>
        </div>
        <div class="mb-3">
            <label class="form-label">Fecha de Venta (yyyy-MM-dd HH:mm:ss)</label>
            <input type="text" name="fechaVenta" class="form-control" value="<%= fechaVenta %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Total</label>
            <input type="text" name="total" class="form-control" required value="<%= total %>">
            <% if(total.isEmpty()) { %>
                <small class="text-danger">Este campo es obligatorio</small>
            <% } %>
        </div>
        <div class="mb-3">
            <label class="form-label">Estado</label>
            <select name="estado" class="form-control">
                <option value="PENDIENTE" <%= "PENDIENTE".equals(estado) ? "selected" : "" %>>PENDIENTE</option>
                <option value="COMPLETADA" <%= "COMPLETADA".equals(estado) ? "selected" : "" %>>COMPLETADA</option>
                <option value="CANCELADA" <%= "CANCELADA".equals(estado) ? "selected" : "" %>>CANCELADA</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>
</body>
</html>