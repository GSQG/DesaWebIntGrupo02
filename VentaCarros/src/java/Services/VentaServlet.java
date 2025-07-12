package Services;

import BusinessLogic.VentaBL;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "VentaServlet", urlPatterns = {"/Venta.do"})
public class VentaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if(accion != null && accion.equalsIgnoreCase("edit")){
            request.getRequestDispatcher("/ventaedit.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/ventalist.jsp").forward(request, response);
        }
    }

}