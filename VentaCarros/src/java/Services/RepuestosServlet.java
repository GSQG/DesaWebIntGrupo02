package Services;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import org.json.JSONObject;

@WebServlet(name = "RepuestosServlet", urlPatterns = {"/Repuestos.do"})
public class RepuestosServlet extends HttpServlet {

    private JSONObject parseJson(HttpServletRequest req) throws IOException {
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = req.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }
        return new JSONObject(sb.toString());
    }

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
            if (req.getHeader("Accept").contains("application/json")) {
                jsonResponse.put("success", true)
                        .put("message", "Modo edición activado")
                        .put("redirect", "repuestoedit.jsp");
                writeJson(resp, jsonResponse, HttpServletResponse.SC_OK);
            } else {
                req.getRequestDispatcher("/repuestoedit.jsp").forward(req, resp);
            }
        } else {
            if (req.getHeader("Accept").contains("application/json")) {
                jsonResponse.put("success", true)
                        .put("message", "Listado de repuestos disponible")
                        .put("redirect", "repuestolist.jsp");
                writeJson(resp, jsonResponse, HttpServletResponse.SC_OK);
            } else {
                req.getRequestDispatcher("/repuestolist.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String contentType = req.getContentType();
        JSONObject jsonResponse = new JSONObject();

        if (contentType != null && contentType.contains("application/json")) {
            JSONObject requestBody = parseJson(req);
            jsonResponse.put("success", true)
                    .put("message", "Repuesto creado exitosamente")
                    .put("data", requestBody);
            writeJson(resp, jsonResponse, HttpServletResponse.SC_CREATED);
        } else {
            resp.sendRedirect("Repuestos.do");
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        JSONObject jsonResponse = new JSONObject();
        JSONObject requestBody = parseJson(req);

        jsonResponse.put("success", true)
                .put("message", "Repuesto actualizado exitosamente")
                .put("data", requestBody);
        writeJson(resp, jsonResponse, HttpServletResponse.SC_OK);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        JSONObject jsonResponse = new JSONObject();
        JSONObject requestBody = parseJson(req);

        jsonResponse.put("success", true)
                .put("message", "Repuesto eliminado exitosamente")
                .put("id", requestBody.getInt("id"));
        writeJson(resp, jsonResponse, HttpServletResponse.SC_OK);
    }
}