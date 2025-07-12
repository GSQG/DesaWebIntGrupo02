package Services;

import BusinessLogic.InventarioBL;
import BusinessEntity.InventarioBE;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "InventarioServlet", urlPatterns = {"/Inventario.do"})
public class InventarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        InventarioBL bl = new InventarioBL();
        if (accion != null && accion.equalsIgnoreCase("delete")) {
            String id = request.getParameter("id");
            bl.eliminar(id);
            response.sendRedirect("Inventario.do");
        } else if (accion != null && accion.equalsIgnoreCase("edit")) {
            request.getRequestDispatcher("/inventarioform.jsp").forward(request, response);
        } else {
            List<InventarioBE> lista = bl.listar();
            request.setAttribute("listaInventario", lista);
            request.getRequestDispatcher("/inventariolist.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        InventarioBL bl = new InventarioBL();
        InventarioBE inv = new InventarioBE();
        inv.setIdCarro(Integer.parseInt(request.getParameter("idCarro")));
        inv.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
        inv.setUbicacion(request.getParameter("ubicacion"));
        inv.setNotas(request.getParameter("notas"));
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("insertar")) {
            bl.registrar(inv);
        } else if (accion.equalsIgnoreCase("actualizar")) {
            inv.setIdInventario(Integer.parseInt(request.getParameter("idInventario")));
            bl.actualizar(inv);
        }
        response.sendRedirect("Inventario.do");
    }
}