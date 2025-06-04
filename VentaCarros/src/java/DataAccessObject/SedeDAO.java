package DataAccessObject;

import BusinessEntity.SedeBE;
import java.sql.*;
import java.util.ArrayList;

public class SedeDAO extends ConexionMySQL implements IBaseDAO<SedeBE> {

    @Override
    public boolean Create(SedeBE sede) {
        boolean resultado = false;
        try {
            String SQL = "INSERT INTO Sedes (nombre, direccion, telefono, horario, ciudad, estado) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setString(1, sede.getNombre());
            pst.setString(2, sede.getDireccion());
            pst.setString(3, sede.getTelefono());
            pst.setString(4, sede.getHorario());
            pst.setString(5, sede.getCiudad());
            pst.setString(6, sede.getEstado());
            resultado = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Create: " + e.getMessage());
        }
        return resultado;
    }

    @Override
    public SedeBE Read(String id) {
        SedeBE sede = new SedeBE();
        try {
            PreparedStatement pst = getConexion().prepareStatement("SELECT * FROM Sedes WHERE id_sede = ?");
            pst.setInt(1, Integer.parseInt(id));
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                sede.setIdSede(rs.getInt("id_sede"));
                sede.setNombre(rs.getString("nombre"));
                sede.setDireccion(rs.getString("direccion"));
                sede.setTelefono(rs.getString("telefono"));
                sede.setHorario(rs.getString("horario"));
                sede.setCiudad(rs.getString("ciudad"));
                sede.setEstado(rs.getString("estado"));
            }
        } catch (SQLException e) {
            System.out.println("Error en Read: " + e.getMessage());
        }
        return sede;
    }

    @Override
    public ArrayList<SedeBE> ReadAll() {
        ArrayList<SedeBE> listaSedes = new ArrayList<>();
        try {
            Statement stm = getConexion().createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM Sedes");
            while (rs.next()) {
                SedeBE sede = new SedeBE();
                sede.setIdSede(rs.getInt("id_sede"));
                sede.setNombre(rs.getString("nombre"));
                sede.setDireccion(rs.getString("direccion"));
                sede.setTelefono(rs.getString("telefono"));
                sede.setHorario(rs.getString("horario"));
                sede.setCiudad(rs.getString("ciudad"));
                sede.setEstado(rs.getString("estado"));
                listaSedes.add(sede);
            }
        } catch (SQLException e) {
            System.out.println("Error en ReadAll: " + e.getMessage());
        }
        return listaSedes;
    }

    @Override
    public boolean Update(SedeBE sede) {
        boolean resultado = false;
        try {
            String SQL = "UPDATE Sedes SET nombre=?, direccion=?, telefono=?, horario=?, ciudad=?, estado=? WHERE id_sede=?";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setString(1, sede.getNombre());
            pst.setString(2, sede.getDireccion());
            pst.setString(3, sede.getTelefono());
            pst.setString(4, sede.getHorario());
            pst.setString(5, sede.getCiudad());
            pst.setString(6, sede.getEstado());
            pst.setInt(7, sede.getIdSede());
            resultado = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Update: " + e.getMessage());
        }
        return resultado;
    }

    @Override
    public boolean Delete(String id) {
        boolean resultado = false;
        try {
            PreparedStatement pst = getConexion().prepareStatement("DELETE FROM Sedes WHERE id_sede=?");
            pst.setInt(1, Integer.parseInt(id));
            resultado = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Delete: " + e.getMessage());
        }
        return resultado;
    }
}