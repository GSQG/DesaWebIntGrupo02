<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="BusinessEntity.DetalleVentaBE" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Detalles de Venta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Listado de Detalles de Venta</h1>
    <a href="detalleventaform.jsp?accion=insertar" class="btn btn-success mb-3">Nuevo Detalle</a>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Acciones</th>
            <th>ID</th>
            <th>ID Venta</th>
            <th>ID Carro</th>
            <th>Precio Unitario</th>
            <th>Cantidad</th>
            <th>Subtotal</th>
            <th>Comentario</th>
            <th>Talla</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<DetalleVentaBE> listaDetalle = (List<DetalleVentaBE>) request.getAttribute("listaDetalleVenta");
            if(listaDetalle != null) {
                for(DetalleVentaBE det : listaDetalle) {
        %>
        <tr>
            <td>
                <a href="DetalleVenta.do?accion=delete&id=<%=det.getIdDetalle()%>" class="btn btn-danger btn-sm">Eliminar</a>
                <a href="detalleventaform.jsp?accion=edit&id=<%=det.getIdDetalle()%>" class="btn btn-primary btn-sm">Editar</a>
            </td>
            <td><%=det.getIdDetalle()%></td>
            <td><%=det.getIdVenta()%></td>
            <td><%=det.getIdCarro()%></td>
            <td><%=det.getPrecioUnitario()%></td>
            <td><%=det.getCantidad()%></td>
            <td><%=det.getSubtotal()%></td>
            <td><%=det.getComentarioLinea()%></td>
            <td><%=det.getTalla()%></td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>