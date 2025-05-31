package BusinessLogic;

import BusinessEntity.MarcaBE;
import DataAccessObject.MarcaDAO;
import java.util.List;

public class MarcaBL {

    public List<MarcaBE> listar() {
        MarcaDAO dao = new MarcaDAO();
        return dao.ReadAll();
    }

    public boolean registrar(MarcaBE marca) {
        MarcaDAO dao = new MarcaDAO();
        return dao.Create(marca);
    }

    public boolean actualizar(MarcaBE marca) {
        MarcaDAO dao = new MarcaDAO();
        return dao.Update(marca);
    }

    public boolean eliminar(String id) {
        MarcaDAO dao = new MarcaDAO();
        return dao.Delete(id);
    }

    public MarcaBE buscar(String id) {
        MarcaDAO dao = new MarcaDAO();
        return dao.Read(id);
    }
}