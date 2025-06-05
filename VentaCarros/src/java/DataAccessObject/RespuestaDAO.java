import java.sql.*;

public class RespuestaDAO {
    public String obtenerRespuesta(String pregunta) {
        String respuesta = "Lo siento, no tenemos una respuesta para esa pregunta."; 
        Connection conexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            conexion = new ConexionMySQL().getConexion();
            String sql = "SELECT respuesta FROM RespuestasRapidas WHERE pregunta = ?";
            preparedStatement = conexion.prepareStatement(sql);
            preparedStatement.setString(1, pregunta);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                respuesta = resultSet.getString("respuesta");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (conexion != null) conexion.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return respuesta; 
    }
}
