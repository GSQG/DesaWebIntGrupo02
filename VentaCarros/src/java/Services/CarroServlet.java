package Services;

import BusinessEntity.CarroBE;
import BusinessLogic.CarroBL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "CarroServlet", urlPatterns = {"/Carro.do"})
public class CarroServlet extends HttpServlet {

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
        String idParam = req.getParameter("idCarro");
        JSONObject json = new JSONObject();
        int status = HttpServletResponse.SC_OK;
        CarroBL bl = new CarroBL();

        if (idParam != null) {
            CarroBE c = bl.Read(idParam);
            if (c.getIdCarro() != 0) {
                JSONObject data = new JSONObject()
                        .put("idCarro", c.getIdCarro())
                        .put("idModelo", c.getIdModelo())
                        .put("nombre", c.getNombre())
                        .put("color", c.getColor())
                        .put("precio", c.getPrecioLista())
                        .put("descripcion", c.getDescripcion())
                        .put("ano", c.getAno())
                        .put("estado", c.getEstado())
                        .put("kilometraje", c.getKilometraje())
                        .put("tipoCombustible", c.getTipoCombustible())
                        .put("transmision", c.getTransmision())
                        .put("tallaRuedas", c.getTallaRuedas())
                        .put("comentarios", c.getComentarios());
                json.put("success", true).put("data", data).put("message", "Carro encontrado");
            } else {
                status = HttpServletResponse.SC_NOT_FOUND;
                json.put("success", false).put("message", "Carro no encontrado");
            }
        } else {
            List<CarroBE> list = bl.listar();
            JSONArray arr = new JSONArray();
            for (CarroBE c : list) {
                JSONObject item = new JSONObject()
                        .put("idCarro", c.getIdCarro())
                        .put("idModelo", c.getIdModelo())
                        .put("nombre", c.getNombre())
                        .put("color", c.getColor())
                        .put("precio", c.getPrecioLista())
                        .put("descripcion", c.getDescripcion())
                        .put("ano", c.getAno())
                        .put("estado", c.getEstado())
                        .put("kilometraje", c.getKilometraje())
                        .put("tipoCombustible", c.getTipoCombustible())
                        .put("transmision", c.getTransmision())
                        .put("tallaRuedas", c.getTallaRuedas())
                        .put("comentarios", c.getComentarios());
                arr.put(item);
            }
            json.put("success", true).put("data", arr).put("message", list.size() + " carros encontrados");
        }

        writeJson(resp, json, status);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String contentType = req.getContentType();
        boolean isJson = contentType != null && contentType.contains("application/json");
        String accion;
        CarroBE carro = new CarroBE();

        if (isJson) {
            JSONObject body = parseJson(req);
            accion = body.optString("accion", "insertar");
            carro.setIdModelo(body.getInt("idModelo"));
            carro.setNombre(body.getString("nombre"));
            carro.setColor(body.optString("color", ""));
            carro.setPrecioLista(body.getDouble("precio"));
            carro.setDescripcion(body.optString("descripcion", ""));
            carro.setAno(body.optInt("ano", 0));
            carro.setEstado(body.optString("estado", ""));
            carro.setKilometraje(body.optInt("kilometraje", 0));
            carro.setTipoCombustible(body.optString("tipoCombustible", ""));
            carro.setTransmision(body.optString("transmision", ""));
            carro.setTallaRuedas(body.optString("tallaRuedas", ""));
            carro.setComentarios(body.optString("comentarios", ""));
            if ("actualizar".equalsIgnoreCase(accion)) {
                carro.setIdCarro(body.getInt("idCarro"));
            }
        } else {
            accion = req.getParameter("accion");
            carro.setIdModelo(Integer.parseInt(req.getParameter("idModelo")));
            carro.setNombre(req.getParameter("nombre"));
            carro.setColor(req.getParameter("color"));
            carro.setPrecioLista(Double.parseDouble(req.getParameter("precio")));
            carro.setDescripcion(req.getParameter("descripcion"));
            carro.setAno(Integer.parseInt(req.getParameter("ano")));
            carro.setEstado(req.getParameter("estado"));
            carro.setKilometraje(Integer.parseInt(req.getParameter("kilometraje")));
            carro.setTipoCombustible(req.getParameter("tipoCombustible"));
            carro.setTransmision(req.getParameter("transmision"));
            carro.setTallaRuedas(req.getParameter("tallaRuedas"));
            carro.setComentarios(req.getParameter("comentarios"));
            if ("actualizar".equalsIgnoreCase(accion)) {
                carro.setIdCarro(Integer.parseInt(req.getParameter("idCarro")));
            }
        }

        CarroBL bl = new CarroBL();
        JSONObject json = new JSONObject();
        int status;
        boolean ok;

        if ("insertar".equalsIgnoreCase(accion)) {
            ok = bl.Create(carro);
            status = HttpServletResponse.SC_CREATED;
            json.put("message", ok ? "Carro creado" : "Error al crear");
        } else {
            ok = bl.Update(carro);
            status = HttpServletResponse.SC_OK;
            json.put("message", ok ? "Carro actualizado" : "Error al actualizar");
        }

        json.put("success", ok);

        if (isJson) {
            writeJson(resp, json, status);
        } else {
            resp.sendRedirect("carrolist.jsp");
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String contentType = req.getContentType();
        boolean isJson = contentType != null && contentType.contains("application/json");
        CarroBE carro = new CarroBE();

        if (isJson) {
            JSONObject body = parseJson(req);
            carro.setIdCarro(body.getInt("idCarro"));
            carro.setIdModelo(body.getInt("idModelo"));
            carro.setNombre(body.getString("nombre"));
            carro.setColor(body.optString("color", ""));
            carro.setPrecioLista(body.getDouble("precio"));
            carro.setDescripcion(body.optString("descripcion", ""));
            carro.setAno(body.optInt("ano", 0));
            carro.setEstado(body.optString("estado", ""));
            carro.setKilometraje(body.optInt("kilometraje", 0));
            carro.setTipoCombustible(body.optString("tipoCombustible", ""));
            carro.setTransmision(body.optString("transmision", ""));
            carro.setTallaRuedas(body.optString("tallaRuedas", ""));
            carro.setComentarios(body.optString("comentarios", ""));
        }

        CarroBL bl = new CarroBL();
        JSONObject json = new JSONObject();
        boolean ok = bl.Update(carro);
        int status = ok ? HttpServletResponse.SC_OK : HttpServletResponse.SC_BAD_REQUEST;

        json.put("success", ok).put("message", ok ? "Carro actualizado" : "Error al actualizar");

        if (isJson) {
            writeJson(resp, json, status);
        } else {
            resp.sendRedirect("carrolist.jsp");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JSONObject body = parseJson(req);
        int idCarro = body.getInt("idCarro");
        boolean ok = new CarroBL().Delete(String.valueOf(idCarro));
        JSONObject json = new JSONObject();
        int status = ok ? HttpServletResponse.SC_OK : HttpServletResponse.SC_BAD_REQUEST;
        json.put("success", ok).put("message", ok ? "Carro eliminado" : "Error al eliminar");
        writeJson(resp, json, status);
    }
}