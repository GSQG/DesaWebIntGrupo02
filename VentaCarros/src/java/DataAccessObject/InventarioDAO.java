package DataAccessObject;

import BusinessEntity.InventarioBE;
import java.sql.*;
import java.util.ArrayList;

public class InventarioDAO extends ConexionMySQL implements IBaseDAO<InventarioBE> {

    @Override
    public boolean Create(InventarioBE inv) {
        boolean result = false;
        try {
            String SQL = "INSERT INTO Inventario (id_carro, cantidad, ubicacion, notas) VALUES (?,?,?,?)";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setInt(1, inv.getIdCarro());
            pst.setInt(2, inv.getCantidad());
            pst.setString(3, inv.getUbicacion());
            pst.setString(4, inv.getNotas());
            result = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Create Inventario: " + e.getMessage());
        }
        return result;
    }

    @Override
    public InventarioBE Read(String id) {
        InventarioBE inv = new InventarioBE();
        try {
            PreparedStatement pst = getConexion().prepareStatement("SELECT * FROM Inventario WHERE id_inventario=?");
            pst.setInt(1, Integer.parseInt(id));
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                inv.setIdInventario(rs.getInt("id_inventario"));
                inv.setIdCarro(rs.getInt("id_carro"));
                inv.setCantidad(rs.getInt("cantidad"));
                inv.setUbicacion(rs.getString("ubicacion"));
                inv.setNotas(rs.getString("notas"));
                inv.setFechaUltimaActualizacion(rs.getTimestamp("fecha_ultima_actualizacion"));
            }
        } catch (SQLException e) {
            System.out.println("Error en Read Inventario: " + e.getMessage());
        }
        return inv;
    }

    @Override
    public ArrayList<InventarioBE> ReadAll() {
        ArrayList<InventarioBE> lista = new ArrayList<>();
        try {
            Statement stm = getConexion().createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM Inventario");
            while (rs.next()) {
                InventarioBE inv = new InventarioBE();
                inv.setIdInventario(rs.getInt("id_inventario"));
                inv.setIdCarro(rs.getInt("id_carro"));
                inv.setCantidad(rs.getInt("cantidad"));
                inv.setUbicacion(rs.getString("ubicacion"));
                inv.setNotas(rs.getString("notas"));
                inv.setFechaUltimaActualizacion(rs.getTimestamp("fecha_ultima_actualizacion"));
                lista.add(inv);
            }
        } catch (SQLException e) {
            System.out.println("Error en ReadAll Inventario: " + e.getMessage());
        }
        return lista;
    }

    @Override
    public boolean Update(InventarioBE inv) {
        boolean result = false;
        try {
            String SQL = "UPDATE Inventario SET id_carro=?, cantidad=?, ubicacion=?, notas=? WHERE id_inventario=?";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setInt(1, inv.getIdCarro());
            pst.setInt(2, inv.getCantidad());
            pst.setString(3, inv.getUbicacion());
            pst.setString(4, inv.getNotas());
            pst.setInt(5, inv.getIdInventario());
            result = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Update Inventario: " + e.getMessage());
        }
        return result;
    }

    @Override
    public boolean Delete(String id) {
        boolean result = false;
        try {
            PreparedStatement pst = getConexion().prepareStatement("DELETE FROM Inventario WHERE id_inventario=?");
            pst.setInt(1, Integer.parseInt(id));
            result = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Delete Inventario: " + e.getMessage());
        }
        return result;
    }
}