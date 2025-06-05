package DataAccessObject;

import BusinessEntity.RepuestosBE;
import java.sql.*;
import java.util.ArrayList;

public class RepuestosDAO extends ConexionMySQL implements IBaseDAO<RepuestosBE> {

    @Override
    public boolean Create(RepuestosBE repuesto) {
        boolean resultado = false;
        try {
            String SQL = "INSERT INTO Repuestos (nombre, material, marca, costo, categoria, descripcion, stock, compatibilidad) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setString(1, repuesto.getNombre());
            pst.setString(2, repuesto.getMaterial());
            pst.setString(3, repuesto.getMarca());
            pst.setDouble(4, repuesto.getCosto());
            pst.setString(5, repuesto.getCategoria());
            pst.setString(6, repuesto.getDescripcion());
            pst.setInt(7, repuesto.getStock());
            pst.setString(8, repuesto.getCompatibilidad());
            resultado = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Create: " + e.getMessage());
        }
        return resultado;
    }

    @Override
    public RepuestosBE Read(String id) {
        RepuestosBE repuesto = new RepuestosBE();
        try {
            PreparedStatement pst = getConexion().prepareStatement("SELECT * FROM Repuestos WHERE id_repuesto = ?");
            pst.setInt(1, Integer.parseInt(id));
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                repuesto.setIdRepuesto(rs.getInt("id_repuesto"));
                repuesto.setNombre(rs.getString("nombre"));
                repuesto.setMaterial(rs.getString("material"));
                repuesto.setMarca(rs.getString("marca"));
                repuesto.setCosto(rs.getDouble("costo"));
                repuesto.setCategoria(rs.getString("categoria"));
                repuesto.setDescripcion(rs.getString("descripcion"));
                repuesto.setStock(rs.getInt("stock"));
                repuesto.setCompatibilidad(rs.getString("compatibilidad"));
            }
        } catch (SQLException e) {
            System.out.println("Error en Read: " + e.getMessage());
        }
        return repuesto;
    }

    @Override
    public ArrayList<RepuestosBE> ReadAll() {
        ArrayList<RepuestosBE> listaRepuestos = new ArrayList<>();
        try {
            Statement stm = getConexion().createStatement();
            ResultSet rs = stm.executeQuery("SELECT * FROM Repuestos");
            while (rs.next()) {
                RepuestosBE repuesto = new RepuestosBE();
                repuesto.setIdRepuesto(rs.getInt("id_repuesto"));
                repuesto.setNombre(rs.getString("nombre"));
                repuesto.setMaterial(rs.getString("material"));
                repuesto.setMarca(rs.getString("marca"));
                repuesto.setCosto(rs.getDouble("costo"));
                repuesto.setCategoria(rs.getString("categoria"));
                repuesto.setDescripcion(rs.getString("descripcion"));
                repuesto.setStock(rs.getInt("stock"));
                repuesto.setCompatibilidad(rs.getString("compatibilidad"));
                listaRepuestos.add(repuesto);
            }
        } catch (SQLException e) {
            System.out.println("Error en ReadAll: " + e.getMessage());
        }
        return listaRepuestos;
    }

    @Override
    public boolean Update(RepuestosBE repuesto) {
        boolean resultado = false;
        try {
            String SQL = "UPDATE Repuestos SET nombre=?, material=?, marca=?, costo=?, categoria=?, descripcion=?, stock=?, compatibilidad=? WHERE id_repuesto=?";
            PreparedStatement pst = getConexion().prepareStatement(SQL);
            pst.setString(1, repuesto.getNombre());
            pst.setString(2, repuesto.getMaterial());
            pst.setString(3, repuesto.getMarca());
            pst.setDouble(4, repuesto.getCosto());
            pst.setString(5, repuesto.getCategoria());
            pst.setString(6, repuesto.getDescripcion());
            pst.setInt(7, repuesto.getStock());
            pst.setString(8, repuesto.getCompatibilidad());
            pst.setInt(9, repuesto.getIdRepuesto());
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
            PreparedStatement pst = getConexion().prepareStatement("DELETE FROM Repuestos WHERE id_repuesto=?");
            pst.setInt(1, Integer.parseInt(id));
            resultado = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error en Delete: " + e.getMessage());
        }
        return resultado;
    }
}