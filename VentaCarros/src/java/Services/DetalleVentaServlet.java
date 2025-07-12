package Services;

import BusinessLogic.DetalleVentaBL;
import BusinessEntity.DetalleVentaBE;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "DetalleVentaServlet", urlPatterns = {"/DetalleVenta.do"})
public class DetalleVentaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        DetalleVentaBL bl = new DetalleVentaBL();
        if (accion != null && accion.equalsIgnoreCase("delete")) {
            String id = request.getParameter("id");
            bl.eliminar(id);
            response.sendRedirect("DetalleVenta.do");
        } else if (accion != null && accion.equalsIgnoreCase("edit")) {
            request.getRequestDispatcher("/detalleventaform.jsp").forward(request, response);
        } else {
            List<DetalleVentaBE> lista = bl.listar();
            request.setAttribute("listaDetalleVenta", lista);
            request.getRequestDispatcher("/detallesventalist.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DetalleVentaBL bl = new DetalleVentaBL();
        DetalleVentaBE detalle = new DetalleVentaBE();
        detalle.setIdVenta(Integer.parseInt(request.getParameter("idVenta")));
        detalle.setIdCarro(Integer.parseInt(request.getParameter("idCarro")));
        detalle.setPrecioUnitario(Double.parseDouble(request.getParameter("precioUnitario")));
        detalle.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
        detalle.setComentarioLinea(request.getParameter("comentarioLinea"));
        detalle.setTalla(request.getParameter("talla"));

        String accion = request.getParameter("accion");
        if(accion.equalsIgnoreCase("insertar")){
            bl.registrar(detalle);
        } else if(accion.equalsIgnoreCase("actualizar")){
            detalle.setIdDetalle(Integer.parseInt(request.getParameter("idDetalle")));
            bl.actualizar(detalle);
        }

        response.sendRedirect("DetalleVenta.do");
    }
}