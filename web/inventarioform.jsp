<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= request.getParameter("accion").equalsIgnoreCase("edit") ? "Editar Registro" : "Nuevo Registro" %> - Inventario</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>
        <%= request.getParameter("accion").equalsIgnoreCase("edit") ? "Editar Registro de Inventario" : "Nuevo Registro de Inventario" %>
    </h1>
    <form action="Inventario.do" method="post">
        <input type="hidden" name="accion" value="<%= request.getParameter("accion").equalsIgnoreCase("edit") ? "actualizar" : "insertar" %>">
        <% if(request.getParameter("accion").equalsIgnoreCase("edit")) { %>
        <input type="hidden" name="idInventario" value="<%= request.getParameter("id") %>">
        <% } %>
        <div class="mb-3">
            <label class="form-label">ID Carro</label>
            <input type="number" name="idCarro" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Cantidad</label>
            <input type="number" name="cantidad" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Ubicación</label>
            <input type="text" name="ubicacion" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Notas</label>
            <textarea name="notas" class="form-control"></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>
</body>
</html>