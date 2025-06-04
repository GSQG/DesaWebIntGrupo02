package Services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "ModeloServlet", urlPatterns = {"/Modelo.do"})
public class ModeloServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if(accion != null && accion.equalsIgnoreCase("edit")){
            request.getRequestDispatcher("/modeloedit.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/modelolist.jsp").forward(request, response);
        }
    }

}