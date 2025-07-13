<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>Venta de Carros</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="include_css.jsp"/>
    <link href="dist/css/adminlte.css" rel="stylesheet" type="text/css"/>
    <link href="dist/css/custom-login.css" rel="stylesheet" type="text/css"/>
  </head>
  <body class="login-page bg-body-secondary">
    <div class="login-box">
    <div class="login-logo">
      <a href="#"><span class="text-bold">Venta de Carros</span></a>
    </div>
      <div class="card">
        <div class="card-body login-card-body">
          <p class="login-box-msg">Iniciar Sesión</p>
          <% if (request.getAttribute("error") != null) { %>
            <p class="text-danger"><%= request.getAttribute("error") %></p>
          <% } %>
          <% if (session.getAttribute("mensaje") != null) { %>
            <p class="text-info"><%= session.getAttribute("mensaje") %></p>
          <% } %>
          <form action="LoginServlet" method="post">
            <div class="input-group mb-3">
              <input type="text" name="username" class="form-control" placeholder="Email"/>
              <div class="input-group-text"><span class="bi bi-envelope"></span></div>
            </div>
            <div class="input-group mb-3">
              <input type="password" name="password" class="form-control" placeholder="Contraseña"/>
              <div class="input-group-text"><span class="bi bi-lock-fill"></span></div>
            </div>
            <div class="row">
              <div class="col-8">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="flexCheckDefault"/>
                  <label class="form-check-label" for="flexCheckDefault">Recordar sesión</label>
                </div>
              </div>
              <div class="col-4">
                <button type="submit" class="btn btn-primary btn-block">Ingresar</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <jsp:include page="include_js.jsp"/>
  </body>
</html>