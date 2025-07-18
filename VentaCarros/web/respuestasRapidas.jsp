<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="DataAccessObject.RespuestaDAO" %>
<!DOCTYPE html>
<html lang="es">
<%
String usuarioLogueado = (String) session.getAttribute("usuarioLogueado");
%>
<head>
    <meta charset="UTF-8">
    <title>Mensajes en Cascada</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .mensaje { padding: 15px; border-radius: 10px; }
        .pregunta { background-color: #1E90FF; border: 1px solid #1C86EE; color: #fff; }
        .respuesta { background-color: #2ecc71; border: 1px solid #27ae60; color: #fff; }
        .respuesta-pendiente { background-color: #bdc3c7; border: 1px solid #95a5a6; color: #333; }
        .mensaje-row { margin-bottom: 20px; }
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
<div class="container mt-4">
    <h1 class="mb-4">Envía tu mensaje</h1>
    <form id="preguntaForm" class="mb-4">
        <div class="mb-3">
            <label for="pregunta" class="form-label">Escribe tu mensaje:</label>
            <input type="text" class="form-control" id="pregunta" name="pregunta" required>
        </div>
        <button type="submit" class="btn btn-primary">Enviar</button>
    </form>
    <h2>Historial de mensajes</h2>
    <div id="listaMensajes">
        <%
            RespuestaDAO dao = new RespuestaDAO();
            List<String> preguntas = dao.listarMensajes();
            List<String> respuestas = dao.listarMensajesRespuestas();
            if(preguntas != null && !preguntas.isEmpty()){
                for(int i = 0; i < preguntas.size(); i++){
                    String preguntaText = preguntas.get(i);
                    String respuestaText = "";
                    if(respuestas != null && respuestas.size() > i){
                        respuestaText = respuestas.get(i);
                    }
                    if(respuestaText == null || respuestaText.trim().isEmpty()){
                        respuestaText = "Pendiente de respuesta";
                    }
                    String claseRespuesta = "respuesta";
                    if("Pendiente de respuesta".equals(respuestaText)){
                        claseRespuesta = "respuesta-pendiente";
                    }
        %>
        <div class="row mensaje-row">
            <div class="col-md-6">
                <div class="mensaje pregunta">
                    <strong>Pregunta:</strong> <%= preguntaText %>
                </div>
            </div>
            <div class="col-md-6 text-end">
                <div class="mensaje <%= claseRespuesta %>">
                    <strong>Respuesta:</strong> <%= respuestaText %>
                </div>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <p>No hay mensajes todavía.</p>
        <%
            }
        %>
    </div>
</div>

<script>
    const baseUrl = "<%= request.getContextPath() %>";
    document.getElementById("preguntaForm").addEventListener("submit", function(event) {
        event.preventDefault();
        var pregunta = document.getElementById("pregunta").value;
        fetch(baseUrl + "/respuestasRapidas.do", {
            method: "POST",
            body: new URLSearchParams({ "pregunta": pregunta })
        })
        .then(response => response.text())
        .then(data => location.reload())
        .catch(error => {
            console.error("Error en la petición fetch:", error);
            alert("Ocurrió un error al enviar el mensaje.");
        });
    });
</script>
</body>
</html>