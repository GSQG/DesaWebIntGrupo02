<!-- carro-create.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nuevo Carro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="fondo-principal">
<div class="container mt-4">
    <h1>Nuevo Carro</h1>
    <form action="Carro.do" method="post">
        <input type="hidden" name="accion" value="insertar">

        <div class="mb-3">
            <label class="form-label">ID Modelo</label>
            <input type="number" name="idModelo" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Nombre</label>
            <input type="text" name="nombre" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Color</label>
            <input type="text" name="color" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Precio</label>
            <input type="number" name="precio" step="0.01" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Descripción</label>
            <textarea name="descripcion" class="form-control"></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Año</label>
            <input type="number" name="ano" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Estado</label>
            <input type="text" name="estado" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Kilometraje</label>
            <input type="number" name="kilometraje" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Tipo de Combustible</label>
            <input type="text" name="tipoCombustible" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Transmisión</label>
            <input type="text" name="transmision" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Talla de Ruedas</label>
            <input type="text" name="tallaRuedas" class="form-control">
        </div>

        <div class="mb-3">
            <label class="form-label">Comentarios</label>
            <textarea name="comentarios" class="form-control"></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Guardar</button>
        <a href="carrolist.jsp" class="btn btn-secondary">Cancelar</a>
    </form>
</div>
</body>
</html>