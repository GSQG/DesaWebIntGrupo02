package BusinessLogic;

import BusinessEntity.SedeBE;
import DataAccessObject.SedeDAO;
import java.util.List;
import java.util.ArrayList;

public class SedeBL {
    private final SedeDAO sedeDAO;

    public SedeBL() {
        this.sedeDAO = new SedeDAO();
    }

    public List<SedeBE> listar() {
        return sedeDAO.ReadAll();
    }

    public SedeBE obtenerPorId(String id) {
        return sedeDAO.Read(id);
    }

    public boolean insertar(SedeBE sede) {
        return sedeDAO.Create(sede);
    }

    public boolean actualizar(SedeBE sede) {
        return sedeDAO.Update(sede);
    }

    public boolean eliminar(String id) {
        return sedeDAO.Delete(id);
    }

    public List<SedeBE> buscarPorNombre(String nombre) {
        List<SedeBE> sedes = listar();
        List<SedeBE> resultados = new ArrayList<>();

        for (SedeBE sede : sedes) {
            if (sede.getNombre().toLowerCase().contains(nombre.toLowerCase())) {
                resultados.add(sede);
            }
        }
        return resultados;
    }

    public boolean cambiarEstado(String id, String nuevoEstado) {
        SedeBE sede = obtenerPorId(id);
        if (sede != null) {
            sede.setEstado(nuevoEstado);
            return actualizar(sede);
        }
        return false;
    }
}