package Services;

import DataAccessObject.RespuestaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "RespuestaRapidaServlet", urlPatterns = {"/respuestasRapidas.do"})
public class RespuestaRapidaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pregunta = request.getParameter("pregunta");
        if (pregunta != null) {
            RespuestaDAO respuestaDAO = new RespuestaDAO();
            String respuesta = respuestaDAO.obtenerRespuesta(pregunta);
            response.setContentType("text/plain");
            response.getWriter().write(respuesta);
        } else {
            response.getWriter().write("Pregunta no válida.");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RespuestaDAO respuestaDAO = new RespuestaDAO();
        String pregunta = request.getParameter("pregunta");
        if (pregunta != null && !pregunta.trim().isEmpty()) {
            String respuesta = respuestaDAO.obtenerRespuesta(pregunta);
            response.setContentType("text/plain");
            response.getWriter().write(respuesta);
        } else {
            response.getWriter().write("Pregunta no válida o vacía.");
        }
    }
}
