package BusinessLogic;

import BusinessEntity.SedeBE;
import DataAccessObject.SedeDAO;
import java.util.List;

public class SedeBL {
    public List<SedeBE> listar() {
        SedeDAO dao = new SedeDAO();
        return dao.ReadAll();
    }
}