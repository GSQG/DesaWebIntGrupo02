package Services;

import BusinessEntity.SedeBE;
import BusinessLogic.SedeBL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "SedeServlet", urlPatterns = {"/Sede.do"})
public class SedeServlet extends HttpServlet {

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
        SedeBL sedeBL = new SedeBL();
        JSONObject jsonResponse = new JSONObject();

        if (accion != null && accion.equalsIgnoreCase("edit")) {
            if (req.getHeader("Accept").contains("application/json")) {
                jsonResponse.put("success", true)
                        .put("message", "Modo edición activado")
                        .put("redirect", "sedeedit.jsp");
                writeJson(resp, jsonResponse, HttpServletResponse.SC_OK);
            } else {
                req.getRequestDispatcher("/sedeedit.jsp").forward(req, resp);
            }
        } else {
            List<SedeBE> sedes = sedeBL.listar();

            if (req.getHeader("Accept").contains("application/json")) {
                JSONArray sedesArray = new JSONArray();
                for (SedeBE sede : sedes) {
                    JSONObject sedeJson = new JSONObject()
                            .put("idSede", sede.getIdSede())
                            .put("nombre", sede.getNombre())
                            .put("direccion", sede.getDireccion())
                            .put("telefono", sede.getTelefono())
                            .put("estado", sede.getEstado());
                    sedesArray.put(sedeJson);
                }
                jsonResponse.put("success", true)
                        .put("data", sedesArray)
                        .put("message", sedes.size() + " sedes encontradas");
                writeJson(resp, jsonResponse, HttpServletResponse.SC_OK);
            } else {
                req.setAttribute("sedes", sedes);
                req.getRequestDispatcher("/sedelist.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String contentType = req.getContentType();
        SedeBL sedeBL = new SedeBL();
        JSONObject jsonResponse = new JSONObject();

        if (contentType != null && contentType.contains("application/json")) {
            JSONObject body = parseJson(req);
            SedeBE sede = new SedeBE();
            sede.setNombre(body.getString("nombre"));
            sede.setDireccion(body.optString("direccion", ""));
            sede.setTelefono(body.optString("telefono", ""));
            sede.setEstado(body.optString("estado", "1"));

            boolean resultado = sedeBL.insertar(sede);
            jsonResponse.put("success", resultado)
                    .put("message", resultado ? "Sede creada exitosamente" : "Error al crear sede");
            writeJson(resp, jsonResponse, resultado ? HttpServletResponse.SC_CREATED : HttpServletResponse.SC_BAD_REQUEST);
        } else {
            resp.sendRedirect("Sede.do");
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        JSONObject body = parseJson(req);
        SedeBL sedeBL = new SedeBL();
        JSONObject jsonResponse = new JSONObject();

        SedeBE sede = new SedeBE();
        sede.setIdSede(body.getInt("idSede"));
        sede.setNombre(body.getString("nombre"));
        sede.setDireccion(body.optString("direccion", ""));
        sede.setTelefono(body.optString("telefono", ""));
        sede.setEstado(body.optString("estado", "1"));

        boolean resultado = sedeBL.actualizar(sede);
        jsonResponse.put("success", resultado)
                .put("message", resultado ? "Sede actualizada exitosamente" : "Error al actualizar sede");
        writeJson(resp, jsonResponse, resultado ? HttpServletResponse.SC_OK : HttpServletResponse.SC_BAD_REQUEST);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        JSONObject body = parseJson(req);
        SedeBL sedeBL = new SedeBL();
        JSONObject jsonResponse = new JSONObject();

        boolean resultado = sedeBL.eliminar(String.valueOf(body.getInt("idSede")));
        jsonResponse.put("success", resultado)
                .put("message", resultado ? "Sede eliminada exitosamente" : "Error al eliminar sede");
        writeJson(resp, jsonResponse, resultado ? HttpServletResponse.SC_OK : HttpServletResponse.SC_BAD_REQUEST);
    }
}