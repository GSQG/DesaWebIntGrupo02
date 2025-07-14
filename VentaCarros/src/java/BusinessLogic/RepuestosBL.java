package BusinessLogic;

import BusinessEntity.RepuestosBE;
import DataAccessObject.RepuestosDAO;
import java.util.List;

public class RepuestosBL {
    private final RepuestosDAO dao = new RepuestosDAO();

    public List<RepuestosBE> listar() {
        return dao.ReadAll();
    }

    public RepuestosBE Read(String id) {
        return dao.Read(id);
    }

    public boolean Update(RepuestosBE repuesto) {
        return dao.Update(repuesto);
    }
}