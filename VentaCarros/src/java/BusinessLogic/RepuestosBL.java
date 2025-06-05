package BusinessLogic;

import BusinessEntity.RepuestosBE;
import DataAccessObject.RepuestosDAO;
import java.util.List;

public class RepuestosBL {
    private RepuestosDAO dao;

    public RepuestosBL(RepuestosDAO dao) {
        this.dao = dao;
    }

    public RepuestosBL() {
        this.dao = new RepuestosDAO();
    }

    public List<RepuestosBE> listar() {
        try {
            return dao.ReadAll();
        } catch (Exception e) {
            System.err.println("Error al listar los repuestos: " + e.getMessage());
            return null;
        }
    }
}