<%@page import="java.util.List"%>
<%@page import="BusinessEntity.UsuarioBE"%>
<%@page import="BusinessLogic.UsuarioBL"%>
<%
    UsuarioBL usuarioBL = new UsuarioBL();
    List<UsuarioBE> listaUsuarios = usuarioBL.listar();
    String usuarioLogueado = (String) session.getAttribute("usuarioLogueado");
    String rolUsuario = (String) session.getAttribute("rolUsuario");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listado de Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <style>
        .action-buttons .btn {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
        }
        .btn-add {
            margin-bottom: 1rem;
        }
    </style>
</head>
<body class="fondo-principal">
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
                    <span class="navbar-text text-light me-2">Hola, <%= usuarioLogueado %> (<%= rolUsuario %>)</span>
                </li>
                <li class="nav-item">
                    <a class="btn btn-outline-light" href="<%= request.getContextPath() %>/LogoutServlet">
                        <i class="fas fa-sign-out-alt"></i> Cerrar sesión
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1><i class="fas fa-users"></i> Listado de Usuarios</h1>
        <button type="button" class="btn btn-success btn-add" data-bs-toggle="modal" data-bs-target="#modalUsuario">
            <i class="fas fa-plus"></i> Nuevo Usuario
        </button>
    </div>

    <!-- Modal para Crear/Editar Usuario -->
    <div class="modal fade" id="modalUsuario" tabindex="-1" aria-labelledby="modalUsuarioLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalUsuarioLabel">Nuevo Usuario</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form id="formUsuario" action="Usuario.do" method="POST">
                    <input type="hidden" id="idUsuario" name="idUsuario">
                    <input type="hidden" name="accion" id="accion" value="insertar">
                    <div class="modal-body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="nombres" class="form-label">Nombres</label>
                                <input type="text" class="form-control" id="nombres" name="nombres" required>
                            </div>
                            <div class="col-md-6">
                                <label for="apellidos" class="form-label">Apellidos</label>
                                <input type="text" class="form-control" id="apellidos" name="apellidos" required>
                            </div>
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="col-md-6">
                                <label for="contrasena" class="form-label">Clave</label>
                                <input type="password" class="form-control" id="contrasena" name="contrasena" required>
                            </div>
                            <div class="col-md-6">
                                <label for="celular" class="form-label">Celular</label>
                                <input type="tel" class="form-control" id="celular" name="celular">
                            </div>
                            <div class="col-md-6">
                                <label for="rol" class="form-label">Rol</label>
                                <select class="form-select" id="rol" name="rol" required>
                                    <option value="admin">Administrador</option>
                                    <option value="vendedor">Vendedor</option>
                                    <option value="mecanico">Mecánico</option>
                                    <option value="cliente">Cliente</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="fechaNacimiento" class="form-label">Fecha de Nacimiento</label>
                                <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento">
                            </div>
                            <div class="col-md-6">
                                <label for="direccion" class="form-label">Direccion</label>
                                <input type="text" class="form-control" id="direccion" name="direccion">
                            </div>
                            <div class="col-12">
                                <label for="comentarios" class="form-label">Comentarios</label>
                                <textarea class="form-control" id="comentarios" name="comentarios" rows="2"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal de Confirmación para Eliminar -->
    <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirmar Eliminación</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ¿Está seguro que desea eliminar este usuario?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <a id="btnConfirmDelete" href="#" class="btn btn-danger">Eliminar</a>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <table id="tablaUsuarios" class="table table-striped table-hover" style="width:100%">
                <thead class="table-dark">
                    <tr>
                        <th>Acciones</th>
                        <th>ID</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Email</th>
                        <th>Celular</th>
                        <th>Rol</th>
                        <th>Fecha Nac.</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(UsuarioBE usuario : listaUsuarios) { %>
                    <tr>
                        <td class="action-buttons">
                            <button class="btn btn-sm btn-danger btn-delete" data-id="<%= usuario.getIdUsuario() %>">
                                <i class="fas fa-trash"></i>
                            </button>
                            <button class="btn btn-sm btn-primary btn-edit"
                                data-id="<%= usuario.getIdUsuario() %>"
                                data-nombres="<%= usuario.getNombres() %>"
                                data-apellidos="<%= usuario.getApellidos() %>"
                                data-email="<%= usuario.getEmail() %>"
                                data-celular="<%= usuario.getCelular() %>"
                                data-rol="<%= usuario.getRol() %>"
                                data-fechanacimiento="<%= usuario.getFechaNacimiento() != null ?
                                    new java.text.SimpleDateFormat("yyyy-MM-dd").format(usuario.getFechaNacimiento()) : "" %>"
                                data-direccion="<%= usuario.getDireccion() != null ? usuario.getDireccion() : "" %>"
                                data-comentarios="<%= usuario.getComentarios() != null ? usuario.getComentarios() : "" %>">
                                <i class="fas fa-edit"></i>
                            </button>
                        </td>
                        <td><%= usuario.getIdUsuario() %></td>
                        <td><%= usuario.getNombres() %></td>
                        <td><%= usuario.getApellidos() %></td>
                        <td><%= usuario.getEmail() %></td>
                        <td><%= usuario.getCelular() %></td>
                        <td><%= usuario.getRol() %></td>
                        <td><%= usuario.getFechaNacimiento() != null ?
                            new java.text.SimpleDateFormat("dd/MM/yyyy").format(usuario.getFechaNacimiento()) : "" %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script>
$(document).ready(function() {
    // Inicializar DataTable
    $('#tablaUsuarios').DataTable({
        language: {
            url: 'https://cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json'
        },
        responsive: true
    });

    // Configurar modal para eliminar
    $('.btn-delete').click(function() {
        var id = $(this).data('id');
        $('#btnConfirmDelete').attr('href', 'Usuario.do?accion=delete&id=' + id);
        $('#confirmDeleteModal').modal('show');
    });

    // Configurar modal para editar
    $('.btn-edit').click(function() {
        $('#modalUsuarioLabel').text('Editar Usuario');
        $('#accion').val('actualizar');
        $('#idUsuario').val($(this).data('id'));
        $('#nombres').val($(this).data('nombres'));
        $('#apellidos').val($(this).data('apellidos'));
        $('#email').val($(this).data('email'));
        $('#celular').val($(this).data('celular'));
        $('#rol').val($(this).data('rol'));
        $('#fechaNacimiento').val($(this).data('fechanacimiento'));
        $('#direccion').val($(this).data('direccion'));
        $('#comentarios').val($(this).data('comentarios'));
        $('#contrasena').removeAttr('required');
        $('#modalUsuario').modal('show');
    });

    // Resetear modal al cerrar
    $('#modalUsuario').on('hidden.bs.modal', function () {
        $('#modalUsuarioLabel').text('Nuevo Usuario');
        $('#formUsuario')[0].reset();
        $('#accion').val('insertar');
        $('#idUsuario').val('');
        $('#contrasena').attr('required', 'required');
    });

    // Manejar envío del formulario
    $('#formUsuario').submit(function(e) {
        e.preventDefault();

        // Validación simple
        if ($('#nombres').val().trim() === '' || $('#email').val().trim() === '') {
            alert('Nombre y email son campos requeridos');
            return;
        }

        // Enviar formulario
        $.ajax({
            url: 'Usuario.do',
            type: 'POST',
            data: $(this).serialize(),
            success: function(response) {
                // Recargar la página después de guardar
                window.location.reload();
            },
            error: function(xhr, status, error) {
                alert('Error al guardar el usuario: ' + error);
            }
        });
    });
});
</script>
</body>
</html>