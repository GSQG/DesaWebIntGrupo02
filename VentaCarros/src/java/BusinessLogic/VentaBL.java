package BusinessLogic;

import BusinessEntity.VentaBE;
import DataAccessObject.VentaDAO;
import java.util.List;

public class VentaBL {
    public List<VentaBE> listar() {
        VentaDAO dao = new VentaDAO();
        return dao.ReadAll();
    }

}