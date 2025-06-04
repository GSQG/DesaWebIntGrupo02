<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String accion = request.getParameter("accion");
    if (accion == null) accion = "insertar";

    String idUsuario = request.getParameter("idUsuario") != null ? request.getParameter("idUsuario") : "";
    String username = request.getParameter("username") != null ? request.getParameter("username") : "";
    String password = request.getParameter("password") != null ? request.getParameter("password") : "";
    String nombres = request.getParameter("nombres") != null ? request.getParameter("nombres") : "";
    String apellidos = request.getParameter("apellidos") != null ? request.getParameter("apellidos") : "";
    String email = request.getParameter("email") != null ? request.getParameter("email") : "";
    String rol = request.getParameter("rol") != null ? request.getParameter("rol") : "";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= accion.equalsIgnoreCase("edit") ? "Editar Usuario" : "Nuevo Usuario" %></title>
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
<body>
<div class="container">
    <h1 class="text-center"><%= accion.equalsIgnoreCase("edit") ? "Editar Usuario" : "Nuevo Usuario" %></h1>
    <form action="Usuario.do" method="post">
        <input type="hidden" name="accion" value="<%= accion.equalsIgnoreCase("edit") ? "actualizar" : "insertar" %>">
        <% if(accion.equalsIgnoreCase("edit")) { %>
        <input type="hidden" name="idUsuario" value="<%= idUsuario %>">
        <% } %>
        <div class="mb-3">
            <label class="form-label">Nombre de Usuario</label>
            <input type="text" name="username" class="form-control" required value="<%= username %>">
            <% if(username.isEmpty()) { %>
                <small class="text-danger">Este campo es obligatorio</small>
            <% } %>
        </div>
        <div class="mb-3">
            <label class="form-label">Contraseña</label>
            <input type="password" name="password" class="form-control" required value="<%= password %>">
            <% if(password.isEmpty()) { %>
                <small class="text-danger">Este campo es obligatorio</small>
            <% } %>
        </div>
        <div class="mb-3">
            <label class="form-label">Nombres</label>
            <input type="text" name="nombres" class="form-control" value="<%= nombres %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Apellidos</label>
            <input type="text" name="apellidos" class="form-control" value="<%= apellidos %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" value="<%= email %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Rol</label>
            <select name="rol" class="form-control">
                <option value="ADMIN" <%= "ADMIN".equals(rol) ? "selected" : "" %>>ADMIN</option>
                <option value="VENTAS" <%= "VENTAS".equals(rol) ? "selected" : "" %>>VENTAS</option>
                <option value="LOGISTICA" <%= "LOGISTICA".equals(rol) ? "selected" : "" %>>LOGÍSTICA</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>
</body>
</html>