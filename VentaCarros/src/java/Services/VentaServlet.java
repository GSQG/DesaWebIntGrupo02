package Services;

import BusinessEntity.CarroBE;
import BusinessEntity.VentaBE;
import BusinessLogic.CarroBL;
import BusinessLogic.VentaBL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import org.json.JSONObject;

@WebServlet(name = "VentaServlet", urlPatterns = {"/Venta.do"})
public class VentaServlet extends HttpServlet {

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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JSONObject body = parseJson(req);
        JSONObject json = new JSONObject();
        int status;
        boolean ok;

        int idCarro = body.getInt("idCarro");
        CarroBL carroBL = new CarroBL();
        CarroBE carro = carroBL.Read(String.valueOf(idCarro));

        if (carro == null || carro.getIdCarro() == 0) {
            json.put("success", false).put("message", "El carro no existe");
            status = HttpServletResponse.SC_BAD_REQUEST;
        } else {
            VentaBE venta = new VentaBE();
            venta.setIdCarro(idCarro);
            venta.setNombreCliente(body.getString("nombreCliente"));
            venta.setDireccion(body.getString("direccion"));
            venta.setTelefono(body.getString("telefono"));
            venta.setMedioPago(body.getString("medioPago"));
            venta.setFechaVencimiento(body.optString("fechaVencimiento", null));
            venta.setCvv(body.optString("cvv", null));
            venta.setFechaVenta(new Timestamp(System.currentTimeMillis()));
            venta.setPrecioVenta(carro.getPrecioLista());
            venta.setModeloCarro(carro.getNombre());
            venta.setAnoCarro(carro.getAno());
            venta.setColorCarro(carro.getColor());
            venta.setEstadoCarro(carro.getEstado());
            venta.setKilometrajeCarro(carro.getKilometraje());
            venta.setTipoCombustibleCarro(carro.getTipoCombustible());
            venta.setTransmisionCarro(carro.getTransmision());

            VentaBL ventaBL = new VentaBL();
            ok = ventaBL.Create(venta);

            if (ok) {
                ok = carroBL.Delete(String.valueOf(idCarro));
                json.put("success", ok).put("message", ok ? "Venta registrada y carro eliminado" : "Venta registrada pero no se pudo eliminar el carro");
            } else {
                json.put("success", false).put("message", "Error al registrar la venta");
            }
            status = ok ? HttpServletResponse.SC_OK : HttpServletResponse.SC_INTERNAL_SERVER_ERROR;
        }

        writeJson(resp, json, status);
    }
}