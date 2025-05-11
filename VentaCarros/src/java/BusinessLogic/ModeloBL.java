package BusinessLogic;

import BusinessEntity.ModeloBE;
import DataAccessObject.ModeloDAO;
import java.util.List;

public class ModeloBL {
    public List<ModeloBE> listar() {
        ModeloDAO dao = new ModeloDAO();
        return dao.ReadAll();
    }
}