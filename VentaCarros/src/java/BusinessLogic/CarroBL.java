package BusinessLogic;

import BusinessEntity.CarroBE;
import DataAccessObject.CarroDAO;
import java.util.List;

public class CarroBL {
    private final CarroDAO dao = new CarroDAO();

    public boolean Create(CarroBE carro) {
        return dao.Create(carro);
    }

    public boolean Update(CarroBE carro) {
        return dao.Update(carro);
    }

    public boolean Delete(String idCarro) {
        return dao.Delete(idCarro);
    }

    public CarroBE Read(String idCarro) {
        return dao.Read(idCarro);
    }

    public List<CarroBE> listar() {
        return dao.ReadAll();
    }
}
