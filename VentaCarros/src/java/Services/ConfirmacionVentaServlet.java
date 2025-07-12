package Services;

import BusinessLogic.ConfirmacionVentaBL;
import BusinessEntity.ConfirmacionVentaBE;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "ConfirmacionVentaServlet", urlPatterns = {"/ConfirmacionVenta.do"})
public class ConfirmacionVentaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        ConfirmacionVentaBL bl = new ConfirmacionVentaBL();

        if (accion != null && accion.equalsIgnoreCase("delete")) {
            String id = request.getParameter("id");
            bl.eliminar(id);
            response.sendRedirect("ConfirmacionVenta.do");
        } else if (accion != null && accion.equalsIgnoreCase("edit")) {
            request.getRequestDispatcher("/confirmacionventaform.jsp").forward(request, response);
        } else {
            List<ConfirmacionVentaBE> lista = bl.listar();
            request.setAttribute("listaConfirmaciones", lista);
            request.getRequestDispatcher("/confirmacionventalist.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ConfirmacionVentaBL bl = new ConfirmacionVentaBL();
        ConfirmacionVentaBE conf = new ConfirmacionVentaBE();
        conf.setIdVenta(Integer.parseInt(request.getParameter("idVenta")));

        String fecha = request.getParameter("fechaConfirmacion");
        if(fecha != null && !fecha.isEmpty()){
            Timestamp ts = Timestamp.valueOf(fecha);
            conf.setFechaConfirmacion(ts);
        } else {
            conf.setFechaConfirmacion(null);
        }

        conf.setEstado(request.getParameter("estado"));
        conf.setObservaciones(request.getParameter("observaciones"));

        String accion = request.getParameter("accion");
        if(accion.equalsIgnoreCase("insertar")){
            bl.registrar(conf);
        } else if(accion.equalsIgnoreCase("actualizar")){
            conf.setIdConfirmacion(Integer.parseInt(request.getParameter("idConfirmacion")));
            bl.actualizar(conf);
        }
        response.sendRedirect("ConfirmacionVenta.do");
    }
}