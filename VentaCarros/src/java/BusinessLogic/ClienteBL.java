package BusinessLogic;

import BusinessEntity.ClienteBE;
import DataAccessObject.ClienteDAO;
import java.util.List;

public class ClienteBL {

    public List<ClienteBE> listar() {
        ClienteDAO dao = new ClienteDAO();
        return dao.ReadAll();
    }

    public boolean registrar(ClienteBE cliente) {
        ClienteDAO dao = new ClienteDAO();
        return dao.Create(cliente);
    }

    public boolean actualizar(ClienteBE cliente) {
        ClienteDAO dao = new ClienteDAO();
        return dao.Update(cliente);
    }

    public boolean eliminar(String id) {
        ClienteDAO dao = new ClienteDAO();
        return dao.Delete(id);
    }

    public ClienteBE buscar(String id) {
        ClienteDAO dao = new ClienteDAO();
        return dao.Read(id);
    }
}