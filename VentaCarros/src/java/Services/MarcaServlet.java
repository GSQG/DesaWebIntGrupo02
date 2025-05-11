package Services;

import BusinessLogic.MarcaBL;
import BusinessEntity.MarcaBE;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "MarcaServlet", urlPatterns = {"/Marca.do"})
public class MarcaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        MarcaBL bl = new MarcaBL();
        if (accion != null && accion.equalsIgnoreCase("delete")) {
            String id = request.getParameter("id");
            bl.eliminar(id);
            response.sendRedirect("Marca.do");
        } else if (accion != null && accion.equalsIgnoreCase("edit")) {
            request.getRequestDispatcher("/marcaform.jsp").forward(request, response);
        } else {
            List<MarcaBE> lista = bl.listar();
            request.setAttribute("listaMarcas", lista);
            request.getRequestDispatcher("/marcalist.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MarcaBL bl = new MarcaBL();
        MarcaBE marca = new MarcaBE();
        marca.setNombre(request.getParameter("nombre"));
        marca.setPaisOrigen(request.getParameter("paisOrigen"));
        marca.setSitioWeb(request.getParameter("sitioWeb"));

        String accion = request.getParameter("accion");
        if(accion.equalsIgnoreCase("insertar")){
            bl.registrar(marca);
        } else if(accion.equalsIgnoreCase("actualizar")){
            marca.setIdMarca(Integer.parseInt(request.getParameter("idMarca")));
            bl.actualizar(marca);
        }
        response.sendRedirect("Marca.do");
    }
}