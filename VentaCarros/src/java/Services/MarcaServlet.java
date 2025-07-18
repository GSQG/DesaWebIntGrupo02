package Services;

import BusinessLogic.MarcaBL;
import BusinessEntity.MarcaBE;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet(name = "MarcaServlet", urlPatterns = {"/Marca.do"})
public class MarcaServlet extends HttpServlet {

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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");
        MarcaBL bl = new MarcaBL();
        JSONObject json = new JSONObject();
        int status = HttpServletResponse.SC_OK;

        if (accion != null && accion.equalsIgnoreCase("delete")) {
            String id = req.getParameter("id");
            boolean eliminado = bl.eliminar(id);
            json.put("success", eliminado)
                    .put("message", eliminado ? "Marca eliminada" : "Error al eliminar marca");
            status = eliminado ? HttpServletResponse.SC_OK : HttpServletResponse.SC_BAD_REQUEST;
        } else {
            List<MarcaBE> lista = bl.listar();
            JSONArray arr = new JSONArray();
            for (MarcaBE marca : lista) {
                JSONObject item = new JSONObject()
                        .put("idMarca", marca.getIdMarca())
                        .put("nombre", marca.getNombre())
                        .put("paisOrigen", marca.getPaisOrigen())
                        .put("sitioWeb", marca.getSitioWeb());
                arr.put(item);
            }
            json.put("success", true)
                    .put("data", arr)
                    .put("message", lista.size() + " marcas encontradas");
        }

        writeJson(resp, json, status);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String contentType = req.getContentType();
        boolean isJson = contentType != null && contentType.contains("application/json");
        MarcaBE marca = new MarcaBE();
        MarcaBL bl = new MarcaBL();
        JSONObject json = new JSONObject();
        int status;
        boolean resultado;

        if (isJson) {
            JSONObject body = parseJson(req);
            marca.setNombre(body.getString("nombre"));
            marca.setPaisOrigen(body.optString("paisOrigen", ""));
            marca.setSitioWeb(body.optString("sitioWeb", ""));

            if (body.has("idMarca") && body.getInt("idMarca") > 0) {
                marca.setIdMarca(body.getInt("idMarca"));
                resultado = bl.actualizar(marca);
                status = resultado ? HttpServletResponse.SC_OK : HttpServletResponse.SC_BAD_REQUEST;
                json.put("message", resultado ? "Marca actualizada" : "Error al actualizar marca");
            } else {
                resultado = bl.registrar(marca);
                status = resultado ? HttpServletResponse.SC_CREATED : HttpServletResponse.SC_BAD_REQUEST;
                json.put("message", resultado ? "Marca creada" : "Error al crear marca");
            }
        } else {
            marca.setNombre(req.getParameter("nombre"));
            marca.setPaisOrigen(req.getParameter("paisOrigen"));
            marca.setSitioWeb(req.getParameter("sitioWeb"));

            String accion = req.getParameter("accion");
            if (accion != null && accion.equalsIgnoreCase("actualizar")) {
                marca.setIdMarca(Integer.parseInt(req.getParameter("idMarca")));
                resultado = bl.actualizar(marca);
                json.put("message", resultado ? "Marca actualizada" : "Error al actualizar marca");
            } else {
                resultado = bl.registrar(marca);
                json.put("message", resultado ? "Marca creada" : "Error al crear marca");
            }
            status = resultado ? HttpServletResponse.SC_OK : HttpServletResponse.SC_BAD_REQUEST;
        }

        json.put("success", resultado);

        if (isJson) {
            writeJson(resp, json, status);
        } else {
            resp.sendRedirect("Marca.do");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JSONObject body = parseJson(req);
        String id = body.getString("id");
        boolean eliminado = new MarcaBL().eliminar(id);
        JSONObject json = new JSONObject();
        int status = eliminado ? HttpServletResponse.SC_OK : HttpServletResponse.SC_BAD_REQUEST;
        json.put("success", eliminado)
                .put("message", eliminado ? "Marca eliminada" : "Error al eliminar marca");
        writeJson(resp, json, status);
    }
}