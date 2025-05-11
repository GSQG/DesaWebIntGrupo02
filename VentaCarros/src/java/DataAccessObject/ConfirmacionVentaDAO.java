package DataAccessObject;

import BusinessEntity.ConfirmacionVentaBE;
import java.sql.*;
import java.util.ArrayList;

public class ConfirmacionVentaDAO extends ConexionMySQL implements IBaseDAO<ConfirmacionVentaBE> {

    @Override
    public boolean Create(ConfirmacionVentaBE conf) {
        boolean result = false;
        try {
            String SQL = "INSERT INTO ConfirmacionesVenta (id_venta, fecha_confirmacion, estado, observaciones) VALUES (?,?,?,?)";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setInt(1, conf.getIdVenta());
            pst.setTimestamp(2, conf.getFechaConfirmacion());
            pst.setString(3, conf.getEstado());
            pst.setString(4, conf.getObservaciones());
            result = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Create ConfirmacionVenta: " + e.getMessage());
        }
        return result;
    }

    @Override
    public ConfirmacionVentaBE Read(String id) {
        ConfirmacionVentaBE conf = new ConfirmacionVentaBE();
        try {
            PreparedStatement pst = getConexion().prepareStatement("SELECT * FROM ConfirmacionesVenta WHERE id_confirmacion=?");
            pst.setInt(1, Integer.parseInt(id));
            ResultSet rs = pst.executeQuery();
            if (rs.next()){
                conf.setIdConfirmacion(rs.getInt("id_confirmacion"));
                conf.setIdVenta(rs.getInt("id_venta"));
                conf.setFechaConfirmacion(rs.getTimestamp("fecha_confirmacion"));
                conf.setEstado(rs.getString("estado"));
                conf.setObservaciones(rs.getString("observaciones"));
            }
        } catch(SQLException e) {
            System.out.println("Error en Read ConfirmacionVenta: " + e.getMessage());
        }
        return conf;
    }

    @Override
    public ArrayList<ConfirmacionVentaBE> ReadAll() {
        ArrayList<ConfirmacionVentaBE> lista = new ArrayList<>();
        try {
            Statement stm = getConexion().createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM ConfirmacionesVenta");
            while (rs.next()){
                ConfirmacionVentaBE conf = new ConfirmacionVentaBE();
                conf.setIdConfirmacion(rs.getInt("id_confirmacion"));
                conf.setIdVenta(rs.getInt("id_venta"));
                conf.setFechaConfirmacion(rs.getTimestamp("fecha_confirmacion"));
                conf.setEstado(rs.getString("estado"));
                conf.setObservaciones(rs.getString("observaciones"));
                lista.add(conf);
            }
        } catch(SQLException e) {
            System.out.println("Error en ReadAll ConfirmacionVenta: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public boolean Update(ConfirmacionVentaBE conf) {
        boolean result = false;
        try {
            String SQL = "UPDATE ConfirmacionesVenta SET id_venta=?, fecha_confirmacion=?, estado=?, observaciones=? WHERE id_confirmacion=?";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setInt(1, conf.getIdVenta());
            pst.setTimestamp(2, conf.getFechaConfirmacion());
            pst.setString(3, conf.getEstado());
            pst.setString(4, conf.getObservaciones());
            pst.setInt(5, conf.getIdConfirmacion());
            result = pst.executeUpdate() > 0;
        } catch(SQLException e) {
            System.out.println("Error en Update ConfirmacionVenta: " + e.getMessage());
        }
        return result;
    }

    @Override
    public boolean Delete(String id) {
        boolean result = false;
        try {
            PreparedStatement pst = getConexion().prepareStatement("DELETE FROM ConfirmacionesVenta WHERE id_confirmacion=?");
            pst.setInt(1, Integer.parseInt(id));
            result = pst.executeUpdate() > 0;
        } catch(SQLException e) {
            System.out.println("Error en Delete ConfirmacionVenta: " + e.getMessage());
        }
        return result;
    }
}