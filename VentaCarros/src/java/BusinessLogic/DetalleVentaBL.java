package BusinessLogic;

import BusinessEntity.DetalleVentaBE;
import DataAccessObject.DetalleVentaDAO;
import java.util.List;

public class DetalleVentaBL {

    public List<DetalleVentaBE> listar() {
        DetalleVentaDAO dao = new DetalleVentaDAO();
        return dao.ReadAll();
    }

    public boolean registrar(DetalleVentaBE detalle) {
        DetalleVentaDAO dao = new DetalleVentaDAO();
        return dao.Create(detalle);
    }

    public boolean actualizar(DetalleVentaBE detalle) {
        DetalleVentaDAO dao = new DetalleVentaDAO();
        return dao.Update(detalle);
    }

    public boolean eliminar(String id) {
        DetalleVentaDAO dao = new DetalleVentaDAO();
        return dao.Delete(id);
    }

    public DetalleVentaBE buscar(String id) {
        DetalleVentaDAO dao = new DetalleVentaDAO();
        return dao.Read(id);
    }
}