package Services;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import DataAccessObject.RespuestaDAO;
import org.json.JSONObject;

@WebServlet(name = "RespuestaRapidaServlet", urlPatterns = {"/respuestasRapidas.do"})
public class RespuestaRapidaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pregunta = request.getParameter("pregunta");
        response.setContentType("application/json; charset=UTF-8");
        JSONObject jsonResponse = new JSONObject();

        if (pregunta != null && !pregunta.trim().isEmpty()) {
            RespuestaDAO dao = new RespuestaDAO();
            boolean insertado = dao.insertarPregunta(pregunta);

            if (insertado) {
                String mensaje = dao.obtenerUltimoMensaje();
                jsonResponse.put("success", true)
                        .put("message", mensaje);
            } else {
                jsonResponse.put("success", false)
                        .put("message", "Error al insertar el mensaje");
            }
        } else {
            jsonResponse.put("success", false)
                    .put("message", "Pregunta no válida o vacía");
        }

        response.getWriter().write(jsonResponse.toString());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json; charset=UTF-8");
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("success", false)
                .put("message", "Método GET no soportado. Use POST");
        response.getWriter().write(jsonResponse.toString());
    }
}