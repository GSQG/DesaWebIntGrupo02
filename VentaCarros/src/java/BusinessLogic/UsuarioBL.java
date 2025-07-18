package BusinessLogic;

import BusinessEntity.UsuarioBE;
import DataAccessObject.UsuarioDAO;
import java.util.List;

public class UsuarioBL {
    private final UsuarioDAO usuarioDAO;

    public UsuarioBL() {
        this.usuarioDAO = new UsuarioDAO();
    }

    public List<UsuarioBE> listar() {
        return usuarioDAO.ReadAll();
    }

    public UsuarioBE obtenerPorId(String id) {
        return usuarioDAO.Read(id);
    }

    public boolean crear(UsuarioBE usuario) {
        return usuarioDAO.Create(usuario);
    }

    public boolean actualizar(UsuarioBE usuario) {
        return usuarioDAO.Update(usuario);
    }

    public boolean eliminar(String id) {
        return usuarioDAO.Delete(id);
    }

    public UsuarioBE autenticar(String email, String contrasena) {
        return usuarioDAO.autenticar(email, contrasena);
    }

    public boolean existeEmail(String email) {
        return usuarioDAO.ReadAll().stream()
                .anyMatch(u -> u.getEmail().equalsIgnoreCase(email));
    }
}