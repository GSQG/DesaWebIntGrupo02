package BusinessLogic;

import BusinessEntity.CarroBE;
import DataAccessObject.CarroDAO;
import java.util.List;

public class CarroBL {
    public List<CarroBE> listar() {
        CarroDAO dao = new CarroDAO();
        return dao.ReadAll();
    }

}