<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Venta de Carros</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="include_css.jsp"/>
        <!--end::Third Party Plugin(Bootstrap Icons)-->
        <!--begin::Required Plugin(AdminLTE)-->
        <link href="dist/css/adminlte.css" rel="stylesheet" type="text/css"/>
        <!--end::Required Plugin(AdminLTE)-->
    </head>
    <body class="login-page bg-body-secondary">

        <div class="login-box">
            <div class="login-logo">
                <a href="../index2.html"><b>Venta </b>De </b>Carros</a>
            </div>
            <!-- /.login-logo -->
            <div class="card">
                <div class="card-body login-card-body">
                    <p class="login-box-msg">Iniciar Sesion</p>
                    <%-- Mostrar mensajes de error--%>
                    <% if( request.getAttribute("error")!= null ){ %>
                        <p style="color:red;"><%=request.getAttribute("error")%></p>
                    <%}%>
                    <% if( session.getAttribute("mensaje")!= null ){ %>
                        <p style="color:blue;"><%=session.getAttribute("mensaje")%></p>
                    <%}%>
                    <form action="LoginServlet" method="post">
                        <div class="input-group mb-3">
                            <input type="text" name="username" class="form-control" placeholder="Email"/>
                            <div class="input-group-text"><span class="bi bi-envelope"></span></div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="password" name="password" class="form-control" placeholder="Contraseña" />
                            <div class="input-group-text"><span class="bi bi-lock-fill"></span></div>
                        </div>
                        <!--begin::Row-->
                        <div class="row">
                            <div class="col-8">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
                                    <label class="form-check-label" for="flexCheckDefault"> Recordar </label>
                                </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-4">
                                <div class="d-grid gap-2">
                                    <button type="submit" class="btn btn-primary">Ingresar</button>
                                </div>
                            </div>
                            <!-- /.col -->
                        </div>
                        <!--end::Row-->
                    </form>
                    <!--
                    <div class="social-auth-links text-center mb-3 d-grid gap-2">
                        <p>- OR -</p>
                        <a href="#" class="btn btn-primary">
                            <i class="bi bi-facebook me-2"></i> Sign in using Facebook
                        </a>
                        <a href="#" class="btn btn-danger">
                            <i class="bi bi-google me-2"></i> Sign in using Google+
                        </a>
                    </div>
                    <p class="mb-1"><a href="forgot-password.html">I forgot my password</a></p>
                    <p class="mb-0">
                        <a href="register.html" class="text-center"> Register a new membership </a>
                    </p>
                    -->
                </div>
                <!-- /.login-card-body -->
            </div>
        </div>
        <!-- /.login-box -->

        <jsp:include page="include_js.jsp"/>
    </body>
</html>
