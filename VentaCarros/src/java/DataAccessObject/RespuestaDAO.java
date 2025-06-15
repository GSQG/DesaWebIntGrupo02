package DataAccessObject;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RespuestaDAO {

    public boolean insertarPregunta(String pregunta) {
        boolean resultado = false;
        Connection conexion = null;
        PreparedStatement pstmt = null;
        try {
            conexion = new ConexionMySQL().getConexion();
            String sql = "INSERT INTO RespuestasRapidas (pregunta, respuesta) VALUES (?, '')";
            pstmt = conexion.prepareStatement(sql);
            pstmt.setString(1, pregunta);
            int filas = pstmt.executeUpdate();
            if (filas > 0) {
                resultado = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conexion != null) conexion.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return resultado;
    }

    public boolean actualizarRespuesta(int idRespuesta, String respuesta) {
        boolean resultado = false;
        Connection conexion = null;
        PreparedStatement pstmt = null;
        try {
            conexion = new ConexionMySQL().getConexion();
            String sql = "UPDATE RespuestasRapidas SET respuesta = ? WHERE idRespuesta = ?";
            pstmt = conexion.prepareStatement(sql);
            pstmt.setString(1, respuesta);
            pstmt.setInt(2, idRespuesta);
            int filas = pstmt.executeUpdate();
            if (filas > 0) {
                resultado = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conexion != null) conexion.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return resultado;
    }

    public String obtenerUltimoMensaje() {
        String mensaje = "No hay mensajes";
        Connection conexion = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conexion = new ConexionMySQL().getConexion();
            String sql = "SELECT CONCAT(pregunta, ' -- ', respuesta) AS mensaje FROM RespuestasRapidas ORDER BY idRespuesta DESC LIMIT 1";
            pstmt = conexion.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                mensaje = rs.getString("mensaje");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conexion != null) conexion.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return mensaje;
    }

    public List<String> listarMensajes() {
        List<String> mensajes = new ArrayList<>();
        Connection conexion = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conexion = new ConexionMySQL().getConexion();
            String sql = "SELECT pregunta FROM RespuestasRapidas ORDER BY idRespuesta DESC";
            pstmt = conexion.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                mensajes.add(rs.getString("pregunta"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conexion != null) conexion.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return mensajes;
    }

    public List<String> listarMensajesRespuestas() {
        List<String> mensajes = new ArrayList<>();
        Connection conexion = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conexion = new ConexionMySQL().getConexion();
            String sql = "SELECT respuesta FROM RespuestasRapidas ORDER BY idRespuesta DESC";
            pstmt = conexion.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                mensajes.add(rs.getString("respuesta"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conexion != null) conexion.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return mensajes;
    }

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