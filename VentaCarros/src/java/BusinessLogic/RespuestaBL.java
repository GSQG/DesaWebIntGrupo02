package BusinessLogic;

import DataAccessObject.RespuestaDAO;
import BusinessEntity.RespuestaBE;

public class RespuestaBL {

    public String obtenerRespuesta(String pregunta) {
        RespuestaDAO dao = new RespuestaDAO();
        return dao.obtenerRespuesta(pregunta);
    }
}
