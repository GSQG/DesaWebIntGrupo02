<%@ page import="java.util.List" %>
<%@ page import="BusinessEntity.CarroBE" %>
<%@ page import="BusinessLogic.CarroBL" %>
<%
    CarroBL carroBL = new CarroBL();
    List<CarroBE> listaCarros = carroBL.listar();
    String accion = request.getParameter("accion");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Carros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>
<body>
<div class="container">
    <h1>Listado de Carros <%= (accion != null ? accion : "") %></h1>
    <div class="mb-3">
         <a href="carroform.jsp" class="btn btn-success">
             <i class="fa fa-plus"></i> Agregar Carro
         </a>
    </div>
    <table class="table table-striped table-hover table-responsive">
        <thead>
        <tr>
            <th>Acciones</th>
            <th>ID Carro</th>
            <th>ID Modelo</th>
            <th>Nombre</th>
            <th>Año</th>
            <th>Color</th>
            <th>Precio Lista</th>
            <th>Estado</th>
        </tr>
        </thead>
        <tbody>
        <% for(CarroBE carro : listaCarros) { %>
        <tr>
            <td>
                <a href="Carro.do?accion=delete&id=<%= carro.getIdCarro() %>" class="btn btn-danger">
                    <i class="fa fa-trash" aria-hidden="true"></i>
                </a>
                <a href="Carro.do?accion=edit&id=<%= carro.getIdCarro() %>" class="btn btn-primary">
                    <i class="fa fa-pencil" aria-hidden="true"></i>
                </a>
                <a href="Carro.do?accion=export&id=<%= carro.getIdCarro() %>" class="btn btn-warning">
                    <i class="fa fa-file-pdf-o" aria-hidden="true"></i>
                </a>
            </td>
            <td><%= carro.getIdCarro() %></td>
            <td><%= carro.getIdModelo() %></td>
            <td><%= carro.getNombre() %></td>
            <td><%= carro.getAno() %></td>
            <td><%= carro.getColor() %></td>
            <td><%= carro.getPrecioLista() %></td>
            <td><%= carro.getEstado() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>