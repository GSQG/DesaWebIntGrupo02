package Services;

import BusinessEntity.CarroBE;
import DataAccessObject.CarroDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CarroServlet", urlPatterns = {"/Carro.do"})
public class CarroServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        CarroDAO dao = new CarroDAO();
        String idCarroParam = request.getParameter("idCarro");

        if (idCarroParam != null) {
            CarroBE carro = dao.Read(idCarroParam);
            JSONObject jsonCarro = new JSONObject();
            if (carro.getIdCarro() != 0) {
                jsonCarro.put("idCarro", carro.getIdCarro());
                jsonCarro.put("idModelo", carro.getIdModelo());
                jsonCarro.put("nombre", carro.getNombre());
                jsonCarro.put("color", carro.getColor());
                jsonCarro.put("precio", carro.getPrecioLista());
                jsonCarro.put("descripcion", carro.getDescripcion());
                jsonCarro.put("ano", carro.getAno());
                jsonCarro.put("estado", carro.getEstado());
                jsonCarro.put("kilometraje", carro.getKilometraje());
                jsonCarro.put("tipoCombustible", carro.getTipoCombustible());
                jsonCarro.put("transmision", carro.getTransmision());
                jsonCarro.put("tallaRuedas", carro.getTallaRuedas());
                jsonCarro.put("comentarios", carro.getComentarios());
                response.getWriter().print(jsonCarro.toString());
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().print(new JSONObject().put("error", "Carro no encontrado").toString());
            }
        } else {
            ArrayList<CarroBE> carros = dao.ReadAll();
            JSONArray jsonArray = new JSONArray();
            for (CarroBE carro : carros) {
                JSONObject obj = new JSONObject();
                obj.put("idCarro", carro.getIdCarro());
                obj.put("idModelo", carro.getIdModelo());
                obj.put("nombre", carro.getNombre());
                obj.put("color", carro.getColor());
                obj.put("precio", carro.getPrecioLista());
                obj.put("descripcion", carro.getDescripcion());
                obj.put("ano", carro.getAno());
                obj.put("estado", carro.getEstado());
                obj.put("kilometraje", carro.getKilometraje());
                obj.put("tipoCombustible", carro.getTipoCombustible());
                obj.put("transmision", carro.getTransmision());
                obj.put("tallaRuedas", carro.getTallaRuedas());
                obj.put("comentarios", carro.getComentarios());
                jsonArray.put(obj);
            }
            response.getWriter().print(jsonArray.toString());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CarroBE carro = new CarroBE();
        String contentType = request.getContentType();
        if (contentType != null && contentType.contains("application/json")) {
            StringBuilder sb = new StringBuilder();
            try (BufferedReader reader = request.getReader()) {
                String line;
                while ((line = reader.readLine()) != null) {
                    sb.append(line);
                }
            }
            JSONObject jsonRequest = new JSONObject(sb.toString());
            carro.setIdModelo(jsonRequest.getInt("idModelo"));
            carro.setNombre(jsonRequest.getString("nombre"));
            carro.setColor(jsonRequest.optString("color", ""));
            carro.setPrecioLista(jsonRequest.getDouble("precio"));
            carro.setDescripcion(jsonRequest.optString("descripcion", ""));
            carro.setAno(jsonRequest.optInt("ano", 0));
            carro.setEstado(jsonRequest.optString("estado", ""));
            carro.setKilometraje(jsonRequest.optInt("kilometraje", 0));
            carro.setTipoCombustible(jsonRequest.optString("tipoCombustible", ""));
            carro.setTransmision(jsonRequest.optString("transmision", ""));
            carro.setTallaRuedas(jsonRequest.optString("tallaRuedas", ""));
            carro.setComentarios(jsonRequest.optString("comentarios", ""));
        }
        CarroDAO dao = new CarroDAO();
        boolean creado = dao.Create(carro);
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("success", creado);
        jsonResponse.put("message", creado ? "Carro creado exitosamente" : "Error al crear el carro");
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().print(jsonResponse.toString());
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CarroBE carro = new CarroBE();
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }
        JSONObject jsonRequest = new JSONObject(sb.toString());
        carro.setIdCarro(jsonRequest.getInt("idCarro"));
        carro.setIdModelo(jsonRequest.getInt("idModelo"));
        carro.setNombre(jsonRequest.getString("nombre"));
        carro.setColor(jsonRequest.optString("color", ""));
        carro.setPrecioLista(jsonRequest.getDouble("precio"));
        carro.setDescripcion(jsonRequest.optString("descripcion", ""));
        carro.setAno(jsonRequest.optInt("ano", 0));
        carro.setEstado(jsonRequest.optString("estado", ""));
        carro.setKilometraje(jsonRequest.optInt("kilometraje", 0));
        carro.setTipoCombustible(jsonRequest.optString("tipoCombustible", ""));
        carro.setTransmision(jsonRequest.optString("transmision", ""));
        carro.setTallaRuedas(jsonRequest.optString("tallaRuedas", ""));
        carro.setComentarios(jsonRequest.optString("comentarios", ""));
        CarroDAO dao = new CarroDAO();
        boolean actualizado = dao.Update(carro);
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("success", actualizado);
        jsonResponse.put("message", actualizado ? "Carro actualizado exitosamente" : "Error al actualizar el carro");
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().print(jsonResponse.toString());
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }
        JSONObject jsonRequest = new JSONObject(sb.toString());
        int idCarro = jsonRequest.getInt("idCarro");
        CarroDAO dao = new CarroDAO();
        boolean eliminado = dao.Delete(String.valueOf(idCarro));
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("success", eliminado);
        jsonResponse.put("message", eliminado ? "Carro eliminado exitosamente" : "Error al eliminar el carro");
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().print(jsonResponse.toString());
    }
}
