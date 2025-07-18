<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="BusinessEntity.SedeBE" %>
<%@ page import="BusinessLogic.SedeBL" %>
<%
    SedeBL sedeBL = new SedeBL();
    List<SedeBE> sedes = sedeBL.listar();
    String usuarioLogueado = (String) session.getAttribute("usuarioLogueado");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Sedes</title>
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
<div class="container">
    <h1>Listado de Sedes</h1>
    <div class="mb-3">
        <a href="sedeform.jsp" class="btn btn-success">
            <i class="fa fa-plus"></i> Agregar Sede
        </a>
    </div>
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th>Acciones</th>
                <th>ID Sede</th>
                <th>Nombre</th>
                <th>Dirección</th>
                <th>Teléfono</th>
                <th>Horario</th>
                <th>Ciudad</th>
                <th>Estado</th>
            </tr>
        </thead>
        <tbody>
            <% if (sedes == null || sedes.isEmpty()) { %>
                <tr>
                    <td colspan="8" class="text-center text-warning">No hay sedes registradas.</td>
                </tr>
            <% } else {
                for (SedeBE sede : sedes) { %>
                    <tr>
                        <td>
                            <a href="Sede.do?accion=edit&id=<%= sede.getIdSede() %>" class="btn btn-primary">
                                <i class="fa fa-pencil"></i> Editar
                            </a>
                            <a href="Sede.do?accion=delete&id=<%= sede.getIdSede() %>" class="btn btn-danger">
                                <i class="fa fa-trash"></i> Eliminar
                            </a>
                        </td>
                        <td><%= sede.getIdSede() %></td>
                        <td><%= sede.getNombre() %></td>
                        <td><%= sede.getDireccion() %></td>
                        <td><%= sede.getTelefono() %></td>
                        <td><%= sede.getHorario() %></td>
                        <td><%= sede.getCiudad() %></td>
                        <td><%= sede.getEstado() %></td>
                    </tr>
            <% } } %>
        </tbody>
    </table>
</div>
</body>
</html>