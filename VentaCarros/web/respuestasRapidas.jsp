<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="DataAccessObject.RespuestaDAO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mensajes en Cascada</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Estilos simples para la burbuja de mensaje */
        .mensaje {
            padding: 10px 15px;
            background: #f1f1f1;
            border-radius: 10px;
            margin-bottom: 10px;
            max-width: 70%;
        }
        .mensaje-container {
            display: flex;
            flex-direction: column;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h1 class="mb-4">Envía tu mensaje</h1>
    <form id="preguntaForm" class="mb-4">
        <div class="mb-3">
            <label for="pregunta" class="form-label">Escribe tu mensaje:</label>
            <input type="text" class="form-control" id="pregunta" name="pregunta" required>
        </div>
        <button type="submit" class="btn btn-primary">Enviar</button>
    </form>

    <!-- Sección para mostrar los mensajes -->
    <h2>Historial de mensajes</h2>
    <div id="listaMensajes" class="mensaje-container">
        <%
            // Crear una instancia del DAO para listar los mensajes al cargar el JSP
            RespuestaDAO dao = new RespuestaDAO();
            List<String> mensajes = dao.listarMensajes();
            if(mensajes != null && !mensajes.isEmpty()){
                for(String msg : mensajes){
        %>
        <div class="mensaje">
            <%= msg %>
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

<!-- Código de JS para enviar mensaje vía fetch -->
<script>
    const baseUrl = "<%= request.getContextPath() %>";

    document.getElementById("preguntaForm").addEventListener("submit", function(event) {
        event.preventDefault();
        var pregunta = document.getElementById("pregunta").value;

        fetch(baseUrl + "/respuestasRapidas.do", {
            method: "POST",
            body: new URLSearchParams({
                "pregunta": pregunta
            })
        })
        .then(response => response.text())
        .then(data => {
            // Después de enviar, se recarga la lista de mensajes.
            // Aquí, para simplicidad, vamos a recargar la página.
            // Alternativamente se podría hacer una llamada AJAX para actualizar solo la sección.
            location.reload();
        })
        .catch(error => {
            console.error("Error en la petición fetch:", error);
            alert("Ocurrió un error al enviar el mensaje.");
        });
    });
</script>

</body>
</html>