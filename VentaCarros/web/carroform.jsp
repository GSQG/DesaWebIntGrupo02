<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="BusinessLogic.CarroBL, BusinessEntity.CarroBE" %>
<%
    String accion = request.getParameter("accion");
    if (accion == null || accion.trim().isEmpty()) {
        accion = "insertar";
    }
    CarroBE carro = new CarroBE();
    if (accion.equalsIgnoreCase("actualizar")) {
        String idParam = request.getParameter("idCarro");
        CarroBL carroBL = new CarroBL();
        carro = carroBL.Read(idParam);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= accion.equals("actualizar") ? "Editar Carro" : "Nuevo Carro" %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="fondo-principal">
<div class="container">
    <h1><%= accion.equals("actualizar") ? "Editar Carro" : "Nuevo Carro" %></h1>
    <form action="Carro.do" method="post">
        <input type="hidden" name="accion" value="<%= accion %>">
        <% if (accion.equals("actualizar")) { %>
            <input type="hidden" name="idCarro" value="<%= carro.getIdCarro() %>">
        <% } %>
        <div class="mb-3">
            <label class="form-label">ID Modelo</label>
            <input type="number" name="idModelo" class="form-control" required
                   value="<%= carro.getIdModelo() %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Nombre</label>
            <input type="text" name="nombre" class="form-control" required
                   value="<%= carro.getNombre() %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Color</label>
            <input type="text" name="color" class="form-control"
                   value="<%= carro.getColor() %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Precio</label>
            <input type="text" name="precio" class="form-control" required
                   value="<%= carro.getPrecioLista() %>">
        </div>
        <div class="mb-3">
            <label class="form-label">Descripción</label>
            <textarea name="descripcion" class="form-control"><%= carro.getDescripcion() %></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
        <a href="carrolist.jsp" class="btn btn-secondary">Cancelar</a>
    </form>
</div>
</body>
</html>