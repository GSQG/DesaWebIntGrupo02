<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="BusinessEntity.RepuestosBE" %>
<%@ page import="BusinessLogic.RepuestosBL" %>
<%@ page import="DataAccessObject.RepuestosDAO" %>
<%@ page import="BusinessLogic.RepuestosBL" %>
<%
    RepuestosBL repuestoBL = new RepuestosBL(); // Sin parámetros
    List<RepuestosBE> repuestos = repuestoBL.listar();
    String usuarioLogueado = (String) session.getAttribute("usuarioLogueado");

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Repuestos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body class="fondo-principal">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Deluxe Drive</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                 <li class="nav-item"><a class="nav-link" href="carrolist.jsp">Carros</a></li>
                 <li class="nav-item"><a class="nav-link" href="ventalist.jsp">Ventas</a></li>
                 <li class="nav-item"><a class="nav-link" href="usuariolist.jsp">Usuarios</a></li>
                 <li class="nav-item"><a class="nav-link" href="sedelist.jsp">Sedes</a></li>
                 <li class="nav-item"><a class="nav-link" href="comprarrepuesto.jsp">Comprar Repuestos</a></li>
                 <li class="nav-item"><a class="nav-link" href="repuestolist.jsp">Listado de Repuestos</a></li>
                 <li class="nav-item"><a class="nav-link" href="respuestasRapidas.jsp">Atencion al cliente</a></li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <span class="navbar-text text-light me-2">Hola, <%= usuarioLogueado %></span>
                </li>
                <li class="nav-item">
                    <a class="btn btn-outline-light" href="<%= request.getContextPath() %>/LogoutServlet">
                        Cerrar sesión
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
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
