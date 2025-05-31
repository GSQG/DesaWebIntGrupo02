<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="BusinessEntity.ClienteBE" %>
<%
    String accion = request.getParameter("accion");
    // Para edición, podrías obtener el cliente consultando el id (por ejemplo, a través de un BL)
    // En este ejemplo, se dejan los campos vacíos para simplificar.
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= accion.equalsIgnoreCase("edit") ? "Editar" : "Nuevo" %> Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1><%= accion.equalsIgnoreCase("edit") ? "Editar" : "Nuevo" %> Cliente</h1>
    <form action="Cliente.do" method="post">
        <input type="hidden" name="accion" value="<%= accion.equalsIgnoreCase("edit") ? "actualizar" : "insertar" %>">
        <%
            if(accion.equalsIgnoreCase("edit")){
        %>
        <input type="hidden" name="idCliente" value="<%= request.getParameter("id") %>">
        <%
            }
        %>
        <div class="mb-3">
            <label class="form-label">Nombres</label>
            <input type="text" name="nombres" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Apellidos</label>
            <input type="text" name="apellidos" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Celular</label>
            <input type="text" name="celular" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Dirección</label>
            <input type="text" name="direccion" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Preferencia de Contacto</label>
            <select name="preferenciaContacto" class="form-control">
                <option value="EMAIL">EMAIL</option>
                <option value="CELULAR">CELULAR</option>
                <option value="NINGUNO">NINGUNO</option>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Observaciones</label>
            <textarea name="observaciones" class="form-control"></textarea>
        </div>
        <button class="btn btn-primary" type="submit">Guardar</button>
    </form>
</div>
</body>
</html>