package BusinessLogic;

import BusinessEntity.VentaRepuestoBE;
import DataAccessObject.VentaRepuestoDAO;
import java.util.List;

public class VentaRepuestoBL {
    private final VentaRepuestoDAO dao = new VentaRepuestoDAO();

    public boolean Create(VentaRepuestoBE venta) {
        return dao.Create(venta);
    }

    public List<VentaRepuestoBE> listar() {
        return dao.ReadAll();
    }
}