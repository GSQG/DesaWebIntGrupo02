package BusinessLogic;

import BusinessEntity.UsuarioBE;
import DataAccessObject.UsuarioDAO;
import java.util.List;

public class UsuarioBL {
    public List<UsuarioBE> listar() {
        UsuarioDAO dao = new UsuarioDAO();
        return dao.ReadAll();
    }
}