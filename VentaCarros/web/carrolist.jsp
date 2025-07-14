<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List, BusinessEntity.CarroBE, BusinessLogic.CarroBL" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Carros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <style>
        body { background-color: #f8f9fa; }
        .container {
            width: 100%;
            margin-top: 50px;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .navbar { margin-bottom: 20px; }
        .btn-sm { margin-right: 5px; }
    </style>
    <script>
        async function deleteCar(idCarro) {
            if (!confirm('¿Eliminar este carro?')) return;
            const resp = await fetch('Carro.do', {
                method: 'DELETE',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ idCarro })
            });
            const json = await resp.json();
            alert(json.message);
            if (json.success) location.reload();
        }
    </script>
</head>
<body>
<%
    CarroBL carroBL = new CarroBL();
    List<CarroBE> lista = carroBL.listar();
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
                <li class="nav-item"><a class="nav-link" href="respuestasRapidas.jsp">Atención al Cliente</a></li>
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
    <h1 class="text-center">Listado de Carros Registrados</h1>
    <div class="text-end mb-3">
        <a href="carro-create.jsp" class="btn btn-success">Nuevo Carro</a>
    </div>
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="table-light text-center">
                <tr>
                    <th>ID Carro</th>
                    <th>ID Modelo</th>
                    <th>Nombre</th>
                    <th>Color</th>
                    <th>Precio</th>
                    <th>Descripción</th>
                    <th>Año</th>
                    <th>Estado</th>
                    <th>Kilometraje</th>
                    <th>Tipo Combustible</th>
                    <th>Transmisión</th>
                    <th>Talla Ruedas</th>
                    <th>Comentarios</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody class="text-center align-middle">
                <%
                    for (CarroBE carro : lista) {
                %>
                <tr>
                    <td><%= carro.getIdCarro() %></td>
                    <td><%= carro.getIdModelo() %></td>
                    <td><%= carro.getNombre() %></td>
                    <td><%= carro.getColor() %></td>
                    <td>S/. <%= carro.getPrecioLista() %></td>
                    <td><%= carro.getDescripcion() %></td>
                    <td><%= carro.getAno() %></td>
                    <td><%= carro.getEstado() %></td>
                    <td><%= carro.getKilometraje() %> km</td>
                    <td><%= carro.getTipoCombustible() %></td>
                    <td><%= carro.getTransmision() %></td>
                    <td><%= carro.getTallaRuedas() %></td>
                    <td><%= carro.getComentarios() %></td>
                    <td>
                        <a href="carro-edit.jsp?idCarro=<%= carro.getIdCarro() %>" class="btn btn-sm btn-primary">Editar</a>
                        <button type="button" class="btn btn-sm btn-danger" onclick="deleteCar(<%= carro.getIdCarro() %>)">
                            Eliminar
                        </button>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
