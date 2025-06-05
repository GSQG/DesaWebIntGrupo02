<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Respuestas Rápidas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Respuestas Rápidas</h1>

    <form id="preguntaForm">
        <div class="mb-3">
            <label for="pregunta" class="form-label">¿Tienes alguna pregunta?</label>
            <input type="text" class="form-control" id="pregunta" name="pregunta" required>
        </div>
        <button type="submit" class="btn btn-primary">Enviar</button>
    </form>

    <div id="respuesta" class="mt-3"></div>

    <script>
        document.getElementById("preguntaForm").addEventListener("submit", function(event) {
            event.preventDefault();
            var pregunta = document.getElementById("pregunta").value;

            fetch("/respuestasRapidas.do", {
                method: "POST",
                body: new URLSearchParams({
                    "pregunta": pregunta
                })
            })
            .then(response => response.text())
            .then(data => {
                document.getElementById("respuesta").innerText = data;
            });
        });
    </script>
</div>
</body>
</html>
