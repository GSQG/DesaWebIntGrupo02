package BusinessLogic;

import BusinessEntity.ConfirmacionVentaBE;
import DataAccessObject.ConfirmacionVentaDAO;
import java.util.List;

public class ConfirmacionVentaBL {

    public List<ConfirmacionVentaBE> listar() {
        ConfirmacionVentaDAO dao = new ConfirmacionVentaDAO();
        return dao.ReadAll();
    }

    public boolean registrar(ConfirmacionVentaBE conf) {
        ConfirmacionVentaDAO dao = new ConfirmacionVentaDAO();
        return dao.Create(conf);
    }

    public boolean actualizar(ConfirmacionVentaBE conf) {
        ConfirmacionVentaDAO dao = new ConfirmacionVentaDAO();
        return dao.Update(conf);
    }

    public boolean eliminar(String id) {
        ConfirmacionVentaDAO dao = new ConfirmacionVentaDAO();
        return dao.Delete(id);
    }

    public ConfirmacionVentaBE buscar(String id) {
        ConfirmacionVentaDAO dao = new ConfirmacionVentaDAO();
        return dao.Read(id);
    }
}