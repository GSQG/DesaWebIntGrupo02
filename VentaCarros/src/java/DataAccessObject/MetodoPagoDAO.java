package DataAccessObject;

import BusinessEntity.MetodoPagoBE;
import java.sql.*;
import java.util.ArrayList;

public class MetodoPagoDAO extends ConexionMySQL implements IBaseDAO<MetodoPagoBE> {

    @Override
    public boolean Create(MetodoPagoBE metodo) {
        boolean result = false;
        try {
            String SQL = "INSERT INTO MetodosPago (nombre, descripcion, inflacion_applicable) VALUES (?,?,?)";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setString(1, metodo.getNombre());
            pst.setString(2, metodo.getDescripcion());
            pst.setBoolean(3, metodo.isInflacionApplicable());
            result = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Create MetodoPago: " + e.getMessage());
        }
        return result;
    }

    @Override
    public MetodoPagoBE Read(String id) {
        MetodoPagoBE metodo = new MetodoPagoBE();
        try {
            PreparedStatement pst = getConexion().prepareStatement("SELECT * FROM MetodosPago WHERE id_metodo=?");
            pst.setInt(1, Integer.parseInt(id));
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                metodo.setIdMetodo(rs.getInt("id_metodo"));
                metodo.setNombre(rs.getString("nombre"));
                metodo.setDescripcion(rs.getString("descripcion"));
                metodo.setInflacionApplicable(rs.getBoolean("inflacion_applicable"));
            }
        } catch (SQLException e) {
            System.out.println("Error en Read MetodoPago: " + e.getMessage());
        }
        return metodo;
    }

    @Override
    public ArrayList<MetodoPagoBE> ReadAll() {
        ArrayList<MetodoPagoBE> lista = new ArrayList<>();
        try {
            Statement stm = getConexion().createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM MetodosPago");
            while (rs.next()){
                MetodoPagoBE metodo = new MetodoPagoBE();
                metodo.setIdMetodo(rs.getInt("id_metodo"));
                metodo.setNombre(rs.getString("nombre"));
                metodo.setDescripcion(rs.getString("descripcion"));
                metodo.setInflacionApplicable(rs.getBoolean("inflacion_applicable"));
                lista.add(metodo);
            }
        } catch(SQLException e) {
            System.out.println("Error en ReadAll MetodoPago: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public boolean Update(MetodoPagoBE metodo) {
        boolean result = false;
        try {
            String SQL = "UPDATE MetodosPago SET nombre=?, descripcion=?, inflacion_applicable=? WHERE id_metodo=?";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setString(1, metodo.getNombre());
            pst.setString(2, metodo.getDescripcion());
            pst.setBoolean(3, metodo.isInflacionApplicable());
            pst.setInt(4, metodo.getIdMetodo());
            result = pst.executeUpdate() > 0;
        } catch(SQLException e) {
            System.out.println("Error en Update MetodoPago: " + e.getMessage());
        }
        return result;
    }

    @Override
    public boolean Delete(String id) {
        boolean result = false;
        try {
            PreparedStatement pst = getConexion().prepareStatement("DELETE FROM MetodosPago WHERE id_metodo=?");
            pst.setInt(1, Integer.parseInt(id));
            result = pst.executeUpdate() > 0;
        } catch(SQLException e) {
            System.out.println("Error en Delete MetodoPago: " + e.getMessage());
        }
        return result;
    }
}