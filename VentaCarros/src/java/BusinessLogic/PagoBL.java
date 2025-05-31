package BusinessLogic;

import BusinessEntity.PagoBE;
import DataAccessObject.PagoDAO;
import java.util.List;

public class PagoBL {

    public List<PagoBE> listar() {
        PagoDAO dao = new PagoDAO();
        return dao.ReadAll();
    }

    public boolean registrar(PagoBE pago) {
        PagoDAO dao = new PagoDAO();
        return dao.Create(pago);
    }

    public boolean actualizar(PagoBE pago) {
        PagoDAO dao = new PagoDAO();
        return dao.Update(pago);
    }

    public boolean eliminar(String id) {
        PagoDAO dao = new PagoDAO();
        return dao.Delete(id);
    }

    public PagoBE buscar(String id) {
        PagoDAO dao = new PagoDAO();
        return dao.Read(id);
    }
}