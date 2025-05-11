package BusinessLogic;

import BusinessEntity.MetodoPagoBE;
import DataAccessObject.MetodoPagoDAO;
import java.util.List;

public class MetodoPagoBL {

    public List<MetodoPagoBE> listar() {
        MetodoPagoDAO dao = new MetodoPagoDAO();
        return dao.ReadAll();
    }

    public boolean registrar(MetodoPagoBE metodo) {
        MetodoPagoDAO dao = new MetodoPagoDAO();
        return dao.Create(metodo);
    }

    public boolean actualizar(MetodoPagoBE metodo) {
        MetodoPagoDAO dao = new MetodoPagoDAO();
        return dao.Update(metodo);
    }

    public boolean eliminar(String id) {
        MetodoPagoDAO dao = new MetodoPagoDAO();
        return dao.Delete(id);
    }

    public MetodoPagoBE buscar(String id) {
        MetodoPagoDAO dao = new MetodoPagoDAO();
        return dao.Read(id);
    }
}