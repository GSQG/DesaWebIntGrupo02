package BusinessLogic;

import BusinessEntity.VentaBE;
import DataAccessObject.VentaDAO;
import java.util.List;

public class VentaBL {
    private final VentaDAO dao = new VentaDAO();

    public boolean Create(VentaBE venta) {
        return dao.Create(venta);
    }

    public List<VentaBE> listar() {
        return dao.ReadAll();
    }
}