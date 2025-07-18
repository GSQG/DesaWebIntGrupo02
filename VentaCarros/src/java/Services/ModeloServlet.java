package Services;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import org.json.JSONObject;

@WebServlet(name = "ModeloServlet", urlPatterns = {"/Modelo.do"})
public class ModeloServlet extends HttpServlet {

    private void writeJson(HttpServletResponse resp, JSONObject json, int status) throws IOException {
        resp.setStatus(status);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            out.print(json.toString());
            out.flush();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String accion = req.getParameter("accion");
        JSONObject jsonResponse = new JSONObject();

        if (accion != null && accion.equalsIgnoreCase("edit")) {
            String accept = req.getHeader("Accept");

            if (accept != null && accept.contains("application/json")) {
                // Respuesta JSON para API
                jsonResponse.put("success", true)
                        .put("message", "Modo edición activado")
                        .put("redirect", "modeloedit.jsp");
                writeJson(resp, jsonResponse, HttpServletResponse.SC_OK);
            } else {
                req.getRequestDispatcher("/modeloedit.jsp").forward(req, resp);
            }
        } else {
            String accept = req.getHeader("Accept");

            if (accept != null && accept.contains("application/json")) {
                jsonResponse.put("success", true)
                        .put("message", "Listado de modelos disponible")
                        .put("redirect", "modelolist.jsp");
                writeJson(resp, jsonResponse, HttpServletResponse.SC_OK);
            } else {
                req.getRequestDispatcher("/modelolist.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String contentType = req.getContentType();
        JSONObject jsonResponse = new JSONObject();

        if (contentType != null && contentType.contains("application/json")) {
            jsonResponse.put("success", true)
                    .put("message", "Operación POST recibida")
                    .put("note", "Implementar lógica de negocio aquí");
            writeJson(resp, jsonResponse, HttpServletResponse.SC_OK);
        } else {
            resp.sendRedirect("Modelo.do");
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("success", true)
                .put("message", "Operación PUT recibida")
                .put("note", "Implementar lógica de actualización aquí");
        writeJson(resp, jsonResponse, HttpServletResponse.SC_OK);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("success", true)
                .put("message", "Operación DELETE recibida")
                .put("note", "Implementar lógica de eliminación aquí");
        writeJson(resp, jsonResponse, HttpServletResponse.SC_OK);
    }
}