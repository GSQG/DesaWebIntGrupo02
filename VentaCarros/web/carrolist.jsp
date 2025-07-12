<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, BusinessEntity.CarroBE, BusinessLogic.CarroBL" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Carros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        async function deleteCar(idCarro) {
            if (!confirm('¿Deseas eliminar este carro?')) return;
            try {
                const response = await fetch('Carro.do', {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ idCarro: idCarro })
                });
                const result = await response.json();
                alert(result.message);
                if (result.success) {
                    location.reload();
                }
            } catch (error) {
                alert('Error al enviar la solicitud de eliminación.');
            }
        }
    </script>
</head>
<body>
<div class="container mt-4">
    <h1>Listado de Carros</h1>
    <a href="Carro.do?accion=edit" class="btn btn-success mb-3">Nuevo Carro</a>
    <table class="table table-bordered table-striped">
        <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>ID Modelo</th>
                <th>Nombre</th>
                <th>Color</th>
                <th>Precio</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
        <%
            CarroBL carroBL = new CarroBL();
            List<CarroBE> listaCarros = carroBL.listar();
            for (CarroBE carro : listaCarros) {
        %>
            <tr>
                <td><%= carro.getIdCarro() %></td>
                <td><%= carro.getIdModelo() %></td>
                <td><%= carro.getNombre() %></td>
                <td><%= carro.getColor() %></td>
                <td><%= carro.getPrecioLista() %></td>
                <td>
                    <a href="Carro.do?accion=edit&id=<%= carro.getIdCarro() %>" class="btn btn-sm btn-primary">Editar</a>
                    <button type="button" class="btn btn-sm btn-danger" onclick="deleteCar(<%= carro.getIdCarro() %>)">Eliminar</button>
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>