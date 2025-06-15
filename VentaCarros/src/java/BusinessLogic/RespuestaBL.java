package BusinessLogic;

import DataAccessObject.RespuestaDAO;

public class RespuestaBL {

    public String obtenerRespuesta(String pregunta) {
        RespuestaDAO dao = new RespuestaDAO();
        return dao.obtenerRespuesta(pregunta);
    }

    public String enviarMensaje(String pregunta) {
        RespuestaDAO dao = new RespuestaDAO();
        if(dao.insertarPregunta(pregunta)) {
            return dao.obtenerUltimoMensaje();
        } else {
            return "Error al insertar el mensaje.";
        }
    }
}