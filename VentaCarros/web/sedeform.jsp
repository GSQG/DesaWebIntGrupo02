<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String accion = request.getParameter("accion");
    if (accion == null || accion.trim().isEmpty()) {
        accion = "nuevo";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= accion.equalsIgnoreCase("edit") ? "Editar Sede" : "Nueva Sede" %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="fondo-principal">
<div class="container">
    <h1><%= accion.equalsIgnoreCase("edit") ? "Editar Sede" : "Nueva Sede" %></h1>
    <form action="Sede.do" method="post">
        <input type="hidden" name="accion" value="<%= accion.equalsIgnoreCase("edit") ? "actualizar" : "insertar" %>">

        <% if(accion.equalsIgnoreCase("edit")) {
            String idSede = request.getParameter("id");
            if (idSede != null && !idSede.trim().isEmpty()) { %>
                <input type="hidden" name="idSede" value="<%= idSede %>">
            <% } else { %>
                <p class="text-danger">ID de la sede no especificado.</p>
            <% }
        } %>

        <div class="mb-3">
            <label class="form-label">Nombre</label>
            <input type="text" name="nombre" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Dirección</label>
            <input type="text" name="direccion" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Teléfono</label>
            <input type="text" name="telefono" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Horario</label>
            <input type="text" name="horario" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Ciudad</label>
            <input type="text" name="ciudad" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Estado</label>
            <input type="text" name="estado" class="form-control">
        </div>

        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>
</body>
</html>