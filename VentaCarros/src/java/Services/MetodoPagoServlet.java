package Services;

import BusinessLogic.MetodoPagoBL;
import BusinessEntity.MetodoPagoBE;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "MetodoPagoServlet", urlPatterns = {"/MetodoPago.do"})
public class MetodoPagoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        MetodoPagoBL bl = new MetodoPagoBL();
        if(accion != null && accion.equalsIgnoreCase("delete")){
            String id = request.getParameter("id");
            bl.eliminar(id);
            response.sendRedirect("MetodoPago.do");
        } else if(accion != null && accion.equalsIgnoreCase("edit")){
            request.getRequestDispatcher("/metodopagoform.jsp").forward(request, response);
        } else {
            List<MetodoPagoBE> lista = bl.listar();
            request.setAttribute("listaMetodoPago", lista);
            request.getRequestDispatcher("/metodopagolist.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MetodoPagoBL bl = new MetodoPagoBL();
        MetodoPagoBE metodo = new MetodoPagoBE();
        metodo.setNombre(request.getParameter("nombre"));
        metodo.setDescripcion(request.getParameter("descripcion"));
        metodo.setInflacionApplicable(request.getParameter("inflacionApplicable") != null);

        String accion = request.getParameter("accion");
        if(accion.equalsIgnoreCase("insertar")){
            bl.registrar(metodo);
        } else if(accion.equalsIgnoreCase("actualizar")){
            metodo.setIdMetodo(Integer.parseInt(request.getParameter("idMetodo")));
            bl.actualizar(metodo);
        }
        response.sendRedirect("MetodoPago.do");
    }
}