package Services;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "UsuarioServlet", urlPatterns = {"/Usuario.do"})
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if(accion != null && accion.equalsIgnoreCase("edit")){
            request.getRequestDispatcher("/usuarioedit.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/usuariolist.jsp").forward(request, response);
        }
    }
}