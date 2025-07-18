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
    <title><%= accion.equalsIgnoreCase("edit") ? "Editar Repuesto" : "Nuevo Repuesto" %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="fondo-principal">
<div class="container mt-4">
    <h1 class="mb-4"><%= accion.equalsIgnoreCase("edit") ? "Editar Repuesto" : "Nuevo Repuesto" %></h1>
    <form action="Repuestos.do" method="post">
        <input type="hidden" name="accion" value="<%= accion %>">
        <input type="hidden" name="idRepuesto" value="<%= request.getParameter("id") != null ? request.getParameter("id") : "" %>">
        <div class="mb-3">
            <label>Nombre:</label>
            <input type="text" name="nombre" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Material:</label>
            <input type="text" name="material" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Marca:</label>
            <input type="text" name="marca" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Costo:</label>
            <input type="number" name="costo" class="form-control" step="0.01" min="0" required>
        </div>
        <div class="mb-3">
            <label>Categoría:</label>
            <input type="text" name="categoria" class="form-control">
        </div>
        <div class="mb-3">
            <label>Descripción:</label>
            <textarea name="descripcion" class="form-control"></textarea>
        </div>
        <div class="mb-3">
            <label>Stock:</label>
            <input type="number" name="stock" class="form-control" min="0" required>
        </div>
        <div class="mb-3">
            <label>Compatibilidad:</label>
            <input type="text" name="compatibilidad" class="form-control">
        </div>
        <div class="mb-3">
            <button type="submit" class="btn btn-primary">Guardar</button>
            <a href="repuestolist.jsp" class="btn btn-secondary">Cancelar</a>
        </div>
    </form>
</div>
</body>
</html>
