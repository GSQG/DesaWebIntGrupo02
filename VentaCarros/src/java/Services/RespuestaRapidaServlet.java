package Services;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import DataAccessObject.RespuestaDAO;

@WebServlet(name = "RespuestaRapidaServlet", urlPatterns = {"/respuestasRapidas.do"})
public class RespuestaRapidaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pregunta = request.getParameter("pregunta");
        response.setContentType("text/plain; charset=UTF-8");

        if (pregunta != null && !pregunta.trim().isEmpty()) {
            RespuestaDAO dao = new RespuestaDAO();
            boolean insertado = dao.insertarPregunta(pregunta);
            String mensaje;
            if (insertado) {
                mensaje = dao.obtenerUltimoMensaje();
            } else {
                mensaje = "Error al insertar el mensaje.";
            }
            response.getWriter().write(mensaje);
        } else {
            response.getWriter().write("Pregunta no válida o vacía.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}