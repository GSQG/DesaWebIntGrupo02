package BusinessLogic;

import BusinessEntity.InventarioBE;
import DataAccessObject.InventarioDAO;
import java.util.List;

public class InventarioBL {

    public List<InventarioBE> listar() {
        InventarioDAO dao = new InventarioDAO();
        return dao.ReadAll();
    }

    public boolean registrar(InventarioBE inv) {
        InventarioDAO dao = new InventarioDAO();
        return dao.Create(inv);
    }

    public boolean actualizar(InventarioBE inv) {
        InventarioDAO dao = new InventarioDAO();
        return dao.Update(inv);
    }

    public boolean eliminar(String id) {
        InventarioDAO dao = new InventarioDAO();
        return dao.Delete(id);
    }

    public InventarioBE buscar(String id) {
        InventarioDAO dao = new InventarioDAO();
        return dao.Read(id);
    }
}