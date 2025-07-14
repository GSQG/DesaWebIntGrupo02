<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List, BusinessEntity.CarroBE, BusinessLogic.CarroBL" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Deluxe Drive</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link href="dist/css/estilos-generales.css" rel="stylesheet" type="text/css"/>
    <style>
        .container {
            width: 70%;
            margin-top: 50px;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        .navbar { margin-bottom: 20px; }
        .card { margin-bottom: 20px; }
        .btn-comprar { width: 100%; }
        .modal-content { border-radius: 10px; }
    </style>
</head>

<body class="fondo-principal">
<%
    CarroBL carroBL = new CarroBL();
    List<CarroBE> listaCarros = carroBL.listar();
    String usuarioLogueado = (String) session.getAttribute("usuarioLogueado");
%>
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
    <h1 class="text-center">Listado de Deluxe Drive</h1>
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
                    <button class="btn btn-success btn-comprar"
                            data-bs-toggle="modal" data-bs-target="#comprarModal"
                            data-id="<%= carro.getIdCarro() %>"
                            data-nombre="<%= carro.getNombre() %>"
                            data-precio="<%= carro.getPrecioLista() %>">
                        Comprar
                    </button>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
</div>

<div class="modal fade" id="comprarModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">Finalizar Compra</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="formCompra">
                    <input type="hidden" id="idCarroCompra" name="idCarro">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Modelo</label>
                            <input type="text" class="form-control" id="modeloCarro" readonly>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Precio</label>
                            <input type="text" class="form-control" id="precioCarro" readonly>
                        </div>
                    </div>

                    <h4 class="mt-4">Datos del Cliente</h4>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Nombre Completo</label>
                            <input type="text" class="form-control" name="nombreCliente" id="nombreCliente"
                                   value="<%= usuarioLogueado %>" readonly>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Teléfono</label>
                            <input type="tel" class="form-control" name="telefono" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Dirección</label>
                        <input type="text" class="form-control" name="direccion" required>
                    </div>

                    <h4 class="mt-4">Método de Pago</h4>
                    <div class="mb-3">
                        <select class="form-select" name="medioPago" id="medioPago" required>
                            <option value="">Seleccione medio de pago</option>
                            <option value="TARJETA">Tarjeta de Crédito/Débito</option>
                            <option value="EFECTIVO">Efectivo</option>
                            <option value="TRANSFERENCIA">Transferencia Bancaria</option>
                        </select>
                    </div>

                    <div id="tarjetaFields" style="display:none;">
                        <div class="row mb-3">
                            <div class="col-md-8">
                                <label class="form-label">Número de Tarjeta</label>
                                <input type="text" class="form-control" name="numeroTarjeta" autocomplete="off">
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">CVV</label>
                                <input type="text" class="form-control" name="cvv" autocomplete="off">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Fecha de Vencimiento (MM/YY)</label>
                            <input type="text" class="form-control" name="fechaVencimiento" autocomplete="off">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-success" id="btnFinalizarCompra">Finalizar Compra</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $('#comprarModal').on('show.bs.modal', function (event) {
            $('#formCompra')[0].reset();

            var button = $(event.relatedTarget);
            var id = button.data('id');
            var nombre = button.data('nombre');
            var precio = button.data('precio');

            $('#idCarroCompra').val(id);
            $('#modeloCarro').val(nombre);
            $('#precioCarro').val('S/.' + precio);

            $('#nombreCliente').val("<%= usuarioLogueado %>");
            $('#tarjetaFields').hide();
        });


        $('#medioPago').change(function() {
            $('#tarjetaFields').toggle($(this).val() === 'TARJETA');
        });

        $('#btnFinalizarCompra').click(function() {
            const formData = {
                idCarro: $('#idCarroCompra').val(),
                nombreCliente: $('input[name="nombreCliente"]').val(),
                direccion: $('input[name="direccion"]').val(),
                telefono: $('input[name="telefono"]').val(),
                medioPago: $('#medioPago').val(),
                fechaVencimiento: $('input[name="fechaVencimiento"]').val(),
                cvv: $('input[name="cvv"]').val()
            };

            $.ajax({
                type: 'POST',
                url: '<%= request.getContextPath() %>/Venta.do',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function(response) {
                    if (response.success) {
                        alert('Compra realizada con éxito');
                        $('#comprarModal').modal('hide');
                        location.reload();
                    } else {
                        alert('Error: ' + response.message);
                    }
                },
                error: function() {
                    alert('Error al procesar la compra');
                }
            });
        });
    });
</script>
</body>
</html>
