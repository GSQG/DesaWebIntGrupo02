<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String accion = request.getParameter("accion");
    if(accion == null || accion.trim().isEmpty()){
        accion = "nuevo";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= accion.equalsIgnoreCase("edit") ? "Editar Carro" : "Nuevo Carro" %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1><%= accion.equalsIgnoreCase("edit") ? "Editar Carro" : "Nuevo Carro" %></h1>
    <form action="Carro.do" method="post">
        <input type="hidden" name="accion" value="<%= accion.equalsIgnoreCase("edit") ? "actualizar" : "insertar" %>">
        <% if(accion.equalsIgnoreCase("edit")) { %>
            <input type="hidden" name="idCarro" value="<%= request.getParameter("id") %>">
        <% } %>
        <div class="mb-3">
            <label class="form-label">ID Modelo</label>
            <input type="number" name="idModelo" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Nombre</label>
            <input type="text" name="nombre" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Color</label>
            <input type="text" name="color" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Precio</label>
            <input type="text" name="precio" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Descripción</label>
            <textarea name="descripcion" class="form-control"></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
    </form>
</div>
</body>
</html>