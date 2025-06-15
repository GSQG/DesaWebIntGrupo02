<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="BusinessEntity.RepuestosBE" %>
<%@ page import="BusinessLogic.RepuestosBL" %>
<%@ page import="DataAccessObject.RepuestosDAO" %>
<%
    RepuestosBL repuestoBL = new RepuestosBL(new RepuestosDAO());
    List<RepuestosBE> repuestos = repuestoBL.listar();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Repuestos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body>
<div class="container mt-4">
    <h1 class="mb-4">Listado de Repuestos</h1>
    <a href="repuestoform.jsp?accion=nuevo" class="btn btn-success mb-3">
        <i class="fa fa-plus"></i> Agregar Repuesto
    </a>
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th>Acciones</th>
                <th>ID</th>
                <th>Nombre</th>
                <th>Material</th>
                <th>Marca</th>
                <th>Costo</th>
                <th>Categoría</th>
                <th>Descripción</th>
                <th>Stock</th>
                <th>Compatibilidad</th>
            </tr>
        </thead>
        <tbody>
        <% if (repuestos == null || repuestos.isEmpty()) { %>
            <tr>
                <td colspan="10" class="text-center text-warning">No hay repuestos registrados.</td>
            </tr>
        <% } else {
            for (RepuestosBE repuesto : repuestos) { %>
            <tr>
                <td>
                    <a href="Repuestos.do?accion=edit&id=<%= repuesto.getIdRepuesto() %>" class="btn btn-primary btn-sm">
                        <i class="fa fa-pencil"></i> Editar
                    </a>
                    <a href="Repuestos.do?accion=delete&id=<%= repuesto.getIdRepuesto() %>" class="btn btn-danger btn-sm">
                        <i class="fa fa-trash"></i> Eliminar
                    </a>
                </td>
                <td><%= repuesto.getIdRepuesto() %></td>
                <td><%= repuesto.getNombre() %></td>
                <td><%= repuesto.getMaterial() %></td>
                <td><%= repuesto.getMarca() %></td>
                <td><%= repuesto.getCosto() %></td>
                <td><%= repuesto.getCategoria() %></td>
                <td><%= repuesto.getDescripcion() %></td>
                <td><%= repuesto.getStock() %></td>
                <td><%= repuesto.getCompatibilidad() %></td>
            </tr>
        <% } } %>
        </tbody>
    </table>
</div>
</body>
</html>
