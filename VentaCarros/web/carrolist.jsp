<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, BusinessEntity.CarroBE, BusinessLogic.CarroBL" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Carros</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
      rel="stylesheet">
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
<div class="container mt-4">
    <h1>Listado de Carros</h1>
    <a href="carro-create.jsp" class="btn btn-success mb-3">Nuevo Carro</a>
    <table class="table table-bordered table-striped">
        <thead class="table-light">
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
        <tbody>
        <%
            CarroBL carroBL = new CarroBL();
            List<CarroBE> lista = carroBL.listar();
            for (CarroBE carro : lista) {
        %>
        <tr>
            <td><%= carro.getIdCarro() %></td>
            <td><%= carro.getIdModelo() %></td>
            <td><%= carro.getNombre() %></td>
            <td><%= carro.getColor() %></td>
            <td><%= carro.getPrecioLista() %></td>
            <td><%= carro.getDescripcion() %></td>
            <td><%= carro.getAno() %></td>
            <td><%= carro.getEstado() %></td>
            <td><%= carro.getKilometraje() %></td>
            <td><%= carro.getTipoCombustible() %></td>
            <td><%= carro.getTransmision() %></td>
            <td><%= carro.getTallaRuedas() %></td>
            <td><%= carro.getComentarios() %></td>
            <td>
                <a href="carro-edit.jsp?idCarro=<%= carro.getIdCarro() %>"
                   class="btn btn-sm btn-primary">Editar</a>
                <button type="button" class="btn btn-sm btn-danger"
                        onclick="deleteCar(<%= carro.getIdCarro() %>)">
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
</body>
</html>