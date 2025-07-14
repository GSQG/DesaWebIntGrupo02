<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="BusinessEntity.RepuestosBE" %>
<%@ page import="BusinessLogic.RepuestosBL" %>
<%
    RepuestosBL repuestosBL = new RepuestosBL();
    List<RepuestosBE> listaRepuestos = repuestosBL.listar();
    String usuarioLogueado = (String) session.getAttribute("usuarioLogueado");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Repuestos Disponibles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 1000px;
            margin-top: 50px;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .navbar {
            margin-bottom: 20px;
        }
        .card {
            margin-bottom: 20px;
        }
        .btn-comprar {
            width: 100%;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Repuestos</a>
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
                <li class="nav-item"><a class="nav-link active" href="comprarrepuesto.jsp">Comprar Repuestos</a></li>
                <li class="nav-item"><a class="nav-link" href="repuestolist.jsp">Listado de Repuestos</a></li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <span class="navbar-text text-light me-2">Hola, <%= usuarioLogueado %></span>
                </li>
                <li class="nav-item">
                    <a class="btn btn-outline-light" href="<%= request.getContextPath() %>/LogoutServlet">Cerrar sesión</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h1 class="text-center">Listado de Repuestos</h1>
    <div class="row">
        <% if (listaRepuestos == null || listaRepuestos.isEmpty()) { %>
            <p class="text-center text-warning">No hay repuestos disponibles en este momento.</p>
        <% } else {
            for (RepuestosBE repuesto : listaRepuestos) { %>
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-body">
                    <i class="fa fa-cogs fa-3x mb-3"></i>
                    <h5 class="card-title"><%= repuesto.getNombre() %></h5>
                    <p class="card-text">Marca: <%= repuesto.getMarca() %></p>
                    <p class="card-text">Compatible con: <%= repuesto.getCompatibilidad() %></p>
                    <p class="card-text">Precio: S/. <%= repuesto.getCosto() %></p>
                    <p class="card-text">Stock: <%= repuesto.getStock() %> unidades</p>
                    <button class="btn btn-success btn-comprar"
                            data-bs-toggle="modal"
                            data-bs-target="#comprarModal"
                            data-id="<%= repuesto.getIdRepuesto() %>"
                            data-nombre="<%= repuesto.getNombre() %>"
                            data-precio="<%= repuesto.getCosto() %>"
                            data-stock="<%= repuesto.getStock() %>">
                        Comprar
                    </button>
                </div>
            </div>
        </div>
        <% } } %>
    </div>
</div>

<!-- Modal de Compra -->
<div class="modal fade" id="comprarModal" tabindex="-1" aria-labelledby="comprarModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="formCompra">
                <div class="modal-header">
                    <h5 class="modal-title" id="comprarModalLabel">Confirmar Compra</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="idRepuestoCompra" name="idRepuesto">
                    <div class="mb-3">
                        <label for="nombreRepuesto" class="form-label">Repuesto</label>
                        <input type="text" class="form-control" id="nombreRepuesto" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="precioRepuesto" class="form-label">Precio Unitario</label>
                        <input type="text" class="form-control" id="precioRepuesto" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="cantidad" class="form-label">Cantidad</label>
                        <input type="number" class="form-control" id="cantidad" name="cantidad" min="1" value="1" required>
                        <small id="stockDisponible" class="form-text text-muted"></small>
                    </div>
                    <div class="mb-3">
                        <label for="precioTotal" class="form-label">Precio Total</label>
                        <input type="text" class="form-control" id="precioTotal" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Nombre</label>
                        <input type="text" class="form-control" name="nombreCliente" id="nombreCliente" value="<%= usuarioLogueado %>" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Dirección</label>
                        <input type="text" class="form-control" name="direccion" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Teléfono</label>
                        <input type="text" class="form-control" name="telefono" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Medio de pago</label>
                        <select class="form-select" id="medioPago" name="medioPago" required>
                            <option value="">Seleccione medio de pago</option>
                            <option value="EFECTIVO">Efectivo</option>
                            <option value="TARJETA">Tarjeta</option>
                            <option value="TRANSFERENCIA">Transferencia</option>
                        </select>
                    </div>
                    <div id="tarjetaFields" style="display:none;">
                        <div class="mb-3">
                            <label class="form-label">Número de Tarjeta</label>
                            <input type="text" class="form-control" name="numeroTarjeta" id="numeroTarjeta" autocomplete="off">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Fecha Vencimiento</label>
                            <input type="text" class="form-control" name="fechaVencimiento" placeholder="MM/YY">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">CVV</label>
                            <input type="text" class="form-control" name="cvv" maxlength="3">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" id="btnFinalizarCompra">Finalizar Compra</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $('#comprarModal').on('show.bs.modal', function (event) {
            $('#formCompra')[0].reset();

            const button = $(event.relatedTarget);
            const id = button.data('id');
            const nombre = button.data('nombre');
            const precio = button.data('precio');
            const stock = button.data('stock');

            $('#idRepuestoCompra').val(id);
            $('#nombreRepuesto').val(nombre);
            $('#precioRepuesto').val('S/. ' + precio);
            $('#stockDisponible').text('Stock disponible: ' + stock);
            $('#cantidad').attr('max', stock);
            $('#nombreCliente').val("<%= usuarioLogueado %>");
            $('#tarjetaFields').hide();

            // Calcular precio total inicial
            calcularPrecioTotal();
        });

        $('#medioPago').change(function () {
            $('#tarjetaFields').toggle($(this).val() === 'TARJETA');
        });

        $('#cantidad').on('input', function() {
            calcularPrecioTotal();
        });

        function calcularPrecioTotal() {
            const cantidad = parseInt($('#cantidad').val()) || 0;
            const precioUnitario = parseFloat($('#precioRepuesto').val().replace('S/. ', ''));
            const precioTotal = cantidad * precioUnitario;
            $('#precioTotal').val('S/. ' + precioTotal.toFixed(2));
        }

        $('#btnFinalizarCompra').click(function () {
            const formData = {
                idRepuesto: $('#idRepuestoCompra').val(),
                cantidad: $('#cantidad').val(),
                nombreCliente: $('input[name="nombreCliente"]').val(),
                direccion: $('input[name="direccion"]').val(),
                telefono: $('input[name="telefono"]').val(),
                medioPago: $('#medioPago').val(),
                numeroTarjeta: $('input[name="numeroTarjeta"]').val(),
                fechaVencimiento: $('input[name="fechaVencimiento"]').val(),
                cvv: $('input[name="cvv"]').val()
            };

            $.ajax({
                type: 'POST',
                url: '<%= request.getContextPath() %>/VentaRepuesto.do',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function (response) {
                    if (response.success) {
                        alert('Compra realizada con éxito');
                        $('#comprarModal').modal('hide');
                        location.reload();
                    } else {
                        alert('Error: ' + response.message);
                    }
                },
                error: function () {
                    alert('Error al procesar la compra');
                }
            });
        });
    });
</script>
</body>
</html>