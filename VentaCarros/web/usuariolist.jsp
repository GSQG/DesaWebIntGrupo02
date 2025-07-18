<%@page import="java.util.List"%>
<%@page import="BusinessEntity.UsuarioBE"%>
<%@page import="BusinessLogic.UsuarioBL"%>
<%
    UsuarioBL usuarioBL = new UsuarioBL();
    List<UsuarioBE> listaUsuarios = usuarioBL.listar();
    String usuarioLogueado = (String) session.getAttribute("usuarioLogueado");

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body>
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
    <h1>Listado de Usuarios</h1>
    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>Acciones</th>
            <th>ID Usuario</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>Email</th>
            <th>Celular</th>
            <th>Rol</th>
        </tr>
        </thead>
        <tbody>
        <% for(UsuarioBE usuario : listaUsuarios) { %>
        <tr>
            <td>
                <a href="Usuario.do?accion=delete&id=<%= usuario.getIdUsuario() %>" class="btn btn-danger">
                    <i class="fa fa-trash"></i>
                </a>
                <a href="Usuario.do?accion=edit&id=<%= usuario.getIdUsuario() %>" class="btn btn-primary">
                    <i class="fa fa-pencil"></i>
                </a>
            </td>
            <td><%= usuario.getIdUsuario() %></td>
            <td><%= usuario.getNombres() %></td>
            <td><%= usuario.getApellidos() %></td>
            <td><%= usuario.getEmail() %></td>
            <td><%= usuario.getCelular() %></td>
            <td><%= usuario.getRol() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>