package Services;

import BusinessEntity.SedeBE;
import BusinessLogic.SedeBL;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "SedeServlet", urlPatterns = {"/Sede.do"})
public class SedeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null && accion.equalsIgnoreCase("edit")) {
            request.getRequestDispatcher("/sedeedit.jsp").forward(request, response);
        } else {
            SedeBL sedeBL = new SedeBL();
            List<SedeBE> sedes = sedeBL.listar();
            request.setAttribute("sedes", sedes);
            request.getRequestDispatcher("/sedelist.jsp").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("Operación POST en Sede");
    }
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("Operación PUT en Sede");
    }
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("Operación DELETE en Sede");
    }
}