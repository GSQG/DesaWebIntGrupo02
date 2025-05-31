package Services;

import BusinessLogic.PagoBL;
import BusinessEntity.PagoBE;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "PagoServlet", urlPatterns = {"/Pago.do"})
public class PagoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        PagoBL bl = new PagoBL();
        if (accion != null && accion.equalsIgnoreCase("delete")) {
            String id = request.getParameter("id");
            bl.eliminar(id);
            response.sendRedirect("Pago.do");
        } else if (accion != null && accion.equalsIgnoreCase("edit")) {
            request.getRequestDispatcher("/pagoform.jsp").forward(request, response);
        } else {
            List<PagoBE> lista = bl.listar();
            request.setAttribute("listaPagos", lista);
            request.getRequestDispatcher("/pagolist.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PagoBL bl = new PagoBL();
        PagoBE pago = new PagoBE();
        pago.setIdVenta(Integer.parseInt(request.getParameter("idVenta")));
        pago.setIdMetodo(Integer.parseInt(request.getParameter("idMetodo")));
        pago.setMonto(Double.parseDouble(request.getParameter("monto")));
        pago.setReferenciaPago(request.getParameter("referenciaPago"));
        pago.setEstado(request.getParameter("estado"));
        String accion = request.getParameter("accion");
        if(accion.equalsIgnoreCase("insertar")){
            bl.registrar(pago);
        } else if(accion.equalsIgnoreCase("actualizar")){
            pago.setIdPago(Integer.parseInt(request.getParameter("idPago")));
            bl.actualizar(pago);
        }
        response.sendRedirect("Pago.do");
    }
}