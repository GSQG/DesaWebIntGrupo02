package Services;

import BusinessLogic.ClienteBL;
import BusinessEntity.ClienteBE;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "ClienteServlet", urlPatterns = {"/Cliente.do"})
public class ClienteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if(accion != null && accion.equalsIgnoreCase("edit")){
            request.getRequestDispatcher("/clienteform.jsp").forward(request, response);
        } else if(accion != null && accion.equalsIgnoreCase("delete")){
            String id = request.getParameter("id");
            ClienteBL bl = new ClienteBL();
            bl.eliminar(id);
            response.sendRedirect("Cliente.do");
        } else {
            ClienteBL bl = new ClienteBL();
            List<ClienteBE> lista = bl.listar();
            request.setAttribute("listaClientes", lista);
            request.getRequestDispatcher("/clientelist.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        ClienteBL bl = new ClienteBL();
        ClienteBE cliente = new ClienteBE();
        cliente.setNombres(request.getParameter("nombres"));
        cliente.setApellidos(request.getParameter("apellidos"));
        cliente.setEmail(request.getParameter("email"));
        cliente.setCelular(request.getParameter("celular"));
        cliente.setDireccion(request.getParameter("direccion"));
        cliente.setPreferenciaContacto(request.getParameter("preferenciaContacto"));
        cliente.setObservaciones(request.getParameter("observaciones"));
        if(accion.equalsIgnoreCase("insertar")){
            bl.registrar(cliente);
        } else if(accion.equalsIgnoreCase("actualizar")){
            cliente.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
            bl.actualizar(cliente);
        }
        response.sendRedirect("Cliente.do");
    }
}