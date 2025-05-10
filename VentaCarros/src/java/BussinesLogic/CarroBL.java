package BussinesLogic;

import BussinesEntity.CarroBE;
import DataAccesObject.CarroDAO;
import java.util.List;

public class CarroBL {
    public List<CarroBE> listar() {
        CarroDAO dao = new CarroDAO();
        return dao.ReadAll();
    }

}