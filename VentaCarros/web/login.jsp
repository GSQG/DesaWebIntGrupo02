<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <title>Deluxe Drive</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="include_css.jsp"/>
    <link href="dist/css/adminlte.css" rel="stylesheet" type="text/css"/>
    <link href="dist/css/custom-login.css" rel="stylesheet" type="text/css"/>
    <style>
      body.login-page {
        background-image: url('dist/images/fondoCompra.jpg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        background-attachment: fixed;
      }
    </style>
  </head>
  <body class="login-page bg-body-secondary">
    <div class="login-box">
      <div class="login-logo">
        <a href="#"><span class="text-bold">Deluxe Drive</span></a>
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
          <form action="LoginServlet" method="post" autocomplete="on">
            <div class="input-group mb-3">
                <input type="email" name="username" class="form-control" placeholder="Email"
                       autocomplete="email" required />
                <div class="input-group-text"><span class="bi bi-envelope"></span></div>
              </div>
              <div class="input-group mb-3">
                <input type="password" name="password" class="form-control" placeholder="Contraseña"
                       autocomplete="current-password" required />
                <div class="input-group-text"><span class="bi bi-lock-fill"></span></div>
              </div>
            <div class="row">
              <div class="col-8">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="flexCheckDefault"
                         autocomplete="off"/>
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