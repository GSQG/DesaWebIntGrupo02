<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List, BusinessEntity.CarroBE, BusinessLogic.CarroBL" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Carros en Venta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <style>
        body { background-color: #f8f9fa; }
        .container {
            max-width: 1000px;
            margin-top: 50px;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .navbar { margin-bottom: 20px; }
        .card { margin-bottom: 20px; }
        .btn-comprar { width: 100%; }
    </style>
</head>
<body>
<%
    CarroBL carroBL = new CarroBL();
    List<CarroBE> listaCarros = carroBL.listar();
    String usuarioLogueado = (String) session.getAttribute("usuarioLogueado");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Carros en Venta</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                 <li class="nav-item"><a class="nav-link" href="carrolist.jsp">Carros</a></li>
                 <li class="nav-item"><a class="nav-link" href="clientelist.jsp">Clientes</a></li>
                 <li class="nav-item"><a class="nav-link" href="inventariolist.jsp">Inventario</a></li>
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
    <h1 class="text-center">Listado de Carros en Venta</h1>
    <div class="row">
        <%
            if (listaCarros == null || listaCarros.isEmpty()) {
        %>
            <p class="text-center text-warning">No hay carros disponibles en este momento.</p>
        <%
            } else {
                for (CarroBE carro : listaCarros) {
        %>
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-body">
                    <i class="fa fa-car fa-3x mb-3"></i>
                    <h5 class="card-title">Modelo: <%= carro.getNombre() %></h5>
                    <p class="card-text">Año: <%= carro.getAno() %></p>
                    <p class="card-text">Color: <%= carro.getColor() %></p>
                    <p class="card-text">Precio: S/. <%= carro.getPrecioLista() %></p>
                    <p class="card-text">Estado: <%= carro.getEstado() %></p>
                    <p class="card-text">Kilometraje: <%= carro.getKilometraje() %> km</p>
                    <p class="card-text">Combustible: <%= carro.getTipoCombustible() %></p>
                    <p class="card-text">Transmisión: <%= carro.getTransmision() %></p>
                    <a href="comprar.jsp?id=<%= carro.getIdCarro() %>" class="btn btn-success btn-comprar">Comprar</a>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>