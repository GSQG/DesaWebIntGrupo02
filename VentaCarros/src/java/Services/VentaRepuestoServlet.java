package Services;

import BusinessEntity.RepuestosBE;
import BusinessEntity.VentaRepuestoBE;
import BusinessLogic.RepuestosBL;
import BusinessLogic.VentaRepuestoBL;
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

@WebServlet(name = "VentaRepuestoServlet", urlPatterns = {"/VentaRepuesto.do"})
public class VentaRepuestoServlet extends HttpServlet {

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

        int idRepuesto = body.getInt("idRepuesto");
        int cantidad = body.getInt("cantidad");

        RepuestosBL repuestosBL = new RepuestosBL();
        RepuestosBE repuesto = repuestosBL.Read(String.valueOf(idRepuesto));

        if (repuesto == null || repuesto.getIdRepuesto() == 0) {
            json.put("success", false).put("message", "El repuesto no existe");
            status = HttpServletResponse.SC_BAD_REQUEST;
        } else if (repuesto.getStock() < cantidad) {
            json.put("success", false).put("message", "No hay suficiente stock disponible");
            status = HttpServletResponse.SC_BAD_REQUEST;
        } else {
            VentaRepuestoBE venta = new VentaRepuestoBE();
            venta.setIdRepuesto(idRepuesto);
            venta.setNombreCliente(body.getString("nombreCliente"));
            venta.setDireccion(body.getString("direccion"));
            venta.setTelefono(body.getString("telefono"));
            venta.setMedioPago(body.getString("medioPago"));
            venta.setFechaVencimiento(body.optString("fechaVencimiento", null));
            venta.setCvv(body.optString("cvv", null));
            venta.setFechaVenta(new Timestamp(System.currentTimeMillis()));
            venta.setPrecioVenta(repuesto.getCosto() * cantidad);
            venta.setNombreRepuesto(repuesto.getNombre());
            venta.setMarcaRepuesto(repuesto.getMarca());
            venta.setCantidad(cantidad);
            venta.setCompatibilidadRepuesto(repuesto.getCompatibilidad());

            VentaRepuestoBL ventaBL = new VentaRepuestoBL();
            ok = ventaBL.Create(venta);

            if (ok) {
                // Actualizar el stock del repuesto
                repuesto.setStock(repuesto.getStock() - cantidad);
                ok = repuestosBL.Update(repuesto);
                json.put("success", ok).put("message", ok ? "Venta registrada y stock actualizado" : "Venta registrada pero no se pudo actualizar el stock");
            } else {
                json.put("success", false).put("message", "Error al registrar la venta");
            }
            status = ok ? HttpServletResponse.SC_OK : HttpServletResponse.SC_INTERNAL_SERVER_ERROR;
        }

        writeJson(resp, json, status);
    }
}